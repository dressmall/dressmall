package com.project.dressmall.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dressmall.util.TeamColor;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class LoginController {
	@GetMapping("/on/staff/test")
	public String getMethodName() {
		log.debug(TeamColor.KIM + "test" + TeamColor.JIN);
		
		return "on/staff/test";
	}
	
}
