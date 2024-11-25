package com.project.dressmall.util;

import lombok.Data;

@Data
public class Page {
	private Integer currentPage; // 현재 페이지.
	private Integer rowPerPage; // 리스트 출력 범위.
	private Integer countTotalRow; // 리스트 전체행 개수.
	private Integer numPerPage; // 페이징 개수.
	
	// 페이지 첫번째 행 계산.
	public Integer countBeginRow() {
		return (currentPage - 1) * rowPerPage;
	}
	
	// 마지막 페이지 계산.
	public Integer countLastPage() {
		Integer lastPage = countTotalRow / rowPerPage;
		if (countTotalRow % rowPerPage != 0) lastPage++;
		return lastPage;
	}
	
	// 페이징 첫번째 값 계산.
	public Integer countBeginPaingNum() {
		return (currentPage - 1) / 10 * 10 + 1;
	}
	
	// 페이징 마지막 값 계산.
	public Integer countEndPagingNum() {
		Integer endPagingNum = countBeginPaingNum()+ (numPerPage - 1);
		if (countLastPage() < endPagingNum) endPagingNum = countLastPage();
		return endPagingNum;
	}
}