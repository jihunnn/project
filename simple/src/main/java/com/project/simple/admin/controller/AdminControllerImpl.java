package com.project.simple.admin.controller;


import java.io.File;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.simple.admin.service.AdminService;
import com.project.simple.admin.vo.AdminVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;
import com.project.simple.page.PageMaker;
import com.project.simple.product.vo.ProductVO;
import com.project.simple.member.service.MemberService;
@Controller("adminController")
public class AdminControllerImpl implements AdminController {
	private static final String ARTICLE_IMAGE_REPO_notice="C:\\spring\\notice_image";
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberService memberService;

	@Autowired
	private AdminVO adminVO;

	@Autowired
	private MemberVO memberVO;

	private ArticleVO articleVO;

	// @Override
	@RequestMapping(value = "/admin/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("admin") AdminVO admin, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		adminVO = adminService.login(admin);
		if (adminVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", adminVO);
			session.setAttribute("AdminisLogOn", true);
			mav.setViewName("redirect:/product/admin_listProduct.do");
		} else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/admin_login.do");
		}
		return mav;
	}

	// �α׾ƿ� �۾�
	@RequestMapping(value = "admin/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		session.removeAttribute("AdminisLogOn");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}

	@RequestMapping(value = "/admin_login", method = { RequestMethod.GET, RequestMethod.POST })
	public String admin_login(Model model, HttpSession session) {

		return "admin_login";
	}

	// 1:1���� ��ü ����Ʈ ��������
	@Override
	@RequestMapping(value = "/admin/listAllInquiry.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listAllInquiry(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> inquiryMap = new HashMap<String, Object>();
		String viewName = (String) request.getAttribute("viewName");
		List<ArticleVO> listAllInquiry = adminService.listAllInquiry(cri);
		int inquiryCount = adminService.inquiryCount();
		ModelAndView mav = new ModelAndView(viewName);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(inquiryCount);
		int pageNum = pageMaker.getCri().getPage();
		inquiryMap.put("pageNum", pageNum);
		inquiryMap.put("inquiryList", listAllInquiry);
		mav.addObject("inquiryMap", inquiryMap);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}

	@RequestMapping(value = "/admin/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	//�������� �۾���

	@Override
	@RequestMapping(value = "/admin/addNewNotice.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewNotice(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> noticeMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			noticeMap.put(name, value);

		}

		String noticeImg = uploadNotice(multipartRequest);
		HttpSession session = multipartRequest.getSession();

		noticeMap.put("noticerNum", 0);

		noticeMap.put("noticeImg", noticeImg);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int noticeNum = adminService.addNewNotice(noticeMap);
			if (noticeImg != null && noticeImg.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO_notice + "\\" + "temp" + "\\" + noticeImg);
				File destDir = new File(ARTICLE_IMAGE_REPO_notice + "\\" + noticeNum);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			message = "<script>";
			message += " alert('������ �߰��߽��ϴ�.');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/board/listNotice.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO_notice + "\\" + "temp" + "\\" + noticeImg);
			srcFile.delete();

			message = "<script>";
			message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ����ּ���');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/admin/noticeForm.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	private String uploadNotice(MultipartHttpServletRequest multipartRequest) throws Exception {
		String noticeFile = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();

			MultipartFile mFile = multipartRequest.getFile(fileName);
			noticeFile = mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO_notice + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO_notice + "\\" + "temp" + "\\" + noticeFile));// �ӽ÷�
																													// �����
																													// multipartFile��
																													// ����
																													// ���Ϸ�
																													// ����

				}
			}
		}
		return noticeFile;

	}
	
	//�������� �����ϱ�
	@RequestMapping(value = "/admin/modNotice.do", method = RequestMethod.POST)
	public ModelAndView noticeForm(@RequestParam("noticeNum") int noticeNum,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {

		String viewName = (String) multipartRequest.getAttribute("viewName");
		articleVO = adminService.noticeForm(noticeNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("noticeNum", articleVO);

		return mav;
	}
	
	@RequestMapping(value = "/admin/modNewNotice.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modNewNotice(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> noticeMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			noticeMap.put(name, value);


		}
		

		
		String noticeImg = uploadNotice(multipartRequest);
		noticeMap.put("noticeImg", noticeImg);

		String noticeNum = (String) noticeMap.get("noticeNum");
		noticeMap.put("noticeNum", noticeNum);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {

			adminService.modNotice(noticeMap);
			
			if (noticeImg != null && noticeImg.length() != 0) {
				String OrignNoticeImg = (String) noticeMap.get("OrignNoticeImg");
				
				File oldFile = new File(ARTICLE_IMAGE_REPO_notice + "\\" + noticeNum + "\\" + OrignNoticeImg);
				oldFile.delete();

				File srcFile = new File(ARTICLE_IMAGE_REPO_notice + "\\" + "temp" + "\\" + noticeImg);
				File destDir = new File(ARTICLE_IMAGE_REPO_notice + "\\" + noticeNum);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

			}
			message = "<script>";
			message += " alert('���� �����߽��ϴ�.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewNotice.do?noticeNum="
					+ noticeNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO_notice + "\\" + "temp" + "\\" + noticeImg);
			srcFile.delete();
			message = "<script>";
			message += " alert('������ �߻��߽��ϴ�.�ٽ� �������ּ���');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewNotice.do?noticeNum="
					+ noticeNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	//�������� �����ϱ�
	@Override
	@RequestMapping(value = "/admin/removeNotice.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeNotice(@RequestParam("noticeNum") int noticeNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset-utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			adminService.removeNotice(noticeNum);
			File destDir = new File(ARTICLE_IMAGE_REPO_notice + "\\" + noticeNum);
			FileUtils.deleteDirectory(destDir);

			message = "<script>";
			message += " location.href='" + request.getContextPath() + "/board/listNotice.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('������ �߻��߽��ϴ�. �ٽ� �������ּ���);";
			message += " location.href='" + request.getContextPath() + "/board/viewNotice.do?noticeNum=" + noticeNum
					+ "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}
	
	//���ֹ��� ���� ���
	@Override
	@RequestMapping(value = "/admin/addNewQuestion.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewQuestion(@ModelAttribute("question") ArticleVO question, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		request.setCharacterEncoding("utf-8");

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			adminService.addNewQuestion(question);

			message = "<script>";
			message += " alert('�� ����� �Ϸ��Ͽ����ϴ�.');";
			message += "  location.href='" + request.getContextPath() + "/board/listQuestion.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			message = "<script>";
			message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ����ּ���');";
			message += "  location.href='" + request.getContextPath() + "/board/listQuestion.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	//���ֹ��� ���� �����ϱ� ��
	@RequestMapping(value = "/admin/modQuestion.do", method = RequestMethod.GET)
	public ModelAndView questionForm(@RequestParam("questionNum") int questionNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		articleVO = adminService.questionForm(questionNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("questionNum", articleVO);

		return mav;
	}
	
	//���ֹ��� ���� �����ϱ�
	@RequestMapping(value = "/admin/modNewQuestion.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modNewQuestion(@ModelAttribute("question") ArticleVO question, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

	
		request.setCharacterEncoding("utf-8");


		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			adminService.modQuestion(question);

			message = "<script>";
			message += " alert('���� �����߽��ϴ�.');";
			message += "  location.href='" + request.getContextPath() + "/board/listQuestion.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			message = "<script>";
			message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ����ּ���');";
			message += "  location.href='" + request.getContextPath() + "/board/listQuestion.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	//���ֹ������� �����ϱ�
	@Override
	@RequestMapping(value = "/admin/removeQuestion.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity removeQuestion(@RequestParam("questionNum") int questionNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset-utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			adminService.removeQuestion(questionNum);

			message = "<script>";
			message += " location.href='" + request.getContextPath() +"/board/listQuestion.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('������ �߻��߽��ϴ�. �ٽ� �������ּ���);";
			message += " location.href='" + request.getContextPath() + "/board/listQuestion.do';";
					
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}
	
	// ȸ���󼼺���
	@RequestMapping(value = "/admin/viewMember.do",  method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView viewMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String memId = request.getParameter("memId");
		String viewName = (String) request.getAttribute("viewName");
		memberVO = adminService.viewMember(memId);
		session.setAttribute("admin_member", memberVO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("member", memberVO);
		return mav;
	}
	//������ ȸ������ �����ϱ�
	@RequestMapping(value = "/admin/modMember.do", method = RequestMethod.POST)
	public void admin_modMember(@ModelAttribute("modmember") MemberVO modmember, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes rAttr) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = adminService.admin_modMember(modmember);
		System.out.println(result);
		session.removeAttribute("admin_member");
		
		if(result == 1) {
			out.println("<script>");
			out.println("alert('ȸ�� ������ �����Ͽ����ϴ�.');");
			out.println("location.href = '/simple/admin_listmember.do';");
			out.println("</script>");
			out.close();
		}
	
	}
	

	//������ ȸ�� ����
	@RequestMapping(value = "/admin_removeMember.do",method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView admin_removeMember(@RequestParam("memId") String memId, HttpServletRequest request, HttpServletResponse response)  throws Exception{
	
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.admin_removeMember(memId);
		mav.addObject("memId", memberVO);
		System.out.println(memId);
		mav.setViewName("redirect:/admin_listmember.do");
		return mav;
	}
	
	@RequestMapping(value = "/admin_selectremoveMember.do",method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView admin_selectremoveMember(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
	
				
		ModelAndView mav = new ModelAndView();
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
	
			adminService.admin_selectremoveMember(ajaxMsg[i]);
		}

		mav.setViewName("redirect:/admin_listmember.do");
		return mav;
	}
	
	


}
