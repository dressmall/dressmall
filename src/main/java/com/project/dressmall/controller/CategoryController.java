package com.project.dressmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dressmall.service.CategoryService;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Category;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CategoryController {
	@Autowired CategoryService categoryService;
	
	
	// 카테고리 리스트 출력
	@GetMapping("/on/staff/categoryList")
	public String categoryList(Model model) {
		// 카테고리 리스트 받아오기
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug(TeamColor.KIM + categoryList.toString() + TeamColor.RESET);	// 디버깅
		
		model.addAttribute("categoryList", categoryList);
		
		return "on/staff/categoryList";
	}
	
	
	// 샘플 : 테스트후 삭제예정
	@GetMapping("/on/staff/sample")
	public String getMethodName() {
		log.debug("testttttttttttttttttttt");
		log.debug("dddd");
		
		return "on/staff/sample";
	}
}
