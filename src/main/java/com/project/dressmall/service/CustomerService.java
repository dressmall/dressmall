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
	
	// /on/customer/modifyCustomer : 회원 비밀번호 수정 페이지에서 비밀번호 수정.(진수우)
	public Integer modifyCustomer(Customer customer) {
		return customerMapper.updateCustomer(customer);
	}
	
	// /on/customer/myPage : 마이페이지에서 회원정보 출력.(진수우)
	public List<Map<String, Object>> getCustomerOne(String customerMail) {
		return customerMapper.selectCustomerOne(customerMail);
	}
	
	// /on/customer/customerLogin - 이메일 중복 검사(박시현)
	public boolean checkCustomerMail(String customerMail) {
		Integer count = customerMapper.checkCustomerMail(customerMail);
		return count > 0;
	}
	
	// /on/customer/customerLogin - 일반회원 로그인(박시현)
	public Customer customerLogin(Customer customer) {
		return customerMapper.customerLogin(customer);
	}
	
	// /on/customer/signup - 회원가입(회원가입 시 고객리스트에 추가)(박시현)
	public boolean insertCustomer(Customer customer) {
		if (checkCustomerMail(customer.getCustomerMail())) {
            // 이메일이 중복된 경우 false 반환
            return false;
        }
        
        // 이메일 중복이 없다면 회원가입 로직 발생
        int row = customerMapper.insertCustomer(customer);
        return row > 0;
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
