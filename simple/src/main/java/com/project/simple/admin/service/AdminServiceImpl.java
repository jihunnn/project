package com.project.simple.admin.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.simple.admin.dao.AdminDAO;
import com.project.simple.admin.vo.AdminVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;

@Service("adminService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;

	// 로그인 기능 구현 추가
	@Override
	public AdminVO login(AdminVO adminVO) throws Exception {
		return adminDAO.adminloginById(adminVO);
	}

	// 멤버상세보기
	@Override
	public MemberVO viewMember(String memId) throws Exception {
		MemberVO memberVO = adminDAO.selectMember(memId);

		return memberVO;
	}
	
	//1:1문의 전체글 조회
	public List<ArticleVO> listAllInquiry(Criteria cri) throws Exception{
		List<ArticleVO> inquiryList = adminDAO.selectAllInquiryList(cri);
		return inquiryList;
	}
	
	public int inquiryCount() throws Exception{
		int inquiryCount = adminDAO.selectInquiryCount();
		return inquiryCount;
	}
	
	//공지사항 글 추가하기
	@Override
	public int addNewNotice(Map noticeMap) throws Exception{
		return adminDAO.insertNewNotice(noticeMap);
	}
	
	
	//공지사항 수정하기폼
	@Override
	public ArticleVO noticeForm(int noticeNum) throws Exception {
		ArticleVO articleVO = adminDAO.selectNotice(noticeNum);
		return articleVO;
	}
	
	
	//공지사항 수정하기
	@Override
	public void modNotice(Map noticeMap) throws Exception {
		adminDAO.updateNotice(noticeMap);
	}
	
	//공지사항 삭제하기
	@Override
	public void removeNotice(int noticeNum) throws Exception {
		adminDAO.deleteNotice(noticeNum);
	}

	@Override
	public int admin_modMember(MemberVO modmember) throws DataAccessException {
		return adminDAO.updateAdminMember(modmember);
	}

	@Override
	public void admin_selectremoveMember(String memId) throws Exception {
		adminDAO.deleteSelectRemoveMember(memId);
		
	}


}
