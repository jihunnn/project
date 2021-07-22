package com.project.simple.delmember.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.simple.delmember.dao.DelMemberDAO;
import com.project.simple.delmember.vo.DelMemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RetireProcBatchRunner {
	
	@Autowired
	private DelMemberDAO delmemberDAO;
	
	private static final Logger log = LoggerFactory.getLogger(RetireProcBatchRunner.class);
	
	@RequestMapping(value = "admin_delmember.do", method = { RequestMethod.GET, RequestMethod.POST })
	@Scheduled(cron="0/10 * * * *")
	public void scheduleRun() {
		String batchResult="����";
		try {
			//����� ���� ��ȸ
			List<DelMemberVO> delmemberList = delmemberDAO.selectRetireMember();
			// ȸ��Ż�� �� ����� ������ �������� �ʴ� ��� 4���� �����ϰ� �����ϴ� ��� 3�� �۾��� ����
			System.out.println(delmemberList);
			if(delmemberList != null) {
				for(int i = 0 ; i < delmemberList.size(); i++) {
					DelMemberVO delmemberVO = delmemberList.get(i);
					
					//�ش� ����� ���� ����
					delmemberDAO.deleteRetireMember(delmemberVO);
				}
			}
		}catch(Exception e) {
			batchResult = "����";
		}
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		log.info("������ ���� : ["+ batchResult +"] "+ dateFormat.format(calendar.getTime()));
	}


}
