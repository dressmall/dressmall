package com.project.dressmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dressmall.service.OrdersService;
import com.project.dressmall.vo.Customer;
import com.project.dressmall.vo.Goods;
import com.project.dressmall.vo.GoodsFile;
import com.project.dressmall.vo.Orders;
import com.project.dressmall.vo.Payment;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrdersController {
	@Autowired OrdersService ordersService;
	
	// ordersList - 주문목록 출력
	@GetMapping("/on/customer/ordersList")
	public String getOrdersList(Model model
								, HttpSession session
								, Payment payment
								, Orders orders
								, Goods goods
								, GoodsFile goodsFile) {
		
		Customer customerMail = (Customer)session.getAttribute("loginCustomer");
		
		Map<String, Object> param = new HashMap<>();
		param.put("customerMail", customerMail);
		param.put("paymentNo", payment.getPaymentNo());
		param.put("paymentMethod", payment.getPaymentMethod());
		param.put("paymentState", payment.getPaymentState());
		param.put("ordersNo", orders.getOrdersNo());
		param.put("goodsNo", orders.getGoodsNo());
		param.put("goodsTitle", goods.getGoodsTitle());
		param.put("goodsMemo", goods.getGoodsMemo());
		param.put("goodsPrice", goods.getGoodsPrice());
		param.put("goodsFileNo", goodsFile.getGoodsFileNo());
		param.put("goodsFileName", goodsFile.getGoodsFileName());
		param.put("goodsFileName", goodsFile.getGoodsFileOrigin());
		
		List<Map<String, Object>> ordersList = ordersService.ordersList(param);
		model.addAttribute("ordersList", ordersList);
		model.addAttribute("customerMail", customerMail);
		
		return "on/customer/ordersList";
	}
}
