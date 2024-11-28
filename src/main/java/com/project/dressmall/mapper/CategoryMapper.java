package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Category;

@Mapper
public interface CategoryMapper {
	
	// /on/customer/main : 카테고리 리스트 + 카테고리별 개수 구하기.(김혜린)
	List<Map<String, Object>> countCategory();
	
	// /on/staff/addGoods : 카테고리 리스트 출력(상품등록에서 카테고리 선택시 필요).(김혜린)
	// /on/customer/main : 카테고리 리스트 출력 (카테고리별로 필터링)
	List<Category> selectCategoryListByGoods();
	
	// /on/staff/removeCategory : 카테고리 삭제.(김혜린)
	Integer deleteCategory(Integer categoryNo);
	
	// /on/staff/addCategory : 카테고리 추가.(김혜린)
	Integer insertCategory(Category category);
	
	// /on/staff/categoryrList : 카테고리 리스트 출력.(김혜린)
	List<Category> selectCategoryList(Map<String, Object> paramMap);
	
	// /on/staff/categoryrList : 카테고리 리스트 전체 행 개수(페이징에 필요).(김혜린)
	Integer countCategoryList();
}
