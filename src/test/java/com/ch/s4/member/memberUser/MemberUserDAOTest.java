package com.ch.s4.member.memberUser;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ch.s4.MyTestCase;
import com.ch.s4.member.MemberDTO;

public class MemberUserDAOTest extends MyTestCase{
	
	@Autowired
	private MemberUserDAO memberUserDAO;
	
	//@Test
	public void getMemberLoginTest() throws Exception{
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("nam");
		memberDTO.setPw("1");

		memberDTO = memberUserDAO.getMemberLogin(memberDTO);
		
		assertNotNull(memberDTO);
	}
	

}
