package com.project.dressmall.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.GoodsFile;

@Mapper
public interface GoodsFileMapper {
	// /on/staff/addGoods : 상품이미지 파일정보 삽입 (진수우)
	Integer insertGoodsFile(GoodsFile goodsFile);
	
	// /on/staff/modifyGoods : 상품수정 페이지에서 파일삭제.(진수우)
	Integer deleteGoodsFile(Integer fileNo);
}
