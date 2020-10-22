package com.ch.s4.board.qna;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ch.s4.MyTestCase;
import com.ch.s4.board.BoardDTO;
import com.ch.s4.util.Pager;

public class QnaDAOTest extends MyTestCase{
	
	@Autowired
	private QnaDAO qnaDAO;
	
	//@Test
	public void getListTest() throws Exception{
		Pager pager = new Pager();
		pager.makeRow();
		List<BoardDTO> ar = qnaDAO.getList(pager);
		System.out.println(ar.size());
		assertEquals(10, ar.size());
	}
	
	
	@Test
	public void setInsertTest() throws Exception{
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setTitle("22 test");
		boardDTO.setWriter("22 test");
		boardDTO.setContents("22 test");
		
		int result = qnaDAO.setInsert(boardDTO);
		
		assertEquals(1, result);
	}
}
