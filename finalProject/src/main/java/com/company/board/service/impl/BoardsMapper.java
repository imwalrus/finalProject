package com.company.board.service.impl;

import com.company.board.service.BoardsVO;

public interface BoardsMapper {
	public int insertBoards(BoardsVO vo);
	
	public BoardsVO getBoards(BoardsVO vo);
}
