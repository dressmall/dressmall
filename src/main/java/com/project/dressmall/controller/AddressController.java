package com.project.dressmall.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.dressmall.service.AddressService;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Address;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AddressController {
	@Autowired AddressService addressService;
	
	// 마이페이지에서 주소삭제.(진수우)
	@GetMapping("/on/customer/removeAddress")
	public String removeAddress(Integer addressNo) {
		addressService.removeAddress(addressNo);
		return "redirect:/on/customer/myPage";
	}
	
	// address 테이블에서 주소수정.(진수우)
	@PostMapping("/on/customer/modifyAddress")
	public String modifyAddress(HttpSession session, String addressDetail, Integer addressNo) {
		// 회원 주소 수정 쿼리문에 넘겨줄 map 생성.
		Map<String, Object> param = new HashMap<>();
		param.put("addressDetail", addressDetail);
		param.put("addressNo", addressNo);
		log.debug(TeamColor.JIN + param + TeamColor.RESET);
		
		// 데이터베이스에서 회원 비밀번호 수정.
		addressService.modifyAddress(param);
		return "redirect:/on/customer/myPage";
	}
	
	// 마이페이지에서 주소수정 폼 호출.(진수우)
	@GetMapping("/on/customer/modifyAddress")
	public String modifyAddress(Model model, Integer addressNo) {
		Address address = addressService.getAddressOne(addressNo);
		model.addAttribute("address", address);
		log.debug(TeamColor.JIN + "modifyAddress.jsp 호출" + TeamColor.RESET);
		return "on/customer/modifyAddress";
	}
	
	// address 테이블 주소추가.(진수우)
	@PostMapping("/on/customer/addAddress")
	public String addAddress(HttpSession session, String addressDetail) {
		// 회원 주소 수정 쿼리문에 넘겨줄 map 생성.
		Map<String, Object> param = new HashMap<>();
		param.put("addressDetail", addressDetail);
		param.put("customerMail", (String)session.getAttribute("loginCustomer"));
		// param.put("customerMail", "test");
		log.debug(TeamColor.JIN + param + TeamColor.RESET);
		
		// 데이터베이스에서 회원 비밀번호 수정.
		addressService.addAddress(param);
		return "redirect:/on/customer/myPage";
	}
	
	// 마이페이지에서 주소추가 폼 호출.(진수우)
	@GetMapping("/on/customer/addAddress")
	public String addAddress() {
		log.debug(TeamColor.JIN + "addAddress.jsp 호출" + TeamColor.RESET);
		return "on/customer/addAddress";
	}
}
