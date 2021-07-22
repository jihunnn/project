package com.project.simple.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;

import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;

public interface MemberService{
	public List<MemberVO> listMembers(Criteria cri) throws DataAccessException;
	
	public int memberCount() throws Exception;
	
	public int addMember(MemberVO memberVO) throws DataAccessException;
	
	public int addMember_naver(MemberVO memberVO) throws DataAccessException;
	
	public int modMember(MemberVO modmember) throws DataAccessException;
	
	public int removeMember(MemberVO removemember) throws DataAccessException;
	
	public MemberVO login(MemberVO memberVO) throws Exception;

	public MemberVO login_naver(MemberVO memberVO) throws Exception;

	public Map<String, Object> memberSearch(Map<String, Object> memberSearchMap)throws Exception;

	public int memberSearchCount(Map<String, Object> search) throws Exception;

	public MemberVO admin_removeMember(String memId) throws DataAccessException;

	
	
}