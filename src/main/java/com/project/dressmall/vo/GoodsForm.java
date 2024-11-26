package com.project.dressmall.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsForm {
	private Integer goodsNo;
	private Integer categoryNo;
	private String goodsTitle;
	private String goodsMemo;
	private Integer goodsPrice;
	private String goodsState;
	private MultipartFile goodsFile;
	
	
	
}
