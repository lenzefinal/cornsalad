package com.devone.finalp.member_status.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.member_status.model.service.MemberStatusService;

@Controller
public class MemberStatusController {

	@Autowired
	private MemberStatusService memberStatusService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String loginMethod(Member member, HttpSession session) {
		
		System.out.println("로그인");
		session.setAttribute("loginUser", memberStatusService.login(member));
		
		return "home";
	}
	
	@RequestMapping("/logout.do")
	public String logoutMethod(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.invalidate();
		}
		
		return "home";
	}
	
	@RequestMapping("/enroll.do")
	public String enrollMethod() {
		return "member/enrollMember";
	}
	
	@RequestMapping("/joinedEmailFind.do")
	public void ajaxJoinedEmail(@RequestParam(value="Email") String email,
								HttpServletResponse response) throws IOException {
		System.out.println("회원가입시 가입하려는 이메일의 중복확인용" + email);
		
		Member m = memberStatusService.joinedEmailFind(email);
		
		String code="";
		
		if(m == null) {
			code="SUSS000";
			System.out.println("가입가능");
		}else {
			code="SUSBA02";
			System.out.println("이미 존재하는 아이디");
		}
		
		PrintWriter out = response.getWriter();
		
		out.append(code);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="ajaxSendEmailAuthCode.do", method=RequestMethod.POST)
	@ResponseBody
	public String sendEmail(@RequestParam(value="Email") String email,
						  HttpServletResponse response)  throws ServletException, IOException {
		
		int num = (int)(Math.random()*9999)+1001;
		char ch = (char)((Math.random() * 26) + 65);
		char ch2 = (char)((Math.random() * 26) + 65);
		
		String code=""+num+ch+ch2;
		
		String m_name = "Cornsalad";
		String m_title = "Cornsalad 회원가입 이메일 인증메일 발송";
		String m_text = "";
		
		m_text = "안녕하십니까 저희 Cornsalad를 이용해 주시는 회원님께 감사의 말씀 드립니다."
				+ "저희 Cornsalad는 고객 만족을 위해 최선을 다하고 있습니다."
				+ "불편사항이 있으시다면 언제든지 저희 1:1문의를 이용해 주십시오. 감사합니다."
				+ "\n"
				+ "회원님의 메일 인증 코드는  " + code + " 입니다";
		
		String d_email = "rkdqhfka7@gmail.com";
		
		
		try {
			String mail_from = m_name + "<" + d_email + ">";
			String mail_to = email;
			String title = m_title;
	
			mail_from = new String(mail_from.getBytes("UTF-8"), "UTF-8");
			mail_to = new String(mail_to.getBytes("UTF-8"), "UTF-8");
			
			Properties props = new Properties();
			
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.user", d_email);
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getDefaultInstance(props, auth);
			
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(d_email));
			msg.setSubject(title, "UTF-8");
			msg.setText(m_text);
			msg.setHeader("Content-type", "text/html; charset=UTF-8");
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(email));			
			Transport.send(msg);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		JSONObject job = new JSONObject();
		job.put("code", "SUSS000");
		job.put("message",code);
		
		return job.toJSONString();
	}
	
	@RequestMapping(value="ajaxIsValidToken.do")
	public void ajaxIsValidToken(@RequestParam(value="token") String token,
								 @RequestParam(value="secureStateBagKey") String secureStateBagKey,
								 HttpServletResponse response) throws IOException{
		
		
		PrintWriter out = response.getWriter();
		
		if(token.equals(secureStateBagKey)) {
			out.append("SUSS000");
		}else {
			out.append("");
		}
		
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="enrollMember.do", method=RequestMethod.POST)
	public void insertMember(Member member, HttpServletResponse response) {
		System.out.println("잘들어왔나");
		
		
		System.out.println(member);
	}
	
	
		
	
}
