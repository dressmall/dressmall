package com.project.dressmall.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Staff;

@Mapper
public interface StaffMapper {
	
	// staffLogin.jsp
	Staff staffLogin(Staff staff);
}
