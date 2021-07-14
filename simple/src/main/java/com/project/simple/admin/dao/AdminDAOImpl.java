package com.project.simple.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.simple.admin.vo.AdminVO;


@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	//로그인 기능 구현 추가
		public AdminVO adminloginById(AdminVO adminVO) throws DataAccessException{
			AdminVO vo = sqlSession.selectOne("mapper.admin.adminloginById", adminVO);
			return vo;
		}

}
