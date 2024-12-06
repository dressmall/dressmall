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

import com.project.dressmall.mapper.OrdersMapper;
import com.project.dressmall.mapper.PaymentMapper;
import com.project.dressmall.service.BoardService;
import com.project.dressmall.service.CartService;
import com.project.dressmall.service.OrdersService;
import com.project.dressmall.service.PaymentService;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Customer;
import com.project.dressmall.vo.Payment;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrdersController {
	@Autowired OrdersService ordersService;
	@Autowired CartService cartService;
	@Autowired BoardService boardService;
	@Autowired PaymentService paymentService;
	
	// 선택된 제품 주문취소 처리.(진수우, 박시현)
	@PostMapping("/on/customer/removeOrders")
	public String removeOrders(HttpSession session, Model model, @RequestParam(value = "selectGoods", required = false) List<Integer> ordersNo, Integer paymentNo) {
		// 취소를 원하는 제품의 총가격 구하기.
		Integer total = 0;
		for (Integer orders : ordersNo) {
			Map<String, Object> result = ordersService.getOrdersOne(orders);
			total += paymentService.getPaymentOne(paymentNo) - (Integer)result.get("goodsPrice") * (Integer)result.get("ordersAmount");
		}
		// payment 테이블에서 삭제된 품목의 가격을 뺀 가격으로 총 결제가격을 업데이트.
		Map<String, Object> param = new HashMap<>();
		param.put("paymentPrice", total);
		param.put("paymentNo", paymentNo);
		paymentService.updatePaymentByOrders(param);
		
		// order 테이블에서 선택한 품목 삭제.
		ordersService.deleteOrders(ordersNo, paymentNo);
		
		return "redirect:/on/customer/ordersList";
	}
		
	// 고객페이지에서 주문취소 버튼 누를 시 주문취소 폼으로 이동.(진수우)
	@GetMapping("/on/customer/removeOrders")
	public String removeOrders(HttpSession session, Model model, Integer paymentNo) {
		// 삭제할 결제번호 가져오기.
		model.addAttribute("paymentNo", paymentNo);
		// 로그인된 계정정보 가져오기.
		Customer customer = (Customer)session.getAttribute("loginCustomer");
		// 장바구니에 담긴 항목 수 가져오기.
		List<Map<String, Object>> cart = cartService.getCartList(customer.getCustomerMail());
		if (cart != null && !cart.isEmpty()) model.addAttribute("countCartList", cart.get(0).get("countCartList"));
		else model.addAttribute("countCartList", "0");
		// ordersList 가져오기.
		List<Map<String, Object>> ordersList = ordersService.selectOrdersList(customer.getCustomerMail());
		model.addAttribute("ordersList", ordersList);
		return "on/customer/removeOrders";
	}
	
	// 구매확정 클릭시 배송완료로 update
	@GetMapping("/on/customer/modifyOrders")
	public String modifyOrdersByPayment(@RequestParam Integer paymentNo) {
		ordersService.updateOrdersByPayment(paymentNo);
		
		return "redirect:/on/customer/ordersList";
		
	}
	
	// ordersList - 주문목록 출력 (박시현)
	@GetMapping("/on/customer/ordersList") 
	public String getOrdersList(Model model, HttpSession session) {
		
		Customer customer = (Customer)session.getAttribute("loginCustomer");
		
		// 계정에 해당하는 payment 리스트 가져오기.
		List<Payment> paymentList = paymentService.getPaymentListCustomer(customer.getCustomerMail());
		model.addAttribute("paymentList", paymentList);
		
		List<Map<String, Object>> ordersList = ordersService.selectOrdersList(customer.getCustomerMail());
		log.debug(TeamColor.PARK + "customer : " + customer + TeamColor.RESET);
		log.debug(TeamColor.PARK + "ordersList : " + ordersList + TeamColor.RESET);
		model.addAttribute("ordersList", ordersList);
		
		List<Map<String, Object>> cart = cartService.getCartList(customer.getCustomerMail());
		if (cart != null && !cart.isEmpty()) model.addAttribute("countCartList", cart.get(0).get("countCartList"));
		else model.addAttribute("countCartList", "0");
		
		// ordersList에서 board.ordersNo이 있다면 리뷰등록 버튼이 안보이게 만듦 
		for(Map<String, Object> orders : ordersList) {
			Integer ordersNo = (Integer) orders.get("ordersNo");
			boolean review = boardService.selectBoardByOrders(ordersNo);
			orders.put("review", review);
		}	
		
		return "on/customer/ordersList";
	}
}