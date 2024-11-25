package com.project.dressmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dressmall.util.TeamColor;

import ch.qos.logback.core.model.Model;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CategoryController {

	@GetMapping("/on/staff/categoryrList")
	public String categoryList(Model model) {
		
		return "on/staff/categoryList";
	}
	
	@GetMapping("/on/staff/sample")
	public String getMethodName() {
		log.debug("testttttttttttttttttttt");
		log.debug("dddd");
		
		return "on/staff/sample";
	}
}
