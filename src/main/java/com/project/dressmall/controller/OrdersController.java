package com.project.dressmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dressmall.service.BoardService;
import com.project.dressmall.service.CartService;
import com.project.dressmall.service.OrdersService;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Customer;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrdersController {
	@Autowired OrdersService ordersService;
	@Autowired CartService cartService;
	@Autowired BoardService boardService;
	
	// // 구매확정 클릭시 배송완료로 update
	@GetMapping("/on/customer/modifyOrders")
	public String modifyOrdersByPayment(@RequestParam Integer paymentNo) {
		ordersService.updateOrdersByPayment(paymentNo);
		
		return "redirect:/on/customer/ordersList";
		
	}
	
	// deleteOrders - 주문목록에서 주문취소 클릭시 ordersNo 삭제 (박시현)
	@GetMapping("/on/customer/deleteOrders")
	public String deleteOrders(@RequestParam Integer ordersNo
								, @RequestParam Integer paymentNo) {
		
		ordersService.deleteOrders(ordersNo, paymentNo);
		
		return "redirect:/on/customer/ordersList";
	}
	
	// ordersList - 주문목록 출력 (박시현)
	@GetMapping("/on/customer/ordersList") 
	public String getOrdersList(Model model
								, HttpSession session) {
		
		Customer customerMail = (Customer)session.getAttribute("loginCustomer");
		
		List<Map<String, Object>> ordersList = ordersService.selectOrdersList(customerMail);
		log.debug(TeamColor.PARK + "customerMail : " + customerMail + TeamColor.RESET);
		log.debug(TeamColor.PARK + "ordersList : " + ordersList + TeamColor.RESET);
		model.addAttribute("ordersList", ordersList);
		
		List<Map<String, Object>> cart = cartService.getCartList(customerMail.getCustomerMail());
		model.addAttribute("countCartList", cart.get(0).get("countCartList"));
		
		// ordersList에서 board.ordersNo이 있다면 리뷰등록 버튼이 안보이게 만듦 
		for(Map<String, Object> orders : ordersList) {
			Integer ordersNo = (Integer) orders.get("ordersNo");
			boolean review = boardService.selectBoardByOrders(ordersNo);
			orders.put("review", review);
		}	
		
		return "on/customer/ordersList";
	}
}