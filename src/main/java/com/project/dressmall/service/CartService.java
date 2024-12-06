package com.project.dressmall.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.CartMapper;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Cart;
import com.project.dressmall.vo.Customer;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class CartService {
	@Autowired CartMapper cartMapper;
	
	// /on/customer/addCart : 장바구니 추가.(김혜린)
	public void addCart(Cart cart, String customerMail) {
		
		// 기존에 장바구니에 같은 항목이 있는지 검사.
		List<Map<String, Object>> cartList = cartMapper.selectCartList(customerMail);
		boolean exist = false;
		for (Map<String, Object> map : cartList) {
			if ((Integer)map.get("goodsNo") == cart.getGoodsNo()) {
				exist = true;
				break;
			}
		}
		// 같은 항목이 있다면,
		if (exist == true) {
			// 해당 품목 개수 가져오기.
			Map<String, Object> param = new HashMap<>();
			param.put("customerMail", customerMail);
			param.put("goodsNo", cart.getGoodsNo());
			log.debug(TeamColor.JIN + cart.getGoodsNo() + TeamColor.RESET);
			Integer countGoods = cartMapper.countCartList(param);
			log.debug(TeamColor.JIN + countGoods + TeamColor.RESET);
			// 가져온 품목에 개수 추가하기.
			countGoods += cart.getCartAmount();
			// cart 테이블 업데이트.
			param.put("cartAmount", countGoods);
			cartMapper.updateCart(param);
		} else {
			// 같은 항목이 없다면, 장바구니에 새로 추가하기.
			cartMapper.insertCart(cart);
		}
	}
	
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
