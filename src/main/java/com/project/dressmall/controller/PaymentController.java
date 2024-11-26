package com.project.dressmall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dressmall.service.PaymentService;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.util.Page;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {
	@Autowired PaymentService paymentService;
	
	@GetMapping("/on/staff/paymentList")
	public String paymentList(HttpSession session, Model model, @RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "10") Integer rowPerPage) {
		// paging setter.
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setRowPerPage(rowPerPage);
		page.setNumPerPage(10);
		page.setCountTotalRow(paymentService.countPaymentList());
		
		// paging getter.
		model.addAttribute("currentPage", page.getCurrentPage());
		model.addAttribute("lastPage", page.countLastPage());
		model.addAttribute("beginPagingNum", page.countBeginPaingNum());
		model.addAttribute("endPagingNum", page.countEndPagingNum());
		model.addAttribute("numPerPage", page.getNumPerPage());
		
		// paymentList load.
		List<Map<String, Object>> paymentList = paymentService.getPaymentList(currentPage, rowPerPage, page.countBeginRow()); // DB에서 결제리스트 가져옴.
		log.debug(TeamColor.JIN + paymentList + TeamColor.RESET);
		model.addAttribute("paymentList", paymentList); // paymentList model add.
		
		// paymentList.jsp load.
		model.addAttribute("loginStaff", session.getAttribute("loginStaff")); // login information model add.
		log.debug(TeamColor.JIN + "paymentList.jsp 호출" + TeamColor.RESET);
		return "on/staff/paymentList";
	}
	
	@GetMapping("/on/staff/updatePayment")
	public String paymentUpdate(Integer paymentNo, Integer currentPage) {
		paymentService.modifyPayment(paymentNo); // payment table payment_state column change.
		return "redirect:/on/staff/paymentList?currentPage=" + currentPage;
	}
}
