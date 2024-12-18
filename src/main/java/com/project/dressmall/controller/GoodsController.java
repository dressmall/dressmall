package com.project.dressmall.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.dressmall.service.BoardService;
import com.project.dressmall.service.CartService;
import com.project.dressmall.service.CategoryService;
import com.project.dressmall.service.DataService;
import com.project.dressmall.service.GoodsService;
import com.project.dressmall.util.Page;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Category;
import com.project.dressmall.vo.Customer;
import com.project.dressmall.vo.GoodsForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsController {
	@Autowired GoodsService goodsService;
	@Autowired CategoryService categoryService;
	@Autowired CartService cartService;
	@Autowired BoardService boardService;
	@Autowired DataService dataService;
	
	// ----------------------------- 고객 -------------------------------------------------
	
	// 고객 - 상품상세 페이지 출력 - 비회원 : goodsOne.jsp 호출.(김혜린)
	@GetMapping("/off/customer/goodsOne")
	public String offMainGoodsOne(HttpSession session, Model model
										, @RequestParam Integer goodsNo) {
		
		// goods 상세정보 가져오기
		Map<String, Object> goods = goodsService.getGoodsOne(goodsNo);
		model.addAttribute("goods", goods);
		model.addAttribute("goodsNo", goodsNo);
		
				
		// boardList 출력
		List<Map<String, Object>> boardList = boardService.selectBoardList(goodsNo);
		model.addAttribute("boardList", boardList);
		
		return "off/customer/goodsOne";
	}
	
	// 고객 - 상품상세 페이지 출력 - 회원 : goodsOne.jsp 호출.(김혜린)
	@GetMapping("/on/customer/goodsOne")
	public String onMainGoodsOne(HttpSession session, Model model
										, @RequestParam Integer goodsNo) {
		
		// goods 상세정보 가져오기
		Map<String, Object> goods = goodsService.getGoodsOne(goodsNo);
		model.addAttribute("goods", goods);
		model.addAttribute("goodsNo", goodsNo);
		
		
		String customerMail = ((Customer)session.getAttribute("loginCustomer")).getCustomerMail();
		List<Map<String, Object>> cart = cartService.getCartList(customerMail);
		if (cart != null && !cart.isEmpty()) model.addAttribute("countCartList", cart.get(0).get("countCartList"));
		else model.addAttribute("countCartList", "0");
		model.addAttribute("customerMail", customerMail);
		
		// boardList 출력
		List<Map<String, Object>> boardList = boardService.selectBoardList(goodsNo);
		for (Map<String, Object> board : boardList) {
	        // board의 customerMail 값과 세션의 customerMail을 비교하여 삭제 버튼 표시 여부 결정
	        String boardCustomerMail = (String) board.get("customerMail");
	        boolean isCustomer = customerMail != null && customerMail.equals(boardCustomerMail);
	        log.debug(boardCustomerMail);
	        board.put("isCustomer", isCustomer);  // isCustomer 값을 board에 추가
	    }
		model.addAttribute("boardList", boardList);
		log.debug("boardList : " + boardList);
		
		return "on/customer/goodsOne";
	}
	
	// main 화면 출력(goods 리스트, 카테고리, 검색, 페이징) - 비회원 : main.jsp 호출.(김혜린)
	@GetMapping("/off/customer/main")
	public String offMain(HttpSession session, Model model
					, @RequestParam(defaultValue="1") Integer currentPage
					, @RequestParam(defaultValue="12") Integer rowPerPage
					, @RequestParam(required = false) String searchWord
					, @RequestParam(required = false) Integer categoryNo) {
		log.debug(TeamColor.KIM + "searchWord: "+ searchWord + TeamColor.RESET);
		log.debug(TeamColor.KIM + "categoryNo: "+ categoryNo + TeamColor.RESET);
		
		// 페이징 코드 setter.
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setRowPerPage(rowPerPage);
		page.setCountTotalRow(goodsService.countGoodsListByMain(searchWord, categoryNo));
		page.setNumPerPage(5);
		
		log.debug(TeamColor.KIM + "전체행개수: "+ page.getCountTotalRow() + TeamColor.RESET);
		
		// 페이징 코드 getter.
		model.addAttribute("currentPage", page.getCurrentPage());
		model.addAttribute("lastPage", page.countLastPage());
		model.addAttribute("beginPagingNum", page.countBeginPaingNum());
		model.addAttribute("endPagingNum", page.countEndPagingNum());
		model.addAttribute("numPerPage", page.getNumPerPage());
		
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", page.countBeginRow());	// 페이지 첫번째 행 계산
		map.put("rowPerPage", page.getRowPerPage());	
		
		map.put("searchWord", searchWord);	
		
		if(categoryNo == null || categoryNo == 0) {
			map.put("categoryNo", null);
			Category category = new Category();
			category.setCategoryTitle("전체");
			List<Category> selectCategory = new ArrayList<>();
			selectCategory.add(category);
			model.addAttribute("selectCategory", selectCategory);
		} else {
			map.put("categoryNo", categoryNo);	
			model.addAttribute("categoryNo", categoryNo);
			Map<String, Object> categoryMap = new HashMap<>();
			categoryMap.put("categoryNo", categoryNo);
			log.debug(TeamColor.JIN + categoryMap + TeamColor.RESET);
			List<Category> selectCategory = categoryService.getCategoryList(categoryMap);
			log.debug(TeamColor.JIN + selectCategory + TeamColor.RESET);
			model.addAttribute("selectCategory", selectCategory);
		}
		
		// 상품리스트 출력 
		List<Map<String, Object>> main = goodsService.getMain(map);
		model.addAttribute("main", main);
		log.debug(TeamColor.KIM + "main: "+ main + TeamColor.RESET);
		
		// 카테고리 리스트 + 카테고리별 개수 가져오기
		List<Map<String, Object>> categoryCountList = categoryService.getCategoryCounts();
		log.debug(TeamColor.KIM + "categoryCountList: "+ categoryCountList + TeamColor.RESET);
		model.addAttribute("categoryCountList", categoryCountList);
		// 카테고리 : 전체 상품 개수 가져오기
		Integer totalCount = goodsService.countGoodsList();
		model.addAttribute("totalCount", totalCount);
		// 인기상품 가져오기
		List<Map<String, Object>> popularGoods = dataService.getPopularGoods();
		model.addAttribute("popularGoods", popularGoods);
		model.addAttribute("searchWord", searchWord);

		return "off/customer/main";
	}
	
	// main 화면 출력(goods 리스트, 카테고리, 검색, 페이징) - 회원 : main.jsp 호출.(김혜린)
	@GetMapping("/on/customer/main")
	public String onMain(HttpSession session, Model model
					, @RequestParam(defaultValue="1") Integer currentPage
					, @RequestParam(defaultValue="12") Integer rowPerPage
					, @RequestParam(required = false) String searchWord
					, @RequestParam(required = false) Integer categoryNo) {
		log.debug(TeamColor.KIM + "searchWord: "+ searchWord + TeamColor.RESET);
		log.debug(TeamColor.KIM + "categoryNo: "+ categoryNo + TeamColor.RESET);
		
		// 페이징 코드 setter.
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setRowPerPage(rowPerPage);
		page.setCountTotalRow(goodsService.countGoodsListByMain(searchWord, categoryNo));
		page.setNumPerPage(5);
		
		log.debug(TeamColor.KIM + "전체행개수: "+ page.getCountTotalRow() + TeamColor.RESET);
		
		// 페이징 코드 getter.
		model.addAttribute("currentPage", page.getCurrentPage());
		model.addAttribute("lastPage", page.countLastPage());
		model.addAttribute("beginPagingNum", page.countBeginPaingNum());
		model.addAttribute("endPagingNum", page.countEndPagingNum());
		model.addAttribute("numPerPage", page.getNumPerPage());
		
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", page.countBeginRow());	// 페이지 첫번째 행 계산
		map.put("rowPerPage", page.getRowPerPage());	
		
		map.put("searchWord", searchWord);	
		
		if(categoryNo == null || categoryNo == 0) {
			map.put("categoryNo", null);
		} else {
			map.put("categoryNo", categoryNo);	
			model.addAttribute("categoryNo", categoryNo);
		}
		
		// 상품리스트 출력 
		List<Map<String, Object>> main = goodsService.getMain(map);
		model.addAttribute("main", main);
		log.debug(TeamColor.KIM + "main: "+ main + TeamColor.RESET);
		
		// 카테고리 리스트 + 카테고리별 개수 가져오기
		List<Map<String, Object>> categoryCountList = categoryService.getCategoryCounts();
		log.debug(TeamColor.KIM + "categoryCountList: "+ categoryCountList + TeamColor.RESET);
		model.addAttribute("categoryCountList", categoryCountList);
		// 카테고리 : 전체 상품 개수 가져오기
		Integer totalCount = goodsService.countGoodsList();
		model.addAttribute("totalCount", totalCount);
		// 장바구니에 담긴 항목 수 가져오기
		String customerMail = ((Customer)session.getAttribute("loginCustomer")).getCustomerMail();
		List<Map<String, Object>> cart = cartService.getCartList(customerMail);
		if (cart != null && !cart.isEmpty()) model.addAttribute("countCartList", cart.get(0).get("countCartList"));
		else model.addAttribute("countCartList", "0");
		// 인기상품 가져오기
		List<Map<String, Object>> popularGoods = dataService.getPopularGoods();
		model.addAttribute("popularGoods", popularGoods);
		model.addAttribute("searchWord", searchWord);
		
		

		return "on/customer/main";
	}
	
	//----------------------------- 관리자 -------------------------------------------------
	// goods 상세정보 출력.(김혜린)
	@GetMapping("/on/staff/goodsOne")
	public String goodsOne(Model model
								, @RequestParam Integer goodsNo) {
		// goods 상세정보 가져오기
		Map<String, Object> goods = goodsService.getGoodsOne(goodsNo);
		model.addAttribute("goods", goods);
		model.addAttribute("goodsNo", goodsNo);
		return "on/staff/goodsOne";
	}
	
	// goods 삭제.(김혜린)
	@GetMapping("/on/staff/removeGoods")
	public String removeGoods(HttpSession session, @RequestParam Integer goodsNo) {
		String path = session .getServletContext().getRealPath("/upload/");
		goodsService.removeGoods(goodsNo, path);
		
		return "redirect:/on/staff/goodsList";
	}
	
	// modifyGoods.jsp 호출.(진수우)
	@GetMapping("/popup/staff/modifyGoods")
	public String modifyGoods(HttpSession session, Model model, Integer goodsNo) {
		// 데이터베이스에서 상품 정보 가져오기.
		Map<String, Object> goods = goodsService.getGoodsOne(goodsNo);
		model.addAttribute("goods", goods);
		List<Category> categoryList = categoryService.getCategoryListByGoods();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("goodsNo", goodsNo);
		model.addAttribute("loginStaff", session.getAttribute("loginStaff"));
		return "popup/staff/modifyGoods";
	}
	
	// goods 수정. (진수우)
	@PostMapping("/on/staff/modifyGoods")
	public String modifyGoods(HttpSession session, Model model, GoodsForm goodsForm, Integer goodsNo) {
		// 이미지 파일만 첨부가능.
		MultipartFile file = goodsForm.getGoodsFile();
		if(file != null && !file.isEmpty()) { // 첨부된 파일이 있다면
			if(!file.getContentType().equals("image/jpeg") && !file.getContentType().equals("image/png")) {
				String errFileMsg = "이미지 파일만 첨부가능합니다.";
				try {
					errFileMsg = URLEncoder.encode(errFileMsg, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				return "redirect:/on/staff/modifyGoods?errFileMsg=" + errFileMsg + "&goodsNo=" + goodsNo;
			}
		}
		String path = session.getServletContext().getRealPath("/upload/");
		goodsService.modifiyGoods(goodsForm, path, goodsNo);
		return "redirect:/on/staff/goodsList";
	}
	
	// goods 추가 : addGoods.jsp 호출.(김혜린)
	@GetMapping("/popup/staff/addGoods")
	public String addGoods(HttpSession session, Model model, String errMsg) {
		// 카테고리 리스트 출력(카테고리 선택시 필요)
		List<Category> categoryList = categoryService.getCategoryListByGoods();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("loginStaff", session.getAttribute("loginStaff"));
		return "popup/staff/addGoods";
	}
	
	// goods 추가.(김혜린, 진수우)
	@PostMapping("/on/staff/addGoods")
	public String addGoods(HttpSession session, Model model, GoodsForm goodsForm) {
		// 이미지 파일만 첨부가능.
		MultipartFile file = goodsForm.getGoodsFile();
		
		if(file != null && !file.isEmpty()) { // 첨부된 파일이 있다면
			if(!file.getContentType().equals("image/jpeg") && !file.getContentType().equals("image/png")) {
				String errFileMsg = "이미지 파일만 첨부가능합니다.";
				try {
					errFileMsg = URLEncoder.encode(errFileMsg, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				return "redirect:/on/staff/addGoods?errFileMsg=" + errFileMsg;
			}
		}
	
		String path = session.getServletContext().getRealPath("/upload/");
		goodsService.addGoods(goodsForm, path);
		return "redirect:/on/staff/goodsList";
	}
	
	// goods 리스트 출력 : goodsList.jsp 호출.(진수우)
	@GetMapping("/on/staff/goodsList")
	public String goodsList(HttpSession session, Model model, @RequestParam(defaultValue="1") Integer currentPage, @RequestParam(defaultValue="8") Integer rowPerPage) {
		// 페이징 코드 setter.
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setRowPerPage(rowPerPage);
		page.setCountTotalRow(goodsService.countGoodsList());
		page.setNumPerPage(10);
		
		// 페이징 코드 getter.
		model.addAttribute("currentPage", page.getCurrentPage());
		model.addAttribute("lastPage", page.countLastPage());
		model.addAttribute("beginPagingNum", page.countBeginPaingNum());
		model.addAttribute("endPagingNum", page.countEndPagingNum());
		model.addAttribute("numPerPage", page.getNumPerPage());
		
		// 상품리스트 출력
		List<Map<String, Object>> goodsList = goodsService.getGoodsList(page.countBeginRow(), rowPerPage);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("loginStaff", session.getAttribute("loginStaff")); // login information model add.
		log.debug(TeamColor.JIN + goodsList + TeamColor.RESET);
		return "on/staff/goodsList";
	}
	
	
	
}
