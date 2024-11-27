package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrdersMapper {
	
	// OrdersList 출력
	List<Map<String, Object>> ordersList(Map<String, Object> param);
}
