package com.project.simple.member.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.simple.member.dao.MemberDAO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List<MemberVO> listMembers(Criteria cri) throws DataAccessException{
		List<MemberVO> membersList = memberDAO.selectAllMemberList(cri);
		return membersList;
	}
	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}
	
	@Override
	public int addMember_naver(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember_naver(member);
	}
	
	@Override
	public int removeMember(MemberVO removemember) throws DataAccessException{
		return memberDAO.deleteMember(removemember);
	}
	
	//로그인 기능 구현 추가
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception{
		return memberDAO.loginById(memberVO);
	}
	
	//네아로 로그인 기능 구현 추가
		@Override
		public MemberVO login_naver(MemberVO memberVO) throws Exception{
			return memberDAO.loginBynaver(memberVO);
		}
	
	@Override
	public int modMember(MemberVO modmember) throws DataAccessException {
		return memberDAO.updateMember(modmember);
	}
	@Override
	public int memberCount() throws Exception {
		int memberCount = memberDAO.selectMemberCount();
		return memberCount;
	}
	@Override
	public Map<String, Object> memberSearch(Map<String, Object> memberSearchMap) throws Exception {
		List<MemberVO> memberSearchList=memberDAO.memberSearchList(memberSearchMap);

		memberSearchMap.put("memberSearchList", memberSearchList);
		

		return memberSearchMap;
	}
	@Override
	public int memberSearchCount(Map<String, Object> search) throws Exception {
		int memberSearchCount = memberDAO.memberSearchCount(search);
		return memberSearchCount;
	}
	@Override
	public MemberVO admin_removeMember(String memId) throws DataAccessException {
		return memberDAO.deleteMemberlist(memId);

	}
	
}