package com.project.dressmall.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.PaymentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;
	
	// /on/staff/paymentList - 관리자페이지에서 결제리스트 출력.
	public List<Map<String, Object>> getPaymentList(Integer currentPage, Integer rowPerPage, Integer beginRow) {
		// 페이징에 필요한 정보를 Map에 저장.
		Map<String, Object> param = new HashMap<>();
		param.put("beginRow", beginRow);
		param.put("rowPerPage", rowPerPage);
		return paymentMapper.selectPaymentList(param);
	}
	
	// /on/staff/paymentList - 관리자페이지에서 결제리스트 카운트.
	public Integer countPaymentList() {
		return paymentMapper.countPaymentList();
	}
	
	// /on/staff/updatePayment - 관리자페이지에서 배송중으로 업데이트.
	public Integer modifyPayment(Integer paymentNo) {
		return paymentMapper.updatePayment(paymentNo);
	}
}
