package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Payment;

@Mapper
public interface PaymentMapper {
	
	// /on/customer/removeOrders : 고객페이지에서 주문취소하면 payment 테이블의 취소하기 전 가격을 조회 (진수우)
	Integer selectPaymentOne(Integer paymentNo);
	
	// /on/customer/removeOrders : 고객페이지에서 주문취소하면 payment 테이블의 결제정보를 수정. (진수우)
	Integer updatePaymentByOrders(Map<String, Object> param);
	
	// /on/customer/removeOrders : 고객페이지에서 품목종류가 1개인 제품 삭제 시 결제정보 삭제. (진수우)
	Integer deletePayment(Integer paymentNo);
	
	// /on/customer/ordersList : 고객페이지에서 결제내역 페이지 결제내역 출력. (진수우)
	List<Payment> selectPaymentListCustomer(String customerMail);
	
	// /on/customer/paymentComplete : 결제페이지에서 결제처리.(진수우)
	Integer insertPayment(Payment payment);
	
	// /on/staff/paymentList - 관리자페이지에서 결제리스트 출력.
	List<Map<String, Object>> selectPaymentList(Map<String, Object> param);
	
	// /on/staff/paymentList - 관리자페이지에서 결제리스트 카운트.
	Integer countPaymentList();
	
	// /on/staff/updatePayment - 관리자페이지에서 배송중으로 업데이트.
	Integer updatePayment(Integer paymentNo);
}
