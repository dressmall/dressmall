package com.project.dressmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.CategoryMapper;
import com.project.dressmall.vo.Category;

@Service
@Transactional
public class CategoryService {
	@Autowired CategoryMapper categoryMapper;
	
	// /on/customer/main : 카테고리별 개수 구하기.(김혜린)
	public List<Map<String, Object>> getCategoryCounts() {
		return categoryMapper.countCategory();
	}
	
	// /on/staff/addGoods : 카테고리 리스트 출력(상품등록에서 카테고리 선택시 필요).(김혜린)
	// /on/customer/main : 카테고리 리스트 출력 (카테고리별로 필터링)
	public List<Category> getCategoryListByGoods() {
		return categoryMapper.selectCategoryListByGoods();
	}
	
	// /on/staff/removeCategory : 카테고리 삭제.(김혜린)
	public int removeCategory(Integer categoryNo) {
		return categoryMapper.deleteCategory(categoryNo);
	}
	
	// /on/staff/addCategory : 카테고리 추가.(김혜린)
	public int addCategory(Category paramCategory) {
		return categoryMapper.insertCategory(paramCategory);
	}
	
	// /on/staff/categoryrList : 카테고리 리스트 출력.(김혜린)
	public List<Category> getCategoryList(Map paramMap) {
		return categoryMapper.selectCategoryList(paramMap);
	}
	
	// /on/staff/categoryrList : 카테고리 리스트 전체 행 개수(페이징에 필요).(김혜린)
	public Integer countCategoryList() {
		return categoryMapper.countCategoryList();
	}
}
