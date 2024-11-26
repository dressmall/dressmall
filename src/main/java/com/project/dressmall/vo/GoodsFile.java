package com.project.dressmall.vo;

import lombok.Data;

@Data
public class GoodsFile {
	private Integer goodsFileNo;
	private Integer goodsNo;
	private String goodsFileName;
	private String goodsFileOrigin;
	private String goodsFileType;
	private String goodsFileExt;
	private Long goodsFileSize;
	private String updateDate;
	private String createDate;
}
