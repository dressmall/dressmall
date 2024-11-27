package com.project.dressmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.OrdersMapper;

@Service
@Transactional
public class OrdersService {
	@Autowired OrdersMapper ordersMapper;
	
	// on/customer/orderList
	public List<Map<String, Object>> ordersList(Map<String, Object> param) {
		return ordersMapper.ordersList(param);
	}
}
