package com.ch.s4.member.memberFile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberFileService {
	
	@Autowired
	private MemberFileDAO memberFileDAO;
	
	public int setInsert(MemberFileDTO memberFileDTO) throws Exception{
		return memberFileDAO.setInsert(memberFileDTO);
	}
	
}
