package com.project.simple.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.simple.admin.dao.AdminDAO;
import com.project.simple.admin.vo.AdminVO;
@Service("adminService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
	
	//로그인 기능 구현 추가
		@Override
		public AdminVO login(AdminVO adminVO) throws Exception{
			return adminDAO.adminloginById(adminVO);
		}

}
