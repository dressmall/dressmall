package com.project.dressmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.OrdersMapper;
import com.project.dressmall.vo.Customer;
import com.project.dressmall.vo.Orders;

@Service
@Transactional
public class OrdersService {
	@Autowired OrdersMapper ordersMapper;
	
	// on/customer/modifyOrders 
	public Integer updateOrdersByPayment(Integer paymentNo) {
		return ordersMapper.updateOrdersByPayment(paymentNo);
	}
	
	// on/customer/deleteOrders
	public Integer deleteOrders(Integer ordersNo, Integer paymentNo) {
		return ordersMapper.deleteOrders(ordersNo, paymentNo);
	}
	
	// on/customer/orderList
	public List<Map<String, Object>> selectOrdersList(Customer customerMail) {
		return ordersMapper.selectOrdersList(customerMail);
	}

}
