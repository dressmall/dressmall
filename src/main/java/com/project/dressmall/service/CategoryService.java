package com.project.dressmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.CategoryMapper;
import com.project.dressmall.vo.Category;

@Service
@Transactional
public class CategoryService {
	@Autowired CategoryMapper categoryMapper;
	
	// /on/staff/categoryrList : 카테고리 리스트 출력
	public List<Category> getCategoryList() {
		return categoryMapper.selectCategoryList();
	}
}
