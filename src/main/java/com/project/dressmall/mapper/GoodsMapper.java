package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Goods;

@Mapper
public interface GoodsMapper {
	// /on/staff/addGoods : 상품등록
	Integer insertGoods(Goods goods);
	
	// /on/staff/goodsList : 관리자페이지에서 상품 리스트 출력.(진수우)
	List<Map<String, Object>> selectGoodsList(Map<String, Object> param);
	
	// /on/staff/goodsList : 관리자페이지에서 상품리스트 카운트.(진수우)
	Integer countGoodsList();
	
	// /on/staff/modifyGoods : 상품수정페이지에서 상품정보 조회.(진수우)
	Map<String, Object> selectGoodsOne(Integer goodsNum);
	
	// /on/staff/modifyGoods : 상품수정페이지에서 상품정보 수정.(진수우)
	Integer updateGoods(Goods goods);
}
