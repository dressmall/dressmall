package com.project.dressmall.service;

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
}
