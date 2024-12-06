package com.project.dressmall.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.CartMapper;
import com.project.dressmall.mapper.OrdersMapper;
import com.project.dressmall.mapper.PaymentMapper;
import com.project.dressmall.vo.Orders;
import com.project.dressmall.vo.Payment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;
	@Autowired OrdersMapper ordersMapper;
	@Autowired CartMapper cartMapper;
	
	// /on/customer/removeOrders : 고객페이지에서 주문취소하면 payment 테이블의 취소하기 전 가격을 조회 (진수우)
	public Integer getPaymentOne(Integer paymentNo) {
		return paymentMapper.selectPaymentOne(paymentNo);
	}
	
	// /on/customer/removeOrders : 고객페이지에서 주문취소하면 payment 테이블의 결제정보를 수정 (진수우)
	public Integer updatePaymentByOrders(Map<String, Object> param) {
		return paymentMapper.updatePaymentByOrders(param);
	}
	
	
	// /on/customer/ordersList : 고객페이지에서 결제내역 페이지 결제내역 출력. (진수우)
	public List<Payment> getPaymentListCustomer(String customerMail) {
		return paymentMapper.selectPaymentListCustomer(customerMail);
	}
		
	// /on/customer/paymentComplete : 결제페이지에서 결제처리.(진수우)
	public void paymentProcess(Payment payment, List<Integer> cartNo) {
		Integer paymentRow = paymentMapper.insertPayment(payment); // payment 테이블에 결제정보 insert.
		Integer paymentNo = payment.getPaymentNo(); // goods 테이블에 데이터 삽입 시 자동으로 생성되는 goodsNo 값 받아옴.
		if (paymentRow == 1) {
			Integer count = 0;
			for (Integer c : cartNo) {
				// 장바구니에서 선택된 항목들의 정보를 가져와서 Orders 객체에 set.
				Map<String, Object> cart = cartMapper.selectCartListOne(c);
				Orders orders = new Orders();
				orders.setGoodsNo((Integer)cart.get("goodsNo"));
				orders.setOrdersAmount((Integer)cart.get("cartAmount"));
				orders.setPaymentNo(paymentNo); 
				// orders 테이블에 결제정보 insert.
				count += ordersMapper.insertOrder(orders);
			}
			if (count == cartNo.size()) {
				count = 0;
				// 결제된 목록들을 장바구니에서 삭제.
				for (Integer c : cartNo) {
					count += cartMapper.deleteCart(c);
				}
			}
		}
	}
	
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
