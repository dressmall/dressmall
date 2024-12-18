package com.project.dressmall.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dressmall.service.AddressService;
import com.project.dressmall.service.CartService;
import com.project.dressmall.service.CustomerService;
import com.project.dressmall.service.PaymentService;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Cart;
import com.project.dressmall.vo.Customer;
import com.project.dressmall.vo.Payment;
import com.project.dressmall.util.Page;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {
	@Autowired PaymentService paymentService;
	@Autowired CustomerService customerService;
	@Autowired CartService cartService;
	
	// 한개 품목 결제 페이지 폼호출.(진수우)
	@PostMapping("/on/customer/paymentOne")
	public String paymentOne(HttpSession session, Model model, Integer goodsNo) {
		// 현재 로그인된 고객정보 가져오기.
		String customerMail = ((Customer)session.getAttribute("loginCustomer")).getCustomerMail();
		// 고객 주소리스트 가져오기.
		List<Map<String, Object>> customer = customerService.getCustomerOne(customerMail);
		model.addAttribute("customer", customer);
		// 상품정보 가져오기
		
		
		return "/on/customer/paymentList";
	}
	
	// 결제 완료 폼 호출. (진수우)
	@GetMapping("/on/customer/thankyou")
	public String thankyou(HttpSession session, Model model) {
		// 장바구니에 담긴 항목 수 가져오기
		String customerMail = ((Customer)session.getAttribute("loginCustomer")).getCustomerMail();
		List<Map<String, Object>> cart = cartService.getCartList(customerMail);
		if (cart != null && !cart.isEmpty()) model.addAttribute("countCartList", cart.get(0).get("countCartList"));
		else model.addAttribute("countCartList", "0");
		return "on/customer/thankyou";
	}
	
	// 결제 수행.(진수우)
	@PostMapping("/on/customer/paymentComplete")
	public String paymentComplete(HttpSession session, Payment payment, @RequestParam(value = "cartNo", required = false) List<Integer> cartNo) {
		log.debug(TeamColor.JIN + cartNo + TeamColor.RESET);
		log.debug(TeamColor.JIN + payment + TeamColor.RESET);
		paymentService.paymentProcess(payment, cartNo);
		return "redirect:/on/customer/thankyou";
	}
	
	// 결제 페이지 폼호출.(진수우)
	@PostMapping("/on/customer/paymentList")
	public String paymentList(HttpSession session, Model model, @RequestParam(value = "goodsChoice", required = false) List<Integer> goodsChoice, Cart cart) {
		log.debug("result = " + cart);
		// 현재 로그인된 고객정보 가져오기.
		String customerMail = ((Customer)session.getAttribute("loginCustomer")).getCustomerMail();
		// 고객 주소리스트 가져오기.
		List<Map<String, Object>> customer = customerService.getCustomerOne(customerMail);
		model.addAttribute("customer", customer);
		
		List<Integer> goodsNoList = new ArrayList<>();
		if (goodsChoice != null) goodsNoList = goodsChoice;
		else if (cart != null) {
			// 결제중 페이지를 닫아도 편하게 다시 결제할 수 있도록 하기 위해 cart 테이블에 결제정보 넣어놓기.
			cartService.addCart(cart, customerMail);
			// 바로 결제하기 위해 구매할 상품 cartNo값 배열에 추가.(기존코드 재활용)
			goodsNoList.add(cart.getCartNo());
		}
		// 고객 장바구니리스트 가져오기.
		List<Map<String, Object>> cartList = cartService.getCartListOne(goodsNoList);
		model.addAttribute("cartList", cartList);
		// 총 결제가격을 계산.
		Long totalPrice = 0L;
		for (Map<String, Object> carts : cartList) {
			totalPrice += (Long)carts.get("goodsTotalPrice");
		}
		model.addAttribute("totalPrice", totalPrice);
		// 장바구니에 담긴 항목 수 계산.
		List<Map<String, Object>> carts = cartService.getCartList(customerMail);
		model.addAttribute("countCartList", carts.get(0).get("countCartList"));
		return "on/customer/paymentList";
	}
	
	// 관리자페이지에서 결제리스트 폼호출.(진수우)
	@GetMapping("/on/staff/paymentList")
	public String paymentList(HttpSession session, Model model, @RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "10") Integer rowPerPage) {
		// paging setter.
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setRowPerPage(rowPerPage);
		page.setNumPerPage(10);
		page.setCountTotalRow(paymentService.countPaymentList());
		
		// paging getter.
		model.addAttribute("currentPage", page.getCurrentPage());
		model.addAttribute("lastPage", page.countLastPage());
		model.addAttribute("beginPagingNum", page.countBeginPaingNum());
		model.addAttribute("endPagingNum", page.countEndPagingNum());
		model.addAttribute("numPerPage", page.getNumPerPage());
		
		// paymentList load.
		List<Map<String, Object>> paymentList = paymentService.getPaymentList(currentPage, rowPerPage, page.countBeginRow()); // DB에서 결제리스트 가져옴.
		log.debug(TeamColor.JIN + paymentList + TeamColor.RESET);
		model.addAttribute("paymentList", paymentList); // paymentList model add.
		
		// paymentList.jsp load.
		model.addAttribute("loginStaff", session.getAttribute("loginStaff")); // login information model add.
		log.debug(TeamColor.JIN + "paymentList.jsp 호출" + TeamColor.RESET);
		return "on/staff/paymentList";
	}
	
	// 관리자페이지에서 결제상태 '배송중'으로 변경.(진수우)
	@GetMapping("/on/staff/updatePayment")
	public String paymentUpdate(Integer paymentNo, Integer currentPage) {
		paymentService.modifyPayment(paymentNo); // payment table payment_state column change.
		return "redirect:/on/staff/paymentList?currentPage=" + currentPage;
	}
}
