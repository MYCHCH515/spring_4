package com.ch.s4.board.notice;

import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.ch.s4.board.BoardDTO;
import com.ch.s4.board.BoardService;
import com.ch.s4.board.file.BoardFileDTO;
import com.ch.s4.util.FileSaver;
import com.ch.s4.util.Pager;

@Service
public class NoticeService implements BoardService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileSaver fileSaver;
	
	@Override
	public int setInsert(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		//파일을 HDD에 저장 
		String path = session.getServletContext().getRealPath("/resource/upload/notice");
		File file = new File(path);
		System.out.println(path);
		
		//---sequence
		//boardDTO.setNum(noticeDAO.getNum());
		
		//---Notice Insert 
		//지금 boardDTO 에 NUM은 0임 insert를 해야 글번호가 seq통해 생성됨
		int result = noticeDAO.setInsert(boardDTO);
		
		//---NoticeFile Insert
		
		for (MultipartFile multipartFile: files) { //files에서 multipartfile 타입의 객체들 꺼냄
			if(multipartFile.getSize() !=0) {
				String fileName = fileSaver.saveCopy(file, multipartFile);	
	
				BoardFileDTO boardFileDTO = new BoardFileDTO();
				boardFileDTO.setFileName(fileName);
				boardFileDTO.setOriName(multipartFile.getOriginalFilename());
				boardFileDTO.setNum(boardDTO.getNum());
				
				noticeDAO.setInsertFile(boardFileDTO);
				}
			}
		
		//------------
		return result;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.setUpdate(boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.setDelete(boardDTO);
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		pager.makeRow();
		pager.setTotalCount(noticeDAO.getCount(pager));
		pager.makePage();
		return noticeDAO.getList(pager);
	}

	@Override
	public BoardDTO getOne(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.getOne(boardDTO);
	}

}
