package com.project.dressmall.controller;

import java.util.HashMap;
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
		// 결제리스트 로드.
		List<Map<String, Object>> paymentList = paymentService.getPaymentList(currentPage, rowPerPage); // DB에서 결제리스트 가져옴.
		log.debug(TeamColor.JIN + paymentList + TeamColor.RESET);
		model.addAttribute("paymentList", paymentList); // 결제리스트 model에 추가.
		
		// 페이징 관련 setter.
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setRowPerPage(rowPerPage);
		page.setNumPerPage(10);
		page.setCountTotalRow(paymentService.countPaymentList());
		
		// 페이징 관련 getter.
		model.addAttribute("currentPage", page.getCurrentPage());
		model.addAttribute("lastPage", page.countLastPage());
		model.addAttribute("beginPagingNum", page.countBeginPaingNum());
		model.addAttribute("endPagingNum", page.countEndPagingNum());
		model.addAttribute("numPerPage", page.getNumPerPage());
		
		// paymentList.jsp 호출.
		model.addAttribute("loginStaff", session.getAttribute("loginStaff")); // 로그인정보 model 추가.
		log.debug(TeamColor.JIN + "paymentList.jsp 호출" + TeamColor.RESET);
		return "on/staff/paymentList";
	}
	
	@GetMapping("/on/staff/updatePayment")
	public String paymentUpdate(Integer paymentNo) {
		paymentService.modifyPayment(paymentNo); // DB에서 결제테이블의 payment_state를 '배송중'으로 변경.
		return "redirect:/on/staff/paymentList";
	}
}