package com.project.dressmall.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.AddressMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class AddressService {
	@Autowired AddressMapper addressMapper;
	
	// /on/customer/addAddress : 주소추가페이지에서 주소추가.(진수우)
	public Integer addAddress(Map<String, Object> param) {
		return addressMapper.insertAddress(param);
	}
}
