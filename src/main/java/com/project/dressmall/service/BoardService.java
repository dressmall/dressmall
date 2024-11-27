package com.project.dressmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dressmall.mapper.BoardMapper;
import com.project.dressmall.vo.Board;

@Service
@Transactional
public class BoardService {
	@Autowired BoardMapper boardMapper;
	
	// insertBoard - 후기 추가 
	public Integer insertBoard(Board board) {
		return boardMapper.insertBoard(board);
	}
	
	// deleteBoard - 후기 삭제
	public Integer deleteBoard(Board board) {
		return boardMapper.deleteBoard(board);
	}
}
