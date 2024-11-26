package com.project.dressmall.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dressmall.service.StaffService;
import com.project.dressmall.util.Page;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StaffController {
	@Autowired StaffService staffService;
	
	@GetMapping("/on/staff/staffList")
	public String staffList(HttpSession session, Model model, @RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "10") Integer rowPerPage) {
		// paging setter.
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setRowPerPage(rowPerPage);
		page.setNumPerPage(10);
		page.setCountTotalRow(staffService.countStaffList());
		
		// paging getter.
		model.addAttribute("currentPage", page.getCurrentPage());
		model.addAttribute("lastPage", page.countLastPage());
		model.addAttribute("beginPagingNum", page.countBeginPaingNum());
		model.addAttribute("endPagingNum", page.countEndPagingNum());
		model.addAttribute("numPerPage", page.getNumPerPage());
		
		// paymentList load.
		List<Staff> staffList = staffService.getStaffList(currentPage, rowPerPage, page.countBeginRow()); // get staffList.
		log.debug(TeamColor.JIN + staffList + TeamColor.RESET);
		model.addAttribute("staffList", staffList); // staffList model add.
		
		// paymentList.jsp load.
		model.addAttribute("loginStaff", session.getAttribute("loginStaff")); // login information model add.
		log.debug(TeamColor.JIN + "staffList.jsp 호출" + TeamColor.RESET);
		return "on/staff/staffList";
	}
	
	@GetMapping("/on/staff/addStaff")
	public String addStaff(String errMsg) {
		log.debug(TeamColor.JIN + "addStaff.jsp 호출" + TeamColor.RESET);
		return "on/staff/addStaff";
	}
	
	@PostMapping("/on/staff/addStaff")
	public String addStaff(Model model, Staff staff) {
		List<Staff> staffList = staffService.getStaffList(null, null, null);
		for(Staff s : staffList) {
			if (s.getStaffId().equals(staff.getStaffId())) {
				String errMsg = "중복된 아이디입니다.";
				try {
					errMsg = URLEncoder.encode(errMsg, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				return "redirect:/on/staff/addStaff?errMsg=" + errMsg;
			}
		}
		staffService.addStaff(staff); // DB addStaff.
		return "redirect:/on/staff/staffList";
	}
	
}
