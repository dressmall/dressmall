package com.project.dressmall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dressmall.service.CustomerService;
import com.project.dressmall.util.Page;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Customer;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CustomerController {
	@Autowired CustomerService customerService;
	
	// 회원가입 액션(박시현)
	@PostMapping("/off/customer/signup")
	public String insertCustomer(Model model, Customer customer) {
		boolean result = customerService.insertCustomer(customer);
		if (!result) {
			model.addAttribute("errorMsg", "이미 등록된 이메일입니다");
			log.debug("errorMsg");
			return "off/customer/signup";  
	    } 
		return "redirect:/on/customer/main";
	}
	
	// 회원가입 폼(박시현)
	@GetMapping("/off/customer/signup")
	public String addCustomer() {
		return "off/customer/signup";
	}
	
	// 마이페이지 폼 호출(진수우)
	@GetMapping("/on/customer/myPage")
	public String myPage(HttpSession session, Model model) {
		// 회원정보 조회.
		List<Map<String, Object>> customer = customerService.getCustomerOne((String)session.getAttribute("loginCustomer"));
		log.debug(TeamColor.JIN + customer + TeamColor.RESET);
		model.addAttribute("customer", customer);
		log.debug(TeamColor.JIN + "myPage 폼 호출" + TeamColor.RESET);
		return "on/customer/myPage";
	}
	
	// 관리자페이지 고객리스트 출력(진수우)
	@GetMapping("/on/staff/customerList")
	public String getMethodName(HttpSession session, Model model, @RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "10") Integer rowPerPage) {
		// paging setter.
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setRowPerPage(rowPerPage);
		page.setNumPerPage(10);
		page.setCountTotalRow(customerService.countCustomerList());
		
		// paging getter.
		model.addAttribute("currentPage", page.getCurrentPage());
		model.addAttribute("lastPage", page.countLastPage());
		model.addAttribute("beginPagingNum", page.countBeginPaingNum());
		model.addAttribute("endPagingNum", page.countEndPagingNum());
		model.addAttribute("numPerPage", page.getNumPerPage());
		
		// paymentList load.
		List<Map<String, Object>> customerList = customerService.getCustomerList(currentPage, rowPerPage, page.countBeginRow()); // get customerList.
		log.debug(TeamColor.JIN + customerList + TeamColor.RESET);
		model.addAttribute("customerList", customerList); // customerList model add.
		
		// paymentList.jsp load.
		model.addAttribute("loginStaff", session.getAttribute("loginStaff")); // login information model add.
		log.debug(TeamColor.JIN + "customerList.jsp 호출" + TeamColor.RESET);
		return "on/staff/customerList";
	}
	
	// 관리자페이지 고객 탈퇴(진수우)
	@GetMapping("/on/staff/deleteCustomer")
	public String deleteCustomer(String customerMail, Integer currentPage) {
		customerService.removeCustomer(customerMail);
		log.debug(TeamColor.JIN + "customerList.jsp 호출" + TeamColor.RESET);
		return "redirect:/on/staff/customerList?currentPage=" + currentPage;
	}
	
}
