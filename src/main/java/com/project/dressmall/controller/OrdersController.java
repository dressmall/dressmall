package com.project.dressmall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dressmall.service.OrdersService;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Customer;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrdersController {
	@Autowired OrdersService ordersService;
	
	// ordersList - 주문목록 출력
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
