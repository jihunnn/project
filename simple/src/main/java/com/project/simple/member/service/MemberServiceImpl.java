package com.project.simple.member.service;


import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
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
	
	//�α��� ��� ���� �߰�
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception{
		return memberDAO.loginById(memberVO);
	}
	
	//�׾Ʒ� �α��� ��� ���� �߰�
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
	@Override
	public MemberVO findId(MemberVO memberVO) throws Exception {
		return memberDAO.find_Id(memberVO);
	}
	@Override
	public String overlapped(String memId) throws Exception {
		
		return memberDAO.selectOverlappedID(memId);
	}
	// ���̵� �ߺ� �˻�(AJAX)
	@Override
	public void check_id(String memId, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberDAO.check_id(memId));
		out.close();
		
	}
	// �̸��� �߼�
	@Override
	public void send_mail(MemberVO memberVO, String div) throws Exception {
		// Mail Server ����
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "ekwjd8683@gmail.com";
		String hostSMTPpwd = "Dbek4026!";

		// ������ ��� EMail, ����, ����
		String fromEmail = "ekwjd8683@gmail.com";
		String fromName = "SIMPLE";
		String subject = "";
		String msg = "";

		if(div.equals("find_pw")) {

			subject = "SIMPLE ������ȣ �Դϴ�.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg +=  "";
			msg += "<p>������ȣ�� ";
			msg += memberVO.getApproval_key();
			msg += "�Դϴ�</p></h3>";
			msg += "�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ� �ּ���.</div>";
		}
			

		
		// �޴� ��� E-Mail �ּ�
		String name = memberVO.getmemName();
		String mail = memberVO.getmemEmail();
		try {
			HtmlEmail memEmail = new HtmlEmail();
			memEmail.setDebug(true);
			memEmail.setCharset(charSet);
			memEmail.setSSL(true);
			memEmail.setHostName(hostSMTP);
			memEmail.setSmtpPort(587);

			memEmail.setAuthentication(hostSMTPid, hostSMTPpwd);
			memEmail.setTLS(true);
			memEmail.addTo(mail, name,charSet);
			memEmail.setFrom(fromEmail, fromName, charSet);
			memEmail.setSubject(subject);
			memEmail.setHtmlMsg(msg);
			memEmail.send();
		} catch (Exception e) {
			System.out.println("���Ϲ߼� ���� : " + e);
		}
	}
	@Override
	public void find_pw(HttpServletResponse response, MemberVO memberVO) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// ���̵� ������
		if(memberDAO.check_id(memberVO.getmemId()) == 0) {
			out.print("���̵� �����ϴ�.");
			out.close();
		}// ���Կ� ����� �̸����� �ƴϸ�
		else if(!memberVO.getmemEmail().equals(memberDAO.check_email(memberVO.getmemId()).getmemEmail())) {
			out.print("��ϵ� �̸����� �ƴմϴ�.");
			out.close();
		}else {
		
			   
			// ������ȣ ����
			String Approval_key = "";
			for (int i = 0; i < 12; i++) {
				Approval_key += (char) ((Math.random() * 26) + 97);
			}
			memberVO.setApproval_key(Approval_key);
			// ������ȣ ����
			memberDAO.update_pw(memberVO);
			// ������ȣ ���� �߼�
			send_mail(memberVO, "find_pw");
				
			out.print("�̸��Ϸ� ������ȣ�� �߼��Ͽ����ϴ�.");
			out.close();
		}
			
		}
	@Override
	public MemberVO email_confirm(String approval_key) throws Exception {
		return memberDAO.EmailConfirm(approval_key);
	}
	
	
}