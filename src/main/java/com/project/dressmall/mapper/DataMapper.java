package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DataMapper {
	// 가장많이 주문한 상품 3개 출력(인기상품).(진수우)
	List<Map<String, Object>> selectPopularGoods();
}
