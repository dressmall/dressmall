package com.project.dressmall.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Board;

@Mapper
public interface BoardMapper {
	
	// insertBoard - 후기 추가 
	Integer insertBoard(Board board);
	
	// deleteBoard - 후기 삭제
	Integer deleteBoard(Board board);
}
