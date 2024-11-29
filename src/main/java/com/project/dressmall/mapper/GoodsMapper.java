package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Goods;

@Mapper
public interface GoodsMapper {
	// /on/customer/main : categoryNo이 null이나 0이 아닐때 메인페이지 상품 리스트 출력.(김혜린)
	List<Map<String, Object>> selectMainByCategory(Map<String, Object> param);
	
	// /on/customer/main : 메인페이지 상품 리스트 출력.(김혜린)
	List<Map<String, Object>> selectMain(Map<String, Object> param);
	
	// /on/customer/main : 메인페이지 상품리스트 카운트.(김혜린)
	Integer countGoodsListByMain(Map<String, Object> param);
	
	// /on/staff/removeGoods : 상품 삭제. (김혜린)
	Integer deleteGoods(Integer goodsNo);
	
	// /on/staff/addGoods : 상품등록 .(김혜린)
	Integer insertGoods(Goods goods);
	
	// /on/staff/goodsList : 관리자페이지에서 상품 리스트 출력.(진수우)
	List<Map<String, Object>> selectGoodsList(Map<String, Object> param);
	
	// /on/customer/main : 카테고리 전체 상품 카운트. (김혜린)
	// /on/staff/goodsList : 관리자페이지에서 상품리스트 카운트.(진수우)
	Integer countGoodsList();
	
	// /on/staff/goodsOne : 상품 상세페이지 출력. (김혜린)
	// /on/staff/modifyGoods : 상품수정페이지에서 상품정보 조회.(진수우)
	Map<String, Object> selectGoodsOne(Integer goodsNum);
	
	// /on/staff/modifyGoods : 상품수정페이지에서 상품정보 수정.(진수우)
	Integer updateGoods(Goods goods);
}
