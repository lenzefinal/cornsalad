package com.devone.finalp.payment.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.common.model.vo.Payment;
import com.devone.finalp.common.model.vo.PaymentCount;
import com.devone.finalp.iamport.model.vo.Iamport_class;
import com.devone.finalp.payment.model.service.PaymentService;
import com.devone.finalp.payment.model.vo.GiftItem;
import com.devone.finalp.payment.model.vo.PayGiftView;
import com.siot.IamportRestClient.request.CancelData;

@Controller
public class PaymentController {
	
	@Autowired
	private Iamport_class i ;
	
	@Autowired
	private PaymentService payService;
	
	private ArrayList<GiftItem> list;
	/*private ArrayList<GiftItem> i_list;*/
	
	@RequestMapping("test.do")
	public String test() {
		return "payment/test-page";
	}
	
	@RequestMapping("payment.do")
	public String openPayment(@RequestParam("p_id") String project_id,
								@RequestParam("g_id") String gift_id,
								HttpServletRequest request,
								Model model) {
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginUser");
		String m_id = member.getMember_id();
		List<PayGiftView> list = payService.selectAllGift(project_id);
		System.out.println(list);
		
		model.addAttribute("p", payService.selectProjectInfo(project_id));
		model.addAttribute("glist", list);
		model.addAttribute("ilist",payService.selectItem());
		model.addAttribute("p_id",project_id);
		model.addAttribute("gift_id", gift_id);
		model.addAttribute("m_id",m_id);
		
		return "payment/payment";
	}
	
	
	@RequestMapping("payment2.do")
	public String accountMethod2(@RequestParam("p_id") String p_id,
									@RequestParam("total_account") int total_account,
									@RequestParam("g_ids") String g_ids,
									@RequestParam("g_amounts") String g_amounts,
									HttpServletRequest request,
									Model model) {
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginUser");
		String m_id = member.getMember_id();
		
		String[] idlist = g_ids.split(",");
		String[] amountlist = g_amounts.split(",");
		
		model.addAttribute("p",payService.selectProjectInfo(p_id));
		model.addAttribute("total_account", total_account);
		model.addAttribute("idlist",idlist);
		model.addAttribute("amountlist",amountlist);
		model.addAttribute("g_ids",g_ids);
		model.addAttribute("g_amounts",g_amounts);
		model.addAttribute("m",payService.selectMember(m_id));
		model.addAttribute("glist",payService.selectAllGift(p_id));
		
		
		//gift 별 item 의 리스트 한 배열로
		ArrayList<GiftItem> i_list = new ArrayList<GiftItem>();
		
		for(int i=0; i<idlist.length; i++) {
			list = (ArrayList<GiftItem>) payService.selectChoiceGift(idlist[i]);

			
			for(int j=0; j<list.size(); j++) {
				System.out.println("포문 들어오니");
				i_list.add(list.get(j));
				System.out.println(i_list.get(j));
			}
		}
		
		model.addAttribute("i_list",i_list);
		
		return "payment/payment2";
	}
	
	@RequestMapping("payment3.do")
	public String accountMethod3(@RequestParam("p_id") String p_id,
								@RequestParam("payment_id") String payment_id,
								@RequestParam("m_id") String memeber_id,
								HttpServletRequest request,
								Model model) {
		
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginUser");
		String m_id = member.getMember_id();
		
		model.addAttribute("p",payService.selectProjectInfo(p_id));
		model.addAttribute("m", payService.selectMember(m_id));
		model.addAttribute("payment_id", payment_id);
		
		return "payment/payment3";
	}
	
	@RequestMapping("p_payment.do")
	public String openp_Payment(@RequestParam("p_id") String project_id,
								@RequestParam("product_id") String product_id,
								Model model) {
	System.out.println("p_id : "+project_id+" product_id : "+product_id);
	
	model.addAttribute("p", payService.selectProjectInfo(project_id));
	model.addAttribute("prlist", payService.selectProduct(project_id));
	model.addAttribute("p_id",project_id);
	model.addAttribute("product_id", product_id);
	
	return "payment/p_payment";
	}
	
	@RequestMapping("p_payment2.do")
	public String openp_Payment2(@RequestParam("p_id") String p_id,
									@RequestParam("total_account") int total_account,
									@RequestParam("p_ids") String p_ids,
									@RequestParam("p_amounts") String p_amounts,
									HttpServletRequest request,
									Model model) {
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginUser");
		String m_id = member.getMember_id();
		
		String[] idlist = p_ids.split(",");
		String[] amountlist = p_amounts.split(",");
		
		
		model.addAttribute("p",payService.selectProjectInfo(p_id));
		model.addAttribute("total_account", total_account);
		model.addAttribute("idlist",idlist);
		model.addAttribute("amountlist",amountlist);
		model.addAttribute("p_ids",p_ids);
		model.addAttribute("p_amounts",p_amounts);
		model.addAttribute("m",payService.selectMember(m_id));
		model.addAttribute("prlist", payService.selectProduct(p_id));
		
		
		return "payment/p_payment2";
}
	
	@RequestMapping("p_payment3.do")
	public String openp_Payment3(@RequestParam("p_id") String p_id,
								@RequestParam("payment_id") String payment_id,
								@RequestParam("m_id") String member_id,
								HttpServletRequest request,
								Model model) {
		
		
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginUser");
		String m_id = member.getMember_id();
		
		model.addAttribute("p",payService.selectProjectInfo(p_id));
		model.addAttribute("m", payService.selectMember(m_id));
		model.addAttribute("payment_id", payment_id);
		
		return "payment/p_payment3";
	}
	
	@RequestMapping("payoption.do")
	public String payOption(String popup,
							@RequestParam("p_name") String p_name,
							@RequestParam("m_id") String m_id,
							@RequestParam("p_id") String p_id,
							@RequestParam("g_ids") String g_ids,
							@RequestParam("g_amounts") String g_amounts,
							@RequestParam("p_price") int p_price,
							Model model) {
		System.out.println("m_id/"+m_id);
		
		model.addAttribute("p_name", p_name);
		model.addAttribute("m_id", m_id);
		model.addAttribute("p_id",p_id);
		model.addAttribute("p_category",payService.selectProjectCategory(p_id));
		model.addAttribute("g_ids", g_ids);
		model.addAttribute("g_amounts", g_amounts);
		model.addAttribute("p_price", p_price);
		
		return "payment/pay-"+popup;
	}
	
	@RequestMapping("paypoption.do")
	public String paypOption(String popup,
							@RequestParam("p_name") String p_name,
							@RequestParam("m_id") String m_id,
							@RequestParam("p_id") String p_id,
							@RequestParam("p_ids") String p_ids,
							@RequestParam("p_amounts") String p_amounts,
							@RequestParam("p_price") int p_price,
							Model model) {
		
		model.addAttribute("p_name", p_name);
		model.addAttribute("m_id", m_id);
		model.addAttribute("p_id",p_id);
		model.addAttribute("p_category",payService.selectProjectCategory(p_id));
		model.addAttribute("p_ids", p_ids);
		model.addAttribute("p_amounts", p_amounts);
		model.addAttribute("p_price", p_price);
		
		return "payment/pay-"+popup;
	}
	
	@ResponseBody
	@RequestMapping("insertPay.do")
	public void insertPayment(@RequestParam("imp_uid") String imp_uid,
								@RequestParam("member_id") String member_id,
								@RequestParam("project_id") String project_id,
								@RequestParam("g_ids") String g_ids,
								@RequestParam("g_amounts") String g_amounts,
								@RequestParam("p_ids") String p_ids,
								@RequestParam("p_amounts") String p_amounts,
								@RequestParam("total_amount") int total_amount,
								@RequestParam("pay_option") String pay_option,
								@RequestParam("p_category") String p_category) {
		
		System.out.println("member_id"+member_id);
		
		Payment p= new Payment();
		p.setPayment_id(imp_uid);
		p.setMember_id(member_id);
		p.setProject_id(project_id);
		p.setTotal_amount(total_amount);
		p.setPay_option(pay_option);
		
		payService.insertPayment(p);
		
		System.out.println(p_category);
		
		if(p_category.equals("PC-FUND")) {
			String[] idlist = g_ids.split(",");
			String[] amountlist = g_amounts.split(",");
			
			
			for(int i=0; i<idlist.length; i++) {
				
				PaymentCount pc = new PaymentCount();
				pc.setPayment_id(imp_uid);
				pc.setProject_id(project_id);
				pc.setGift_id(idlist[i]);
				pc.setCount(Integer.parseInt(amountlist[i]));
				
				payService.insertPaymentCount(pc);
			}
		}else {
			String[] idlist = p_ids.split(",");
			String[] amountlist = p_amounts.split(",");
			
			for(int j=0;j<amountlist.length;j++) {
				System.out.println("사이즈"+amountlist.length);
				System.out.println(amountlist[j]);
			}
			
			for(int i=0; i<idlist.length;i++) {
				PaymentCount pc = new PaymentCount();
				pc.setPayment_id(imp_uid);
				pc.setProject_id(project_id);
				pc.setProduct_id(idlist[i]);
				pc.setCount(Integer.parseInt(amountlist[i]));
				
				payService.insertPaymentCount(pc);
			}
		}
		
		

	}
	
	
	@RequestMapping("refund.do")
	public String refund(@RequestParam("payment_id") String payment_id, 
						@RequestParam("pay_option") String pay_option,
						HttpServletRequest request,
						RedirectAttributes redirectAttributes) {
		
		System.out.println(payment_id+", "+pay_option);
		CancelData cancel_data = new CancelData(payment_id, true);
		
		String imp_id ="";
		String imp_secret="";
		
		
		
			if(pay_option.equals("C")) {
				imp_id="4112304821735697";
				imp_secret="Pa6KLq7gwfsSiXGw6pVG3Ttg42u7U3jKdpuZPBfmRIf9FWGMlCtpwWFAYaITd1Drr7qhIGEAoTJ4PqRa";
				/*i.cancelPaymentByImpUid(cancel_data,imp_id, imp_secret);*/
				/*CancelData cancel_data = new CancelData(payment_id, true);*/
				i.cancelPaymentByImpUid(cancel_data,imp_id,imp_secret);
				payService.updatePayment(payment_id);
			}else {
				//카카오일때
				imp_id="9281038576496079";
				imp_secret="JhA4Af5xwXGyhw91cDXPGJKKkzA0C4CmldqWsvtYsaxKHHMUkKJ1tuLN4mNHqq3MDtI5Yc4rnBc4iYZD";
				
				i.cancelPaymentByImpUid(cancel_data,imp_id, imp_secret);
				payService.updatePayment(payment_id);
			}
		
			HttpSession session = request.getSession(false);
			Member member = (Member)session.getAttribute("loginUser");
			String m_id = member.getMember_id();
			redirectAttributes.addAttribute("member_id",m_id);
		
		System.out.println("환불 성공");
		return "redirect:mypageIndex.do";
	}
	
	
	@RequestMapping("refundAll.do")
	public String refundAll(@RequestParam("project_id") String project_id) {
		payService.adminRefund(project_id);
		List<Payment> list = payService.selectPayment(project_id);
		
		String imp_id ="";
		String imp_secret="";
		
		for(int j=0; j<list.size(); j++) {
			if(list.get(j).getPay_option() == "C") {
				imp_id="4112304821735697";
				imp_secret="Pa6KLq7gwfsSiXGw6pVG3Ttg42u7U3jKdpuZPBfmRIf9FWGMlCtpwWFAYaITd1Drr7qhIGEAoTJ4PqRa";
				/*i.cancelPaymentByImpUid(cancel_data,imp_id, imp_secret);*/
				/*CancelData cancel_data = new CancelData(payment_id, true);*/
				CancelData cancel_data = new CancelData(list.get(j).getPayment_id(), true);
				i.cancelPaymentByImpUid(cancel_data,imp_id,imp_secret);
				payService.updatePayment(imp_id);
			}else {
				//카카오일때
				imp_id="9281038576496079";
				imp_secret="JhA4Af5xwXGyhw91cDXPGJKKkzA0C4CmldqWsvtYsaxKHHMUkKJ1tuLN4mNHqq3MDtI5Yc4rnBc4iYZD";
				
				CancelData cancel_data = new CancelData(list.get(j).getPayment_id(), true);
				i.cancelPaymentByImpUid(cancel_data,imp_id, imp_secret);
				payService.updatePayment(imp_id);
			}
		}
		
		return "redirect:adminProject.do";
		
	}
	
	
}
