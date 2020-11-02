package com.ch.s4.board.notice;

import java.util.List;
import javax.inject.Named;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Qualifier;
import com.ch.s4.board.BoardDAO;
import com.ch.s4.board.BoardDTO;
import com.ch.s4.board.file.BoardFileDTO;
import com.ch.s4.util.Pager;

@Repository
public class NoticeDAO implements BoardDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.ch.s4.board.notice.NoticeDAO.";

	public Long getNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}

	public int setInsertFile(BoardFileDTO boardFileDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setInsertFile", boardFileDTO);
	}
	
	@Override
	public int setInsert(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setInsert", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setUpdate", boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setDelete", boardDTO);
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}

	@Override
	public BoardDTO getOne(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getOne", boardDTO);
	}

	@Override
	public long getCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getCount", pager);
	}
	

}
