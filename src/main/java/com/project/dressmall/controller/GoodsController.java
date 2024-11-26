package com.project.dressmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.dressmall.service.CategoryService;
import com.project.dressmall.service.GoodsService;
import com.project.dressmall.vo.Category;
import com.project.dressmall.vo.GoodsForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsController {
	@Autowired GoodsService goodsService;
	@Autowired CategoryService categoryService;
	
	// goods 추가 : addGoods.jsp 호출
	@GetMapping("/on/staff/addGoods")
	public String addGoods(Model model) {
		
		// 카테고리 리스트 출력(카테고리 선택시 필요)
		List<Category> categoryList = categoryService.getCategoryListByGoods();
		model.addAttribute("categoryList", categoryList);
		
		return "on/staff/addGoods";
	}
	
	// goods 추가
	@PostMapping("/on/staff/addGoods")
	public String addGoods(HttpSession session, Model model, GoodsForm goodsForm) {
		//log.debug(TeamColor.KIM + goodsForm.getFirstName() + TeamColor.RESET);
		
		// 이미지 파일만 가능하도록
		MultipartFile file = goodsForm.getGoodsFile();
		if(file != null && !file.isEmpty()) { // 첨부된 파일이 있다면
			if(!file.getContentType().equals("image/jpeg") && !file.getContentType().equals("image/png")) {
				model.addAttribute("msg", "이미지 파일만 입력이 가능합니다.");
				return "on/staff/addGoods";
			}
		}
		
		// 경로에 업로드 . . .
		
		goodsService.addGoods(goodsForm, null);
		
		
		return "redirect:/on/staff/goodsList";
	}
	
	// goods 리스트 출력
	@GetMapping("/on/staff/goodsList")
	public String goodsList(HttpSession session, Model model
							, @RequestParam(defaultValue = "1") Integer currentPage
							, @RequestParam(defaultValue = "10") Integer rowPerPage) {
		
		
		
		return "on/staff/goodsList";
	}
	
	
}
