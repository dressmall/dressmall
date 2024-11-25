package com.project.dressmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dressmall.mapper.PaymentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;
	
	// /on/staff/paymentList - 관리자페이지에서 결제리스트 출력.
	public List<Map<String, Object>> getPaymentList() {
		return paymentMapper.selectPaymentList();
	}
	
	// /on/staff/updatePayment - 관리자페이지에서 배송중으로 업데이트.
	public Integer modifyPayment(Integer paymentNo) {
		return paymentMapper.updatePayment(paymentNo);
	}
}
