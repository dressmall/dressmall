package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Customer;

@Mapper
public interface OrdersMapper {
	
	// OrdersList 출력
	List<Map<String, Object>> selectOrdersList(Customer customerMail);
}
