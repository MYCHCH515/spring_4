package com.ch.s4.member.memberUser;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.s4.member.MemberDAO;
import com.ch.s4.member.MemberDTO;


@Repository
public class MemberUserDAO implements MemberDAO {
	
	@Autowired
	private SqlSession sqlsession;
	private final String NAMESPACE="com.ch.s4.member.memberUser.MemberUserDAO.";
	
	@Override
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+"getMemberLogin", memberDTO);
	}
	@Override
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception{
		return sqlsession.update(NAMESPACE+"setMemberUpdate", memberDTO);
	}
	
	@Override
	public int setMemberDelete(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.delete(NAMESPACE+"setMemberDelete", memberDTO);
	}

	@Override
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.insert(NAMESPACE+"setMemberJoin", memberDTO);
	}
	
	@Override
	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+"getMemberIdCheck", memberDTO);
	}
}
