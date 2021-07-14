package com.project.simple.cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.simple.cart.service.CartService;
import com.project.simple.cart.vo.CartVO;
import com.project.simple.member.vo.MemberVO;

@Controller("cartController")
public class CartControllerImpl implements CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private MemberVO memberVO;
	
	@RequestMapping(value="/myCartList.do" ,method = RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		MemberVO memberVO=(MemberVO)session.getAttribute("member");
		String memId=memberVO.getmemId();
		cartVO.setmemId(memId);
		Map<String ,List> cartMap=cartService.myCartList(cartVO);//��ٱ����������� ǥ���� ��ǰ ������ ��ȸ
		System.out.println(cartMap);
		session.setAttribute("cartMap", cartMap);//��ٱ��� ��� ȭ�鿡�� ��ǰ �ֹ� �� ����ϱ� ���ؼ� ��ٱ��� ����� ���ǿ� �����Ѵ�.
		//mav.addObject("cartMap", cartMap);
		return mav;
	}
	
	@RequestMapping(value="/addProductInCart.do" ,method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public @ResponseBody String addProductInCart(@RequestParam("productNum") String productNum,
			                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
		HttpSession session=request.getSession();
		MemberVO memberVO=(MemberVO)session.getAttribute("member");
		String memId=memberVO.getmemId();
		
		
		cartVO.setmemId(memId);
		//��ٱ��Ͽ� ��ϵ� ��ǰ���� �Ǻ�
		cartVO.setproductNum(productNum);
		boolean isAreadyExisted=cartService.findCartProduct(cartVO); //��ǰ��ȣ�� ��ٱ��Ͽ� �ִ��� ��ȸ
		System.out.println("isAreadyExisted:"+isAreadyExisted);
		if(isAreadyExisted==true){//��ǰ ��ȣ�� �̹� ��ٱ��� ���̺� ������ �̹� �߰��Ǿ��ٴ� �޽��� ����
			return "already_existed";
		}else{//������ ��ٱ��� ���̺� �߰�
			cartService.addProductInCart(cartVO);
			return "add_success";
		}
	}
	
	@RequestMapping(value="/removeCartProduct.do" ,method = RequestMethod.POST)
	public ModelAndView removeCartProduct( HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ModelAndView mav=new ModelAndView();
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i = 0 ; i < size; i++) {
			cartService.removeCartProduct(ajaxMsg[i]);
		}
		
		mav.setViewName("redirect:/mypage_08.do");
		return mav;
	}

	

}
