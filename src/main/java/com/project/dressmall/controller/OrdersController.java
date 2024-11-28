package com.project.dressmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dressmall.service.OrdersService;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Customer;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrdersController {
	@Autowired OrdersService ordersService;
	
	
	// deleteOrders - 주문목록에서 주문취소 클릭시 ordersNo 삭제 (박시현)
	@GetMapping("/on/customer/deleteOrders")
	public String deleteOrders(@RequestParam Integer ordersNo, @RequestParam Integer paymentNo) {
		
		ordersService.deleteOrders(ordersNo, paymentNo);
		
		return "redirect:/on/customer/ordersList";
	}
	
	// ordersList - 주문목록 출력 (박시현)
	@GetMapping("/on/customer/ordersList")
	public String getOrdersList(Model model
								, HttpSession session ) {
		
		Customer customerMail = (Customer)session.getAttribute("loginCustomer");
		
		List<Map<String, Object>> ordersList = ordersService.selectOrdersList(customerMail);
		log.debug(TeamColor.PARK + "customerMail : " + customerMail + TeamColor.RESET);
		log.debug(TeamColor.PARK + "ordersList : " + ordersList + TeamColor.RESET);
		model.addAttribute("ordersList", ordersList);
		
		return "on/customer/ordersList";
	}
}
