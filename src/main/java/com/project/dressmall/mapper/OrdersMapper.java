package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Customer;
import com.project.dressmall.vo.Orders;

@Mapper
public interface OrdersMapper {
	
	// selectOrdersOne 출력 (진수우)
	Map<String, Object> selectOrdersOne(Integer ordersNo);
	
	// /on/customer/removeOrders : 고객페이지에서 주문취소할 때 주문상품이 1개인 경우 결제정보 완전삭제를 위한 카운트.(진수우)
	Integer countOrders(Integer paymentNo);
	
	// /on/customer/paymentComplete : 결제페이지에서 결제할 때 order 정보 추가.(진수우)
	Integer insertOrder(Orders orders);
	
	// on/customer/modifyOrders 
	Integer updateOrdersByPayment(Integer paymentNo);
	
	// on/customer/deleteOrders
	Integer deleteOrders(Integer ordersNo);
	
	// OrdersList 출력
	List<Map<String, Object>> selectOrdersList(String customerMail);
}
