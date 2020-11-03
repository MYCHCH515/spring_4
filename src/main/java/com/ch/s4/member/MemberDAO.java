package com.ch.s4.member;

public interface MemberDAO {
		//idCheck
		public MemberDTO getMemberIdCheck(MemberDTO memberDTO)throws Exception;

		//join
		public int setMemberJoin(MemberDTO memberDTO)throws Exception;
		
		//login
		public MemberDTO getMemberLogin(MemberDTO memberDTO)throws Exception;
		
		//update
		public int setMemberUpdate(MemberDTO memberDTO)throws Exception;
		
		//delete
		public int setMemberDelete(MemberDTO memberDTO)throws Exception;
}
