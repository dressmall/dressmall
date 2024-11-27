package com.project.dressmall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dressmall.service.CartService;
import com.project.dressmall.util.TeamColor;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CartController {
	@Autowired CartService cartService;
	
	// 장바구니 페이지 폼 호출.(진수우)
	@GetMapping("/on/customer/cartList")
	public String cart(Model model, HttpSession session) {
		//List<Map<String, Object>> cart = cartService.getCartList((String)session.getAttribute("loginCustomer"));
		List<Map<String, Object>> cart = cartService.getCartList("test");
		log.debug(TeamColor.JIN + cart + TeamColor.RESET);
		model.addAttribute("cart", cart);
		log.debug(TeamColor.JIN + "cartList.jsp 호출" + TeamColor.RESET);
		return "/on/customer/cartList";
	}
}
