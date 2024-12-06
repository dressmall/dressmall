package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Cart;

@Mapper
public interface CartMapper {
	
	// <!-- /on/customer/addCart : 같은 품목이 있다면 장바구니에서 해당 품목 개수 변경. (진수우) -->
	Integer updateCart(Map<String, Object> param);
	
	// /on/customer/addCart : 장바구니에서 해당 품목 카운트. (진수우)
	Integer countCartList(Map<String, Object> param);
	
	// /on/customer/addCart : 장바구니 추가.(김혜린)
	Integer insertCart(Cart cart);
	
	// /on/customer/paymentList : 결제페이지에서 장바구니에서 체크한 항목만 출력.(진수우)
	Map<String, Object> selectCartListOne(Integer cartNo);
	
	// /on/customer/removeCart : 장바구니에서 리스트 삭제.(진수우)
	Integer deleteCart(Integer cartNo);
	
	// /on/staff/removeGoods : 상품삭제 시 장바구니 테이블에서 삭제.(진수우)
	Integer deleteCartByGoods(Integer goodsNo);
	
	// /on/customer/cartList : 장바구니에서 리스트 출력.(진수우)
	List<Map<String, Object>> selectCartList(String customerMail);
}
