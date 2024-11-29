package com.project.dressmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.BoardMapper;
import com.project.dressmall.vo.Board;

@Service
@Transactional
public class BoardService {
	@Autowired BoardMapper boardMapper;
	
	// on/customer/goodsOne(박시현) 
	public List<Map<String, Object>> selectBoardList(Integer goodsNo) {
		return boardMapper.selectBoardList(goodsNo);
	}
	
	// on/customer/ordersList - board을 입력하면 리뷰등록 버튼이 삭제(박시현) 
	public boolean selectBoardByOrders(Integer ordersNo) {
		return boardMapper.selectBoardByOrders(ordersNo);
	}
	
	// insertBoard - 후기 추가(박시현) 
	public Integer insertBoard(Board board) {
		return boardMapper.insertBoard(board);
	}
	
	// deleteBoard - 후기 삭제(박시현) 
	public Integer deleteBoard(Integer ordersNo) {
		return boardMapper.deleteBoard(ordersNo);
	}
}
