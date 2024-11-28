package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Customer;
import com.project.dressmall.vo.Orders;
import com.project.dressmall.vo.Payment;

@Mapper
public interface OrdersMapper {
	
	// on/customer/modifyOrders 
	Integer updateOrdersByPayment(Payment payment);
	
	// on/customer/deleteOrders
	Integer deleteOrders(Integer ordersNo, Integer paymentNo);
	
	// OrdersList 출력
	List<Map<String, Object>> selectOrdersList(Customer customerMail);
}
