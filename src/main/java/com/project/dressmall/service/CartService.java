package com.project.dressmall.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.CartMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class CartService {
	@Autowired CartMapper cartMapper;
	
	// /on/customer/paymentList : 결제페이지에서 장바구니에서 체크한 항목만 출력.(진수우)
	public List<Map<String, Object>> getCartListOne(List<Integer> goodsChoice) {
		// 선택된 상품의 정보를 하나씩 가져와 리스트로 저장.
		List<Map<String, Object>> cartList = new ArrayList<>();
		for (Integer cartNo : goodsChoice) {
			cartList.add(cartMapper.selectCartListOne(cartNo));
		}
		return cartList;
	}
	
	// /on/customer/removeCart : 장바구니에서 리스트 삭제.(진수우)
	public Integer removeCart(Integer cartNo) {
		return cartMapper.deleteCart(cartNo);
	}
	
	// /on/customer/cartList : 장바구니에서 리스트 출력.(진수우)
	public List<Map<String, Object>> getCartList(String customerMail) {
		return cartMapper.selectCartList(customerMail);
	}

}
