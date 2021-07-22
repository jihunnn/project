package com.project.simple.admin.dao;

import org.springframework.dao.DataAccessException;

import com.project.simple.admin.vo.AdminVO;


public interface AdminDAO {
	
	public AdminVO adminloginById(AdminVO adminVO) throws DataAccessException;

}
