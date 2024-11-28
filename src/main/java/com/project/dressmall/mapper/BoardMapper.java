package com.project.dressmall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dressmall.vo.Board;

@Mapper
public interface BoardMapper {
	
	// on/customer/addBoard - goods정보 출력 / goosOne에서 출력
	List<Map<String, Object>> selectBoardList(Integer ordersNo);
	
	// insertBoard - 후기 추가 
	Integer insertBoard(Board board);
	
	// deleteBoard - 후기 삭제
	Integer deleteBoard(Board board);
}
