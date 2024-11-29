package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Board;

@Mapper
public interface BoardMapper {
	// on/customer/goodsOne
	List<Map<String, Object>> selectBoardList(Integer goodsNo);
	
	// on/customer/ordersList - board을 입력하면 리뷰등록 버튼이 삭제(박시현) 
	boolean selectBoardByOrders(Integer ordersNo);
	
	// on/customer/addBoard - 후기 추가 폼에 쓸 goods/orders정보 (박시현)
	List<Map<String, Object>> addBoardByOrdersList(Integer ordersNo);
	
	// insertBoard - 후기 추가(박시현)
	Integer insertBoard(Board board);
	
	// deleteBoard - 후기 삭제(박시현)
	Integer deleteBoard(Integer ordersNo);
}
