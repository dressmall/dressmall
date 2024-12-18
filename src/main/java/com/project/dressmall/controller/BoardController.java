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

import com.project.dressmall.mapper.BoardMapper;
import com.project.dressmall.mapper.CartMapper;
import com.project.dressmall.service.BoardService;
import com.project.dressmall.service.CartService;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Board;
import com.project.dressmall.vo.Customer;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	@Autowired BoardService boardService;
	@Autowired BoardMapper boardMapper;
	@Autowired CartService cartService;
	
	// insertBoard - 추가한 후 후기를 쓴 제품의 상세정보 페이지로 넘어감
	@PostMapping("/on/customer/addBoard")
	public String insertBoard(HttpSession session ,@RequestParam String boardContent
							, @RequestParam("ordersNo") Integer ordersNo
							, @RequestParam("goodsNo") Integer goodsNo) {
		
		
		Board board = new Board();
		
		board.setOrdersNo(ordersNo);
		board.setBoardContent(boardContent);
		
		boardService.insertBoard(board);
		
		return "redirect:/on/customer/goodsOne?goodsNo=" + goodsNo;
	}
	
	// insertBoard - 폼
	@GetMapping("/on/customer/addBoard")
	public String insertBoard(Model model, HttpSession session
								, @RequestParam("ordersNo") Integer ordersNo) {
		
		// goods정보 출력
		List<Map<String, Object>> ordersByGoods = boardMapper.addBoardByOrdersList(ordersNo);
		
		model.addAttribute("ordersByGoods",ordersByGoods);
		model.addAttribute("ordersNo",ordersNo);
		String customerMail = ((Customer)session.getAttribute("loginCustomer")).getCustomerMail();
		List<Map<String, Object>> cart = cartService.getCartList(customerMail);
		
		// 장바구니 개수 표시
		if (cart != null && !cart.isEmpty()) model.addAttribute("countCartList", cart.get(0).get("countCartList"));
		else model.addAttribute("countCartList", "0");
		
		log.debug(TeamColor.PARK + "customerMail : " + customerMail + TeamColor.RESET);
		
		log.debug(TeamColor.PARK + "ordersNo : " + ordersNo + TeamColor.RESET);
		log.debug(TeamColor.PARK + "ordersByGoods : " + ordersByGoods + TeamColor.RESET);
		
		return "on/customer/addBoard";
	}
	
	// deleteBoard - 후기 삭제
	@GetMapping("/on/customer/removeBoard")
	public String deleteBoard(HttpSession session, Model model
							,@RequestParam("ordersNo") Integer ordersNo
							,@RequestParam("goodsNo") Integer goodsNo) {


	    // 삭제 처리 (삭제 로직)
	    Integer row = boardService.deleteBoard(ordersNo);
		
		return "redirect:/on/customer/goodsOne?goodsNo=" + goodsNo ;
	}

}
