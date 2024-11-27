package com.project.dressmall.service;

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
	
	// /on/customer/removeCart : 장바구니에서 리스트 삭제.(진수우)
	public Integer removeCart(Integer cartNo) {
		return cartMapper.deleteCart(cartNo);
	}
	
	// /on/customer/cartList : 장바구니에서 리스트 출력.(진수우)
	public List<Map<String, Object>> getCartList(String customerMail) {
		return cartMapper.selectCartList(customerMail);
	}

}
