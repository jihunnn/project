package com.project.simple.admin.dao;


import java.util.List;

import org.springframework.dao.DataAccessException;

import com.project.simple.admin.vo.AdminVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;


public interface AdminDAO {
	
	public AdminVO adminloginById(AdminVO adminVO) throws DataAccessException;
	
	public MemberVO selectMember(String memId) throws DataAccessException;
	
	public List<ArticleVO> selectAllInquiryList(Criteria cri) throws DataAccessException;
	public int selectInquiryCount() throws DataAccessException;
	
	public ArticleVO selectNotice(int noticeNum) throws DataAccessException ;


}
