package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Customer;
import com.project.dressmall.vo.Orders;

@Mapper
public interface OrdersMapper {
	
	// /on/customer/paymentComplete : 결제페이지에서 결제할 때 order 정보 추가.(진수우)
	Integer insertOrder(Orders orders);
	
	// on/customer/modifyOrders 
	Integer updateOrdersByPayment(Integer paymentNo);
	
	// on/customer/deleteOrders
	Integer deleteOrders(Integer ordersNo, Integer paymentNo);
	
	// OrdersList 출력
	List<Map<String, Object>> selectOrdersList(Customer customerMail);
}
