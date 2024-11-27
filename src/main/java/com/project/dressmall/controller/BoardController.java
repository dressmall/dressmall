package com.project.dressmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dressmall.service.BoardService;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	@Autowired BoardService boardService;
	
	
	// insertBoard - 추가한 후 후기를 쓴 제품의 상세정보 페이지로 넘어감
	@PostMapping("/on/customer/addBoard")
	public String insertBoard(@RequestParam Integer ordersNo
							, @RequestParam String boardContent) {
		
		Board board = new Board();
		
		board.setOrdersNo(ordersNo);
		board.setBoardContent(boardContent);
		
		boardService.insertBoard(board);
		
		log.debug(TeamColor.PARK + ordersNo + TeamColor.RESET);
		
		return "redirect:/on/customer/goodsOne";
	}
	
	// insertBoard - 폼
	@GetMapping("/on/customer/addBoard")
	public String insertBoard() {
		
		return "on/customer/addBoard";
	}
	
	// deleteBoard - 후기 삭제
	@GetMapping("/on/customer/goodsOne")
	public String deleteBoard(Board board) {
		Integer row = boardService.deleteBoard(board);
		
		return "redirect:/on/customer/goodsOne" ;
	}

}
