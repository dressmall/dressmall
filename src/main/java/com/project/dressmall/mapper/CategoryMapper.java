package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Category;

@Mapper
public interface CategoryMapper {
	
	// /on/staff/categoryrList : 카테고리 리스트 출력
	List<Category> selectCategoryList(Map<String, Object> paramMap);
	
	// /on/staff/categoryrList : 카테고리 리스트 전체 행 개수(페이징에 필요)
	Integer countCategoryList();
}
