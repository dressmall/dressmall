package com.project.dressmall.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Address;

@Mapper
public interface AddressMapper {
	// /on/customer/removeAddress : 마이페이지에서 주소삭제.(진수우)
	Integer deleteAddress(Integer addressNo);
	
	// /on/customer/modifyAddress : 주소수정페이지에서 주소수정.(진수우)
	Integer updateAddress(Map<String, Object> param);
	
	// /on/customer/modifyAddress : 주소수정페이지에서 기존주소조회.(진수우)
	Address selectAddressOne(Integer addressNo);
	
	// /on/customer/addAddress : 주소추가페이지에서 주소추가.(진수우)
	Integer insertAddress(Map<String, Object> param);
}
