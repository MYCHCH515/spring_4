package com.ch.s4.member.memberFile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/memberFile/**")
public class MemberFileController {
	
	@Autowired
	private MemberFileService memberFileService;
	
	
	public void setInsert(MemberFileDTO memberFileDTO) throws Exception{
		int result = memberFileService.setInsert(memberFileDTO);
	}
}
