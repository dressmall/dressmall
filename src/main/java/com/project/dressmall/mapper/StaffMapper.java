package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Staff;

@Mapper
public interface StaffMapper {
	
	// staffLogin.jsp
	Staff staffLogin(Staff staff);
	
	// /on/staff/staffList : 관리자페이지에서 스태프리스트 출력
	List<Staff> selectStaffList(Map<String, Object> param);
	
	// /on/staff/staffList - 관리자페이지에서 스태프리스트 카운트.
	Integer countStaffList();
	
	// /on/staff/addStaff : 관리자페이지에서 스태프 추가.
	Integer insertStaff(Staff staff);
}
