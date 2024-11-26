package com.project.dressmall.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.GoodsCategory;

@Mapper
public interface GoodsCategoryMapper {
	// /on/staff/modifyGoods : 관리자페이지에서 상품수정할 때 카테고리 데이터 수정.(진수우)
	Integer updateCategoryByGoods(GoodsCategory goodsCategory);

	// /on/staff/addGoods : 상품등록(카테고리등록)
	Integer insertGoodsCategory(GoodsCategory goodsCategory);
}
