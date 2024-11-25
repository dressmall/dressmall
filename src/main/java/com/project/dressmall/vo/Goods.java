package com.project.dressmall.vo;

import lombok.Data;

@Data
public class Goods {
	private Integer goodsNo;
	private Long goodsTitle;
	private Long goodsMemo;
	private Integer goodsPrice;
	private String goodsState;
	private String updateDate;
	private String createDate;	
}
