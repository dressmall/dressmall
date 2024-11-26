package com.project.dressmall.controller;

import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Slf4j
@Controller
public class SignupController {
	
	@GetMapping("/off/customer/signup")
	public String customerSignUp() {
		
		return "off/customer/signup";
	}
	
}	