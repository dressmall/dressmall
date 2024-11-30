package com.project.dressmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dressmall.service.CategoryService;
import com.project.dressmall.util.Page;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Category;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CategoryController {
	@Autowired CategoryService categoryService;
	
	// 카테고리 삭제
	@GetMapping("/on/staff/removeCategory")
	public String removeCategory(@RequestParam Integer categoryNo) {
		
		categoryService.removeCategory(categoryNo);
		return "redirect:/on/staff/categoryList";
	}
	
	// 카테고리 추가 : addCategory.jsp 호출
	@GetMapping("/on/staff/addCategory")
	public String addCategory(Model model) {
		
		return "on/staff/addCategory";
	}
	
	// 카테고리 추가
	@PostMapping("/on/staff/addCategory")
	public String addCategory(Category category) {
		
		// insert 호출
		log.debug(TeamColor.KIM+ category.toString() + TeamColor.RESET);
		int row = categoryService.addCategory(category);
		
		if(row == 0) { // 입력 실패시 추가페이지로 포워딩
			return "on/staff/addCategory";
		}
		
		return "redirect:/on/staff/categoryList";
	}
	
	// 카테고리 리스트 출력
	@GetMapping("/on/staff/categoryList")
	public String categoryList(HttpSession session, Model model
								, @RequestParam(defaultValue = "1") Integer currentPage
								, @RequestParam(defaultValue = "10") Integer rowPerPage) {
		// 페이징
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setRowPerPage(rowPerPage);
		
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", page.countBeginRow());	// 페이지 첫번째 행 계산
		map.put("rowPerPage", page.getRowPerPage());	
		
		// 카테고리 리스트 받아오기
		List<Category> categoryList = categoryService.getCategoryList(map);
		log.debug(TeamColor.KIM + categoryList.toString() + TeamColor.RESET);	// 디버깅
		model.addAttribute("categoryList", categoryList);
		
		// 페이징
		page.setNumPerPage(10);
		page.setCountTotalRow(categoryService.countCategoryList());
		
		// paging getter.
		model.addAttribute("currentPage", page.getCurrentPage());
		model.addAttribute("lastPage", page.countLastPage());
		model.addAttribute("beginPagingNum", page.countBeginPaingNum());
		model.addAttribute("endPagingNum", page.countEndPagingNum());
		model.addAttribute("numPerPage", page.getNumPerPage());
		
		// staff 세션정보
		model.addAttribute("loginStaff", session.getAttribute("loginStaff"));
		
		return "on/staff/categoryList";
	}
}
