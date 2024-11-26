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
	
	// /on/staff/addGoods : 카테고리 리스트 출력(상품등록에서 카테고리 선택시 필요)
	public List<Category> getCategoryListByGoods() {
		return categoryMapper.selectCategoryListByGoods();
	}
	
	// /on/staff/removeCategory : 카테고리 삭제
	public int removeCategory(Integer categoryNo) {
		return categoryMapper.deleteCategory(categoryNo);
	}
	
	// /on/staff/addCategory : 카테고리 추가
	public int addCategory(Category paramCategory) {
		return categoryMapper.insertCategory(paramCategory);
	}
	
	// /on/staff/categoryrList : 카테고리 리스트 출력
	public List<Category> getCategoryList(Map paramMap) {
		return categoryMapper.selectCategoryList(paramMap);
	}
	
	// /on/staff/categoryrList : 카테고리 리스트 전체 행 개수(페이징에 필요)
	public Integer countCategoryList() {
		return categoryMapper.countCategoryList();
	}
}
