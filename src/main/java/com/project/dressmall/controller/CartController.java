package com.project.dressmall.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.project.dressmall.service.CartService;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Cart;
import com.project.dressmall.vo.Customer;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CartController {
	@Autowired CartService cartService;
	
	// cart 추가.(김혜린)
	@PostMapping("/on/customer/addCart")
	public String addCart(HttpSession session, Model model, Cart cart) {
		log.debug(TeamColor.KIM + "cart: "+ cart + TeamColor.RESET);
		String customerMail = ((Customer)session.getAttribute("loginCustomer")).getCustomerMail();
		cartService.addCart(cart, customerMail);
		return "redirect:/on/customer/cartList";
	}
	
	// 장바구니 목록 삭제. (진수우)
	@GetMapping("/on/customer/removeCart")
	public String removeCart(Integer cartNo) {
		cartService.removeCart(cartNo);
		return "redirect:/on/customer/cartList";
	}
	
	// 장바구니 페이지 폼 호출.(진수우)
	@GetMapping("/on/customer/cartList")
	public String cartList(Model model, HttpSession session) {
		String customerMail = ((Customer)session.getAttribute("loginCustomer")).getCustomerMail();
		List<Map<String, Object>> cart = cartService.getCartList(customerMail);
		log.debug(TeamColor.JIN + cart + TeamColor.RESET);
		model.addAttribute("cart", cart);
		log.debug(TeamColor.JIN + "cartList.jsp 호출" + TeamColor.RESET);
		return "/on/customer/cartList";
	}
}
