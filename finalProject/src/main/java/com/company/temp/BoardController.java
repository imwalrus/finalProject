package com.company.temp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardController {
	// 1. 파라미터를 VO에 담고 결과 페이지에서 title, wirter를 출력
	@RequestMapping("/insertBoard")
	public String insertBoard(BoardVO vo) {
		return "insertBoardResult";
	}
	
	// 2. 파라미터를 VO에 담고 VO 응답
	@ResponseBody
	@RequestMapping("/ajaxInsertBoard")
	public BoardVO ajaxInsertBoard(BoardVO vo) {
		return vo;
	}
}
