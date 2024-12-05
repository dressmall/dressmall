package com.project.dressmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.DataMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class DataService {
	@Autowired DataMapper dataMapper;
	
	// 가장많이 주문한 상품 3개 출력(인기상품).(진수우)
	public List<Map<String, Object>> getPopularGoods() {
		return dataMapper.selectPopularGoods();
	}
}
