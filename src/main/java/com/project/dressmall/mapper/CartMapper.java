package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartMapper {
	// /on/customer/removeCart : 장바구니에서 리스트 삭제.(진수우)
	Integer deleteCart(Integer cartNo);
	
	// /on/customer/cartList : 장바구니에서 리스트 출력.(진수우)
	List<Map<String, Object>> selectCartList(String customerMail);
}
