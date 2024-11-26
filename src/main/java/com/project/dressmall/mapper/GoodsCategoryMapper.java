package com.project.dressmall.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.GoodsCategory;

@Mapper
public interface GoodsCategoryMapper {

	// /on/staff/addGoods : 상품등록(카테고리등록)
	Integer insertGoodsCategory(GoodsCategory goodsCategory);
}
