package com.ch.s4.member.memberUser;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ch.s4.member.MemberDTO;
import com.ch.s4.member.memberFile.MemberFileDTO;

@Controller
@RequestMapping(value="/member/**")
public class MemberUserController {
	@Autowired
	private MemberUserService memberUserService;
		
	@GetMapping("memberIdCheck")
	public ModelAndView getMemberIdCheck(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = memberUserService.getMemberIdCheck(memberDTO);
		
		int result = 1; //중복
		if(memberDTO==null) {
			result = 0;
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("memberJoin")
	public ModelAndView setMemberJoin() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoin");
		return mv;
	}
	
	@PostMapping("memberJoin")
	public ModelAndView setMemberJoin(MemberDTO memberDTO, MultipartFile photo, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println(photo.getOriginalFilename());
		System.out.println(photo.getName());
		System.out.println(photo.getSize());
		System.out.println(photo.getContentType());
		System.out.println(memberDTO.getEmail());
		
		int result = memberUserService.setMemberJoin(memberDTO, photo, session);
		mv.setViewName("redirect:../");

		return mv;
	}
	
	@GetMapping("memberDelete")
	public ModelAndView setMemberDelete(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO= (MemberDTO)session.getAttribute("member");
		int result = memberUserService.setMemberDelete(memberDTO);
		session.invalidate();
		mv.setViewName("redirect:../");
		return mv;
	}
	
	@GetMapping("memberUpdate")
	public ModelAndView setMemberUpdate() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberUpdate");
		return mv;
	}
	
	@PostMapping("memberUpdate")
	public ModelAndView setMemberUpdate(MemberDTO memberDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO s = (MemberDTO)session.getAttribute("member");
		memberDTO.setId(s.getId());
		
		int result = memberUserService.setMemberUpdate(memberDTO);
		
		if(result>0) { //세션에 저장되어있는 옛날데이터를 수정해줌
			s.setName(memberDTO.getName());
			s.setEmail(memberDTO.getEmail());
			session.setAttribute("member", s);
		}
		
		mv.setViewName("redirect:./memberPage");
		return mv;
	}
	
	//멤버페이지 넘길때 멤버파일 디티오 객체도 파라미터로 넘겨주기 
	//컨트롤러에서 디비에서 가져오기 
	@GetMapping("memberPage")
	public ModelAndView getMemberPage() throws Exception{
		ModelAndView mv = new ModelAndView();
//		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
//		MemberFileDTO memberFileDTO = memberUserService.getOne(memberDTO);
//		mv.addObject("file", memberFileDTO);
		mv.setViewName("member/memberPage");
		return mv;
	}

	@GetMapping("memberLogout")
	public ModelAndView getMemberLogout(HttpSession session) throws Exception{
		//웹브러우저 종료
		//일정시간경과 
		//memberDTO를 NULL로 대체 
		//유지시간을 강제를 0으로 변경
		session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:../");
		return mv;
	}
		
	@GetMapping("memberLogin")
	public ModelAndView getMemberLogin() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");
		return mv;
	}
	
	@PostMapping("memberLogin")
	public ModelAndView getMemberLogin(MemberDTO memberDTO, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		memberDTO = memberUserService.getMemberLogin(memberDTO);
		
		if(memberDTO != null) {
			//index 페이지로 이동
			//redirect
			//session에 member정보 저장해줌 
			session.setAttribute("member", memberDTO);
			mv.addObject("member", memberDTO);
			mv.setViewName("redirect:../");
			
		}else {
			//로그인 실패 메세지를 alert
			//로그인 입력폼으로 이동 
			//forward
			mv.addObject("msg", "Login Fail");
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/result");	
		}
		
		
		
		return mv;
		
	}
}
