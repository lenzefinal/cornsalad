package com.devone.finalp.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devone.finalp.board.model.vo.Board;
import com.devone.finalp.board.model.vo.Board_Pagectr;
import com.devone.finalp.board.model.vo.Board_Reply;
import com.devone.finalp.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;

	@RequestMapping(value = "blist.do")
	public String boardList(Model model, int page, String c_id) {
		int limit=10;
		int listcount = bService.getlistCount(c_id);
		int startnum = (page-1) * limit +1;
		int endnum = startnum + limit -1;
		int maxpage = (int)((double)listcount/limit + 0.9);
		int startpage = (((int)((double)page/limit + 0.9))-1) * limit + 1;
		int endpage = startpage + limit -1;
		if(maxpage < endpage) {
			endpage = maxpage;
		}
		Board_Pagectr bp = new Board_Pagectr(startnum, endnum,startpage,endpage,maxpage,page,c_id);
		model.addAttribute("blist", bService.selectbList(bp));
		model.addAttribute("pagectr", bp);
		
		return "board/boardList";
	}

	@RequestMapping(value = "writeForm.do")
	public String writeForm() {
		return "board/bwriteForm";
	}

	@RequestMapping(value = "/binsert.do")
	public String insertBoard(Board b, HttpServletRequest request) throws IOException {
		// 파일 업로드 처리
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile uploadFile = multipartRequest.getFile("uploadFile");

		// 웹서버 컨테이너 경로 추출함
		String root = request.getSession().getServletContext().getRealPath("/");
		// 파일 저장 경로 정함
		String savePath = root + "uploadFiles/";
		b.setOri_filename("파일 없음");
		b.setRe_filename("null");
		if (!uploadFile.isEmpty()) {
			String ofileName = uploadFile.getOriginalFilename();
			long currentTime = System.currentTimeMillis();
			SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rfileName = simDf.format(new Date(currentTime)) + "."
					+ ofileName.substring(ofileName.lastIndexOf(".") + 1);
			;
			uploadFile.transferTo(new File(savePath + rfileName));

			b.setOri_filename(ofileName);
			b.setRe_filename(rfileName);
		}

		bService.insertBoard(b);

		return "redirect:blist.do?page=1";
	}

	@RequestMapping(value = "bdetail.do")
	public String BoardDetail(Model model, Board b, HttpServletRequest rq) {
		if (b.getBoard_id() == 0) {
			b.setBoard_id(Integer.parseInt(rq.getParameter("b_id")));
		}
		model.addAttribute("board", bService.selectb(b.getBoard_id()));
		model.addAttribute("brlist", bService.selectbrList());
		return "board/boardDetail";
	}

	@RequestMapping("/bdownfile.do")
	public void fileDownload(@RequestParam(value = "rfile") String rfileName,
			@RequestParam(value = "ofile") String ofileName, HttpServletResponse response, HttpServletRequest request) {
		// 프로젝트 내에 파일이 저장된 곳의 위치를 얻어옴
		String saveFolder = request.getSession().getServletContext().getRealPath("/uploadFiles/");

		BufferedInputStream buf = null;
		ServletOutputStream downOut = null;

		try {
			downOut = response.getOutputStream();
			File downfile = new File(saveFolder + "/" + rfileName);
			response.setContentType("text/plain; charset=utf-8");
			// 한글 파일명 인코딩 처리
			response.addHeader("Content-Disposition",
					"attachment; filename=\"" + new String(ofileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			response.setContentLength((int) downfile.length());

			FileInputStream input = new FileInputStream(downfile);
			buf = new BufferedInputStream(input);
			int readBytes = 0;

			while ((readBytes = buf.read()) != -1) {
				downOut.write(readBytes);
			}
			downOut.close();
			buf.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "brwrite.do")
	public String insertBoardR(Board_Reply br, RedirectAttributes ra, HttpServletResponse response) throws IOException {
		if(br.getMember_id() == ""){
			PrintWriter output = response.getWriter();
			output.println("<script language='javascript'>");
			output.println("alert('Please log in again')");
			output.println("history.back();");
			output.println("</script>");
			output.close();
		}else {
		ra.addFlashAttribute("board_id", br.getBoard_id());
		bService.insertBoard_Reply(br);
		}
		return "redirect:bdetail.do?b_id=" + br.getBoard_id();
	}

	@RequestMapping(value = "bimg.do")
	public void writeImg(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 파일 업로드 처리
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile uploadFile = multipartRequest.getFile("uploadFile");

		// 웹서버 컨테이너 경로 추출함
		String root = request.getSession().getServletContext().getRealPath("resources/");
		// 파일 저장 경로 정함
		String savePath = root + "uploadImages/";

		if (!uploadFile.isEmpty()) {
			String ofileName = uploadFile.getOriginalFilename();
			long currentTime = System.currentTimeMillis();
			SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rfileName = simDf.format(new Date(currentTime)) + "."
					+ ofileName.substring(ofileName.lastIndexOf(".") + 1);
			;

			uploadFile.transferTo(new File(savePath + rfileName));
			response.getWriter().print("/finalp/resources/uploadImages/" + rfileName);

		}
	}

	@RequestMapping(value = "bmodifyView.do")
	public String bmodifyView(Model model, Board b) {
		model.addAttribute("board", bService.selectb(b.getBoard_id()));
		return "board/boardmodifyView";
	}

	@RequestMapping(value = "bupdate.do")
	public String boardUpdate(Board b, HttpServletRequest request) throws IOException {
		// 파일 업로드 처리
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile uploadFile = multipartRequest.getFile("uploadFile");

		// 웹서버 컨테이너 경로 추출함
		String root = request.getSession().getServletContext().getRealPath("/");
		// 파일 저장 경로 정함
		String savePath = root + "uploadFiles/";
		if (!uploadFile.isEmpty()) {
			String ofileName = uploadFile.getOriginalFilename();
			long currentTime = System.currentTimeMillis();
			SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rfileName = simDf.format(new Date(currentTime)) + "."
					+ ofileName.substring(ofileName.lastIndexOf(".") + 1);
			;
			uploadFile.transferTo(new File(savePath + rfileName));

			b.setOri_filename(ofileName);
			b.setRe_filename(rfileName);
		}

		bService.updateBoard(b);

		return "redirect:blist.do?page=1";
	}
	
	@RequestMapping(value="bdelete.do")
	public String deleteBoard(Board b) {
		bService.deleteBoard(b.getBoard_id());
		return "redirect:blist.do?page=1";
	}
	@RequestMapping(value="brupdate.do")
	public String BoardRUpdate(Board_Reply br) {
		bService.updateBoard_Reply(br);
		return "redirect:bdetail.do?b_id=" + br.getBoard_id();
	}
	@RequestMapping(value="brdelete.do")
	public String BoardRDelete(Board_Reply br) {
		bService.deleteBoard_Reply(br.getBoard_reply_id());
		return "redirect:bdetail.do?b_id=" + br.getBoard_id();
	}
}
