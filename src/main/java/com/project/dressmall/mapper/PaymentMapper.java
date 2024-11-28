package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Payment;

@Mapper
public interface PaymentMapper {
	// /on/customer/paymentComplete : 결제페이지에서 결제처리.(진수우)
	Integer insertPayment(Payment payment);
	
	// /on/staff/paymentList - 관리자페이지에서 결제리스트 출력.
	List<Map<String, Object>> selectPaymentList(Map<String, Object> param);
	
	// /on/staff/paymentList - 관리자페이지에서 결제리스트 카운트.
	Integer countPaymentList();
	
	// /on/staff/updatePayment - 관리자페이지에서 배송중으로 업데이트.
	Integer updatePayment(Integer paymentNo);
}
