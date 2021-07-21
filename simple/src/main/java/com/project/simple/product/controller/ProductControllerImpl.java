package com.project.simple.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.mypage.vo.MypageVO;
import com.project.simple.page.Criteria;
import com.project.simple.page.PageMaker;
import com.project.simple.product.service.ProductService;
import com.project.simple.product.vo.ProductVO;

@Controller("productController")

public class ProductControllerImpl implements ProductController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\spring\\product_image";
	private static final String ARTICLE_IMAGE_REPO_productReview = "C:\\spring\\asCenter_image";
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductVO productVO;
	private static final Logger logger = LoggerFactory.getLogger(ProductControllerImpl.class);
	
	
	
	

	@Override //��ǰ����ϱ�
	@RequestMapping(value="product/addProduct.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> productMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			productMap.put(name, value);


		}

		List<String> productImage1 = upload(multipartRequest);
		String productImage = productImage1.get(0).toString();
		String productContentImage = productImage1.get(1).toString();
		productMap.put("productImage", productImage);
		productMap.put("productContentImage", productContentImage);
		System.out.println(productMap);
		//HttpSession session = multipartRequest.getSession();
		//MemberVO memberVO = (MemberVO) session.getAttribute("member");
		//String memId = memberVO.getmemId();
		
		//inquiryMap.put("memId", memId);

		String productNum = (String) productMap.get("productNum");


		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {

			if (productImage1 != null && productImage1.size() != 0) {
				Iterator<String> it = productImage1.iterator();
				while(it.hasNext()) {
					String productImg =it.next();
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productImg);
					File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + productNum);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					
			
				}

			productService.addProduct(productMap);	
			
			
			

			}

			message = "<script>";
			message += " alert('��ǰ ����� �Ϸ�Ǿ����ϴ�.');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/product/admin_listProduct.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			Iterator<String> it = productImage1.iterator();
			while(it.hasNext()) {
				String productImg =it.next();
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productImg);
				srcFile.delete();
			}

			

			message = "<script>";
			message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ����ּ���');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/product/add_product.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String productImage = null;
		List<String> product = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();

			MultipartFile mFile = multipartRequest.getFile(fileName);
			productImage = mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productImage));// �ӽ÷� ����� multipartFile�� ���� ���Ϸ� ����
					product.add(productImage);
																							
				}
					
				
			}
		}
		return product;

	}

	// ��ǰ�߰���
	@RequestMapping(value = "product/add_product.do", method = RequestMethod.GET)
	private ModelAndView add_product(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override // ��ǰ��� ��ȸ
	@RequestMapping(value = "product/listProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listProduct(@RequestParam("sort") String sort, @RequestParam("subsort") String subsort,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> ProductMap = new HashMap<String, Object>();

		// -------------------------ħ��ī�װ�--------------------------------------
		if ("ħ��".equals(sort)) {
			if ("x".equals(subsort)) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_bed");
				return mav;
			} else if (subsort != null) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_bed");
				return mav;
			}

			return mav;
		}

		// -------------------����ī�װ�------------------------------------------------
		if ("����".equals(sort)) {
			if ("x".equals(subsort)) {
				ProductMap.put("sort", sort);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_sofa");
				return mav;
			}
			if ("ȭ���/����/����".equals(sort)) {

				List<ProductVO> productList = productService.listProduct(ProductMap);

				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_wardrobe");
				return mav;
			}
			if ("��Ź/����".equals(sort)) {

				List<ProductVO> productList = productService.listProduct(ProductMap);

				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_table01");
				return mav;
			}
			if ("���̺�/å��/å��".equals(sort)) {

				List<ProductVO> productList = productService.listProduct(ProductMap);

				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_table02");
				return mav;
			} else {
				return mav;
			}
		}
		return mav;
	}

	@Override // ������ ��ǰ��� ��ȸ
	@RequestMapping(value = "product/admin_listProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView admin_listProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ProductVO> admin_productList = productService.admin_listProduct();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("admin_productList", admin_productList);
		return mav;
	}

	// ����ȭ��
	@RequestMapping(value = "/product/modProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productForm(@RequestParam("productNum") String productNum,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {

		String viewName = (String) multipartRequest.getAttribute("viewName");
		productVO = productService.productForm(productNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("productNum", productVO);

		return mav;
	}

	
	@RequestMapping(value = "/product/modNewProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity modProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> productMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			productMap.put(name, value);

		}
		
		List<String> productImage = upload(multipartRequest);
		System.out.println(productImage);
				

		String productImage1 = productImage.get(0).toString();
				
		String productContentImage1 = productImage.get(1).toString();
	

		

		productMap.put("productImage1", productImage1);
		productMap.put("productContentImage1", productContentImage1);
		
		String productNum = (String) productMap.get("productNum");
		productMap.put("productNum", productNum);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			
			System.out.println(productMap);
			productService.modProduct(productMap);
			System.out.println(productMap);
			if (productImage != null && productImage.size() != 0) {

				String OrignProductImage = (String) productMap.get("OrignProductImage");
				String OrignProductContentImage = (String) productMap.get("OrignProductContentImage");
				System.out.println(OrignProductImage);
				System.out.println(OrignProductContentImage);
				
				if(OrignProductImage !=null) {
					File oldFile = new File(ARTICLE_IMAGE_REPO + "\\" + productNum + "\\" + OrignProductImage);
					oldFile.delete();}
				if (OrignProductContentImage != null){					
					File oldFile1 = new File(ARTICLE_IMAGE_REPO + "\\" + productNum + "\\" + OrignProductContentImage);
					oldFile1.delete();}

				if(productImage1 !=null) {
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productImage1);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + productNum);
				FileUtils.moveFileToDirectory(srcFile, destDir, true); } 
				if(productContentImage1 !=null){
					File srcFile1 = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productContentImage1);
					File destDir1 = new File(ARTICLE_IMAGE_REPO + "\\" + productNum);
					FileUtils.moveFileToDirectory(srcFile1, destDir1, true);
				}

			}
			message = "<script>";
			message += "alert('��ǰ�� �����߽��ϴ�.');";
			message += "location.href='" + multipartRequest.getContextPath()
					+ "/product/admin_detailproduct.do?productNum=" + productNum + "';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productImage);
			srcFile.delete();
			message = "<script>";
			message += "alert('������ �߻��߽��ϴ�. �ٽ� �������ּ���');";
			message += "location.href='" + multipartRequest.getContextPath()
					+ "/product/admin_detailproduct.do?productNum=" + productNum + "';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
			

	@Override
	@RequestMapping(value = "/product/removeProduct.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeProduct(@RequestParam("productNum") String productNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			productService.removeProduct(productNum);
			File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + productNum);
			FileUtils.deleteDirectory(destDir);

			message = "<script>";
			message += " alert('��ǰ�� �����߽��ϴ�.');";
			message += "  location.href='" + request.getContextPath() + "/product/admin_listProduct.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			message = "<script>";
			message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ����ּ���');";
			message += "  location.href='" + request.getContextPath() + "/product/admin_listProduct.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@RequestMapping(value = "/product/viewProduct.do", method = RequestMethod.GET)
	public ModelAndView viewProduct(@RequestParam("productNum") String productNum, Criteria cri,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> productMap = new HashMap();
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session=request.getSession();
		productVO = productService.viewProduct(productNum);
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		productMap.put("pageStart", pageStart);
		productMap.put("perPageNum", perPageNum);
		productMap.put("productNum", productNum);
		List<ProductVO> productReviewList= productService.listProductReview(productMap);
		int productReviewCount = productService.productReviewCount(productNum);
		List<ProductVO> productQuestionList = productService.listProductQuestion(productMap);
		int productQuestionCount = productService.productQuestionCount(productNum);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(productReviewCount);
		int pageNum = pageMaker.getCri().getPage();

		addQuick(productNum,productVO,session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("product", productVO);
		mav.addObject("productReviewList", productReviewList);
		mav.addObject("productQuestionList", productQuestionList);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("pageNum", pageNum);


		return mav;

	}


	@RequestMapping(value = "product/admin_detailproduct.do", method = RequestMethod.GET)
	public ModelAndView admin_detailproduct(@RequestParam("productNum") String productNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		productVO = productService.viewProduct(productNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("product", productVO);

		return mav;
	}

	// Ű���� �˻�
	@RequestMapping(value = "/keywordSearch.do", method = RequestMethod.GET, produces = "application/text; charset=utf8") // ��������
																															// �����ϴ�
																															// json��������
																															// �ѱ�
																															// ���ڵ���
																															// ����
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword, // �˻��� Ű���� ������
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		// System.out.println(keyword);
		if (keyword == null || keyword.equals(""))
			return null;

		keyword = keyword.toUpperCase();
		List<String> keywordList = productService.keywordSearch(keyword);// ������ Ű���尡 ���Ե� ��ǰ ���� ��ȸ

		// ���� �ϼ��� JSONObject ����(��ü)
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList); // ��ȸ�� �����͸� json�� ����

		String jsonInfo = jsonObject.toString(); // json�� ���ڿ��� ��ȯ�� �� �������� ���
		// System.out.println(jsonInfo);
		return jsonInfo;
	}

	@RequestMapping(value = "/searchProduct.do", method = RequestMethod.GET)
	public ModelAndView searchProduct(@RequestParam("searchWord") String searchWord, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ProductVO> productList = productService.searchProduct(searchWord); // �˻�â���� ������ �ܾ ���Ե� ��ǰ ������ ��ȸ

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("productList", productList);
		return mav;

	}
	
	//�ֱٺ� ��ǰ
	private void addQuick(String productNum,ProductVO productVO,HttpSession session){
		boolean already_existed=false;
		List<ProductVO> quickList; //�ֱ� �� ��ǰ ���� ArrayList
		quickList=(ArrayList<ProductVO>)session.getAttribute("quickList");
		
		if(quickList!=null){
			if(quickList.size() < 3){ //�̸��� ��ǰ ����Ʈ�� ��ǰ������ ���� ������ ���
				for(int i=0; i<quickList.size();i++){
					ProductVO productBean=(ProductVO)quickList.get(i);
					if(productNum.equals(productBean.getproductNum())){
						already_existed=true;
						break;
					}
				}
				if(already_existed==false){
					quickList.add(productVO);
				}
			}
			
		}else{
			quickList =new ArrayList<ProductVO>();
			quickList.add(productVO);
			
		}
		session.setAttribute("quickList",quickList);
		session.setAttribute("quickListNum", quickList.size());

		
	}
	
	/*@Override
	@RequestMapping(value = "product/listProductReview.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listProductReview(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ProductVO> productReviewList = productService.listProductReview(cri);
		int productReviewCount = productService.productReviewCount();
		ModelAndView mav = new ModelAndView(viewName);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(productReviewCount);
		int pageNum = pageMaker.getCri().getPage();
		mav.addObject("productReviewList", productReviewList);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("pageNum", pageNum);

		
		return mav;
	}*/


}