package com.project.dressmall.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Goods;

@Mapper
public interface GoodsMapper {
	// /on/staff/addGoods : 상품등록
	Integer insertGoods(Goods goods);
	
	// /on/staff/goodsList : 상품 리스트 출력
}
