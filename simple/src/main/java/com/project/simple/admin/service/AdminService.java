package com.project.simple.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.simple.admin.vo.AdminVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;

public interface AdminService {
	public AdminVO login(AdminVO adminVO) throws Exception;
	
	public MemberVO viewMember(String memId) throws Exception;
	
	public List<ArticleVO> listAllInquiry(Criteria cri) throws Exception;
	public int inquiryCount() throws Exception;
	
	public int addNewNotice(Map noticeMap) throws Exception;
	public ArticleVO noticeForm(int noticeNum) throws Exception;
	
	public void modNotice(Map noticeMap) throws Exception;
	public void removeNotice(int noticeNum) throws Exception;

	public int admin_modMember(MemberVO modmember) throws DataAccessException;

	public void admin_selectremoveMember(String memId) throws Exception ;


}
