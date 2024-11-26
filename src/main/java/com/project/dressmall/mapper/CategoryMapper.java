package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Category;

@Mapper
public interface CategoryMapper {
	
	// /on/staff/addGoods : 카테고리 리스트 출력(상품등록에서 카테고리 선택시 필요)
	List<Category> selectCategoryListByGoods();
	
	// /on/staff/removeCategory : 카테고리 삭제
	int deleteCategory(Integer categoryNo);
	
	// /on/staff/addCategory : 카테고리 추가
	int insertCategory(Category category);
	
	// /on/staff/categoryrList : 카테고리 리스트 출력
	List<Category> selectCategoryList(Map<String, Object> paramMap);
	
	// /on/staff/categoryrList : 카테고리 리스트 전체 행 개수(페이징에 필요)
	Integer countCategoryList();
}
