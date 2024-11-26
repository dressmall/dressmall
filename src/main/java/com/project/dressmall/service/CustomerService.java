package com.project.dressmall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.CustomerMapper;
import com.project.dressmall.vo.Customer;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	
	// /on/customer/signup - 회원가입(회원가입 시 고객리스트에 추가)
	public Integer insertCustomer(Customer customer) {
		return customerMapper.insertCustomer(customer);
	}
	
	
	// /on/staff/customerList - 관리자페이지에서 결제리스트 출력.
	public List<Map<String, Object>> getCustomerList(Integer currentPage, Integer rowPerPage, Integer beginRow) {
		// 페이징에 필요한 정보를 Map에 저장.
		Map<String, Object> param = new HashMap<>();
		param.put("beginRow", beginRow);
		param.put("rowPerPage", rowPerPage);
		return customerMapper.selectCustomerList(param);
	}
	
	// /on/staff/customerList - 관리자페이지에서 고객리스트 카운트.
	public Integer countCustomerList() {
		return customerMapper.countCustomerList();
	}
	
	// /on/staff/deleteCustomer - 관리자페이지에서 고객 탈퇴처리.
	public Integer removeCustomer(String customerMail) {
		return customerMapper.deleteCustomer(customerMail);
	}
}
