package com.project.dressmall.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AddressMapper {
	// /on/customer/addAddress : 주소추가페이지에서 주소추가.(진수우)
	Integer insertAddress(Map<String, Object> param);
}
