package com.project.dressmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.OrdersMapper;
import com.project.dressmall.mapper.PaymentMapper;
import com.project.dressmall.vo.Customer;
import com.project.dressmall.vo.Orders;

@Service
@Transactional
public class OrdersService {
	@Autowired OrdersMapper ordersMapper;
	@Autowired PaymentMapper paymentMapper;
	
	// selectOrdersOne 출력 (진수우)
	public Map<String, Object> getOrdersOne(Integer ordersNo) {
		return ordersMapper.selectOrdersOne(ordersNo);
	}
	
	// on/customer/modifyOrders 
	public Integer updateOrdersByPayment(Integer paymentNo) {
		return ordersMapper.updateOrdersByPayment(paymentNo);
	}
	
	// on/customer/deleteOrders
	public void deleteOrders(List<Integer> ordersNo, Integer paymentNo) {
		for (Integer order : ordersNo) {
			ordersMapper.deleteOrders(order);
		}
		Integer countOrders = ordersMapper.countOrders(paymentNo);
		if (countOrders == 0) paymentMapper.deletePayment(paymentNo);
	}
	
	// on/customer/orderList
	public List<Map<String, Object>> selectOrdersList(String customerMail) {
		return ordersMapper.selectOrdersList(customerMail);
	}

}
