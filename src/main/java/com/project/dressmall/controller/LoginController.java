package com.project.dressmall.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dressmall.util.TeamColor;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class LoginController {
	@GetMapping("/off/staff/login")
	public String getMethodName() {
		log.debug("testttttttttttttttttttt");
		log.debug(TeamColor.KIM + "test" + TeamColor.RESET);
		log.debug(TeamColor.JIN + "test" + TeamColor.RESET);
		log.debug(TeamColor.PARK + "test" + TeamColor.RESET);
		log.debug("dddd");
		/////
		
		return "off/staff/login";
	}
	
}
