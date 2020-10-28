package com.ch.s4.member.memberFile;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ch.s4.MyTestCase;

public class MemberFileDAOTest extends MyTestCase{
	
	@Autowired
	private MemberFileDAO memberFileDAO;

	@Test
	public void setInsertTest() throws Exception{
		MemberFileDTO memberFileDTO = new MemberFileDTO();
		memberFileDTO.setId("ID4");
		memberFileDTO.setFileName("fileName");
		memberFileDTO.setOriName("oriName");
		
		int result = memberFileDAO.setInsert(memberFileDTO);
		
		assertEquals(1, result);
		
	}
}
