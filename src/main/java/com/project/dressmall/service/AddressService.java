package com.project.dressmall.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.AddressMapper;
import com.project.dressmall.vo.Address;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class AddressService {
	@Autowired AddressMapper addressMapper;
	
	// /on/customer/removeAddress : 마이페이지에서 주소삭제.(진수우)
	public Integer removeAddress(Integer addressNo) {
		return addressMapper.deleteAddress(addressNo);
	}
	
	// /on/customer/modifyAddress : 주소수정페이지에서 주소수정.(진수우)
	public Integer modifyAddress(Map<String, Object> param) {
		return addressMapper.updateAddress(param);
	}
	
	// /on/customer/modifyAddress : 주소수정페이지에서 기존주소조회.(진수우)
	public Address getAddressOne(Integer addressNo) {
		return addressMapper.selectAddressOne(addressNo);
	}
	
	// /on/customer/addAddress : 주소추가페이지에서 주소추가.(진수우)
	public Integer addAddress(Map<String, Object> param) {
		return addressMapper.insertAddress(param);
	}
}
