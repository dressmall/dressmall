package com.project.dressmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class LoginController {
	@GetMapping("/on/test")
	public String getMethodName() {
		return "on/test";
	}
	
}
