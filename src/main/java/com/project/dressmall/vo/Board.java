package com.project.dressmall.vo;

import lombok.Data;

@Data
public class Board {
	private Integer ordersNo;	// PK
	private String boardContent;
	private String updateDate;
	private String createDate;
}
