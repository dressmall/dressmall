package com.project.dressmall.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dressmall.service.CustomerService;
import com.project.dressmall.service.StaffService;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Customer;
import com.project.dressmall.vo.Staff;

import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class LoginController {
	@Autowired StaffService staffService;
	@Autowired CustomerService customerService;
	
	@PostMapping("/off/customer/customerLogin")
	public String customerLogin(Model model
							, HttpSession session
							, @RequestParam(name = "customerMail") String customerMail
							, @RequestParam(name = "customerPw") String customerPw) {
		
		Customer customer = new Customer();
		customer.setCustomerMail(customerMail);
		customer.setCustomerPw(customerPw);
		
		Customer loginCustomer = customerService.customerLogin(customer);
		if(loginCustomer == null) {
			model.addAttribute("msg","로그인에 실패했습니다");
			return "off/customer/customerLogin";
		}
		session.setAttribute("loginCustomer", loginCustomer);
		
		log.debug(TeamColor.PARK + "customer 로그인" + TeamColor.RESET);
		log.debug(TeamColor.PARK + "customerMail : " + customerMail + TeamColor.RESET);
		log.debug(TeamColor.PARK + "customerPw : " + customerPw + TeamColor.RESET);
		
		return "redirect:/on/customer/main";
	}
	
	// 일반회원 로그인 폼
	@GetMapping("/off/customer/customerLogin")
	public String customerLogin() {
		log.debug(TeamColor.PARK + "customer 로그인" + TeamColor.RESET);
		
		return "off/customer/customerLogin";
	}
	
	// 관리자 로그인 액션
	@PostMapping("/off/staff/staffLogin")
	public String staffLogin(Model model
							, HttpSession session
							, @RequestParam(name = "staffId") String staffId
							, @RequestParam(name = "staffPw") String staffPw) {
		
		Staff staff = new Staff();
		staff.setStaffId(staffId);
		staff.setStaffPw(staffPw);
		
		Staff loginStaff = staffService.staffLogin(staff);
		if(loginStaff == null) {
			// 로그인이 실패했다면 에러메세지 출력과 로그인 페이지로 return
			model.addAttribute("msg","로그인에 실패했습니다");
			log.debug(TeamColor.PARK + "loginStaff : " + loginStaff + TeamColor.RESET);
			log.debug("로그인 실패");
			return "off/staff/staffLogin";
		}
		session.setAttribute("loginStaff", loginStaff); // 세션 저장
		
		log.debug(TeamColor.PARK + "staff 로그인 성공" + TeamColor.RESET);
		
		return "redirect:/on/staff/staffList";
	}
	
	// 관리자 로그인 폼
	@GetMapping("/off/staff/staffLogin")
	public String staffLogin() {
		return "off/staff/staffLogin";
	}
	
}
