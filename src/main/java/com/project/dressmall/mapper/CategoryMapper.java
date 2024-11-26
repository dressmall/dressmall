package com.project.dressmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Category;

@Mapper
public interface CategoryMapper {
	
	// /on/staff/categoryrList : 카테고리 리스트 출력
	List<Category> selectCategoryList();
	/////test//dfsfsf
}
