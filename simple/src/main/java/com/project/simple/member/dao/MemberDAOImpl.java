package com.project.simple.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.simple.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllMemberList() throws DataAccessException{
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}
	
	@Override
	public int insertMember(MemberVO memberVO)throws DataAccessException{
		int result=sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}
	
	@Override
	public int insertMember_naver(MemberVO memberVO)throws DataAccessException{
		int result=sqlSession.insert("mapper.member.insertMember_naver", memberVO);
		return result;
	}
	
	@Override
	public int deleteMember(MemberVO removemember) throws DataAccessException{
		int result=sqlSession.delete("mapper.member.deleteMember", removemember);
		return result;
	}
	
	//로그인 기능 구현 추가
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException{
		MemberVO vo = sqlSession.selectOne("mapper.member.loginById", memberVO);
		return vo;
	}
	
	public int updateMember(MemberVO modmember) throws DataAccessException{
		int result = sqlSession.update("mapper.member.updateMember", modmember);
		return result;
	}
}