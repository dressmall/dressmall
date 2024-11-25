package com.project.dressmall.vo;

import lombok.Data;

@Data
public class Customer {
	private String customerMail;	//PK
	private String customerPw;
	private String customerBirth;
	private String customerGender;
	private String updateDate;
	private String createDate;
}
