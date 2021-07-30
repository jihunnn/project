package com.project.simple.admin.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.simple.admin.vo.AdminVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;

	// 로그인 기능 구현 추가
	public AdminVO adminloginById(AdminVO adminVO) throws DataAccessException {
		AdminVO vo = sqlSession.selectOne("mapper.admin.adminloginById", adminVO);
		return vo;
	}

	// DB에서 멤버 아이디에 해당하는 정보 조회
	@Override
	public MemberVO selectMember(String memId) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.selectMember", memId);
	}

	// Inquiry 전체 목록 조회
	@Override
	public List<ArticleVO> selectAllInquiryList(Criteria cri) throws DataAccessException {
		List<ArticleVO> inquiryList = sqlSession.selectList("mapper.admin.selectAllInquiryList", cri);
		return inquiryList;
	}

	@Override
	public int selectInquiryCount() throws DataAccessException {
		int inquiryCount = sqlSession.selectOne("mapper.admin.selectInquiryCount");

		return inquiryCount;
	}
	
	// notice 수정하기
	@Override
	public ArticleVO selectNotice(int noticeNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.selectNotice", noticeNum);
	}

}
