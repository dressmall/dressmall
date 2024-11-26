package com.project.dressmall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.StaffMapper;
import com.project.dressmall.vo.Staff;

@Service
@Transactional
public class StaffService {
	@Autowired StaffMapper staffMapper;
	
	// staffLogin.jsp
	public Staff staffLogin(Staff staff) {
		return staffMapper.staffLogin(staff);
	}
	
	// /on/staff/staffList : 관리자페이지에서 스태프리스트 출력
	public List<Staff> getStaffList(Integer currentPage, Integer rowPerPage, Integer beginRow) {
		// 페이징에 필요한 정보를 Map에 저장.
		Map<String, Object> param = new HashMap<>();
		param.put("beginRow", beginRow);
		param.put("rowPerPage", rowPerPage);
		return staffMapper.selectStaffList(param);
	}
	
	// /on/staff/customerList - 관리자페이지에서 고객리스트 카운트.
	public Integer countStaffList() {
		return staffMapper.countStaffList();
	}
	
	// /on/staff/addStaff : 관리자페이지에서 스태프 추가.
	public Integer addStaff(Staff staff) {
		return staffMapper.insertStaff(staff);
	}
}
