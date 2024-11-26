package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Customer;

@Mapper
public interface CustomerMapper {
	
	// /on/customer/customerLogin 
	Customer customerLogin(Customer customer);
	// /on/customer/signup - 회원가입(회원가입 시 고객리스트에 추가) 
	Integer insertCustomer(Customer customer);
	
	// /on/staff/customerList - 관리자페이지에서 고객리스트 출력.
	List<Map<String, Object>> selectCustomerList(Map<String, Object> param);
	
	// /on/staff/customerList - 관리자페이지에서 고객리스트 카운트.
	Integer countCustomerList();
	
	// /on/staff/deleteCustomer - 관리자페이지에서 고객 탈퇴처리.
	Integer deleteCustomer(String customerMail);
}
