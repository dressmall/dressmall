package com.project.dressmall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dressmall.mapper.BoardMapper;
import com.project.dressmall.service.BoardService;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	@Autowired BoardService boardService;
	@Autowired BoardMapper boardMapper;
	
	
	// insertBoard - 추가한 후 후기를 쓴 제품의 상세정보 페이지로 넘어감
	@PostMapping("/on/customer/addBoard")
	public String insertBoard(@RequestParam String boardContent
							, @RequestParam("ordersNo") Integer ordersNo
							, @RequestParam("goodsNo") Integer goodsNo) {
		
		Board board = new Board();
		
		board.setOrdersNo(ordersNo);
		board.setBoardContent(boardContent);
		
		boardService.insertBoard(board);
		
		log.debug(TeamColor.PARK + "ordersNo : " + ordersNo + TeamColor.RESET);
		log.debug(TeamColor.PARK + "goodsNo : " + goodsNo + TeamColor.RESET);
		log.debug(TeamColor.PARK + "boardContent : " + boardContent + TeamColor.RESET);
		
		
		return "redirect:/on/customer/goodsOne?goodsNo=" + goodsNo;
	}
	
	// insertBoard - 폼
	@GetMapping("/on/customer/addBoard")
	public String insertBoard(Model model
								, @RequestParam("ordersNo") Integer ordersNo) {
		
		// goods정보 출력
		List<Map<String, Object>> ordersByGoods = boardMapper.selectBoardList(ordersNo);
		
		model.addAttribute("ordersByGoods",ordersByGoods);
		model.addAttribute("ordersNo",ordersNo);
		
		log.debug(TeamColor.PARK + "ordersNo : " + ordersNo + TeamColor.RESET);
		log.debug(TeamColor.PARK + "ordersByGoods : " + ordersByGoods + TeamColor.RESET);
		
		return "on/customer/addBoard";
	}
	
	// deleteBoard - 후기 삭제
	@GetMapping("/on/customer/goodsOne")
	public String deleteBoard(Board board) {
		Integer row = boardService.deleteBoard(board);
		
		return "redirect:/on/customer/goodsOne" ;
	}

}