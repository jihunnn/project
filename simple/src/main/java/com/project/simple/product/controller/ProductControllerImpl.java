package com.project.simple.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
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
import com.project.simple.page.Criteria;
import com.project.simple.page.PageMaker;
import com.project.simple.product.page.Criteria1;
import com.project.simple.product.page.Criteria2;
import com.project.simple.product.page.PageMaker1;
import com.project.simple.product.page.PageMaker2;
import com.project.simple.product.service.ProductService;
import com.project.simple.product.vo.ProductVO;

@Controller("productController")

public class ProductControllerImpl implements ProductController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\spring\\product_image";
	private static final String ARTICLE_IMAGE_REPO_review = "C:\\spring\\review_image";
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductVO productVO;
	private static final Logger logger = LoggerFactory.getLogger(ProductControllerImpl.class);
	
	
	@Override // ???? best???? ????
	@RequestMapping(value = "/main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		Map<String ,List> BestProductMap= productService.BestProductList();
		System.out.println(BestProductMap);
		mav.addObject("BestProductMap", BestProductMap);
		return mav;
	}

	

	@Override //????????????
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
			message += " alert('???? ?????? ??????????????.');";
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
			message += " alert('?????? ????????????. ???? ????????????');";
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
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productImage));// ?????? ?????? multipartFile?? ???? ?????? ????
					product.add(productImage);
																							
				}
					
				
			}
		}
		return product;

	}

	// ??????????
	@RequestMapping(value = "product/add_product.do", method = RequestMethod.GET)
	private ModelAndView add_product(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		List<String> optionName = productService.selectOptionName();

		mav.addObject("optionName", optionName);

		return mav;
	}

	@Override // ???????? ????
	@RequestMapping(value = "product/listProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listProduct(@RequestParam("sort") String sort, @RequestParam("subsort") String subsort,
			@RequestParam("filter") String filter, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> ProductMap = new HashMap<String, Object>();

		// -------------------------????????????--------------------------------------
		if ("????".equals(sort)) {
			if ("x".equals(subsort)) {
				if ("x".equals(filter)) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_bed");
				} else if (filter != null) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_bed");
				}
			}
		}
		if ("????".equals(sort) && subsort != null) {
			if ("x".equals(filter)) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_bed");
			} else if (filter != null) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_bed");
			}
		}

		// -------------------????????????------------------------------------------------
		if ("????".equals(sort)) {
			if ("x".equals(subsort)) {
				if ("x".equals(filter)) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_sofa");
				} else if (filter != null) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_sofa");
				}
			}
		}
		if ("????".equals(sort) && subsort != null) {
			if ("x".equals(filter)) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_sofa");
			} else if (filter != null) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_sofa");
			}
		}
		// -------------------??????/????/???? ????????----------------------------

		if ("??????/????/????".equals(sort)) {
			if ("x".equals(subsort)) {
				if ("x".equals(filter)) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_wardrobe");
				} else if (filter != null) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_wardrobe");
				}
			}
		}
		if ("??????/????/????".equals(sort) && subsort != null) {
			if ("x".equals(filter)) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_wardrobe");
			} else if (filter != null) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_wardrobe");
			}
		}
		
		//-------------------????/????-----------------------------------------
		if ("????/????".equals(sort)) {
			if ("x".equals(subsort)) {
				if ("x".equals(filter)) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_table01");
				} else if (filter != null) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_table01");
				}
			}
		}
		if ("????/????".equals(sort) && subsort != null) {
			if ("x".equals(filter)) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_table01");
			} else if (filter != null) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_table01");
			}
		}
		
		// -------------------??????/????/????------------------------------------
		
		if ("??????/????/????".equals(sort)) {
			if ("x".equals(subsort)) {
				if ("x".equals(filter)) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_table02");
				} else if (filter != null) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_table02");
				}
			}
		}
		if ("??????/????/????".equals(sort) && subsort != null) {
			if ("x".equals(filter)) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_table02");
			} else if (filter != null) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_table02");
			}
		}
		return mav;
	}

	@Override // ?????? ???????? ????
	@RequestMapping(value = "product/admin_listProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView admin_listProduct(Criteria1 cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ProductVO> admin_productList = productService.admin_listProduct(cri);
		int productCount = productService.productCount();
		ModelAndView mav = new ModelAndView(viewName);
		PageMaker1 pageMaker1 = new PageMaker1();
		pageMaker1.setCri(cri);
		pageMaker1.setTotalCount(productCount);
		int pageNum = pageMaker1.getCri().getPage();
		
		mav.addObject("pageNum", pageNum);
		mav.addObject("admin_productList", admin_productList);
		mav.addObject("pageMaker1", pageMaker1);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/product/admin_listProduct/productSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productSearch(@RequestParam("search") String search, @RequestParam("searchType") String searchType,
			Criteria1 cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		Map<String, Object> productSearchMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		productSearchMap.put("pageStart", pageStart);
		productSearchMap.put("perPageNum", perPageNum);
		productSearchMap.put("search", search);
		System.out.println(search);
		productSearchMap.put("searchType", searchType);
		System.out.println(searchType);
		productSearchMap = productService.productSearch(productSearchMap);
		System.out.println(productSearchMap);
		int productSearchCount = productService.productSearchCount(productSearchMap);
		PageMaker1 pageMaker1 = new PageMaker1();
		pageMaker1.setCri(cri);
		int pageNum = pageMaker1.getCri().getPage();
		productSearchMap.put("pageNum", pageNum);
		pageMaker1.setTotalCount(productSearchCount);
		mav.addObject("productSearchMap", productSearchMap);
		mav.addObject("pageMaker1", pageMaker1);
		mav.addObject("pageNum", pageNum);
		System.out.println(productSearchMap);
		
		return mav;

	}

	// ????????
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
	
			productService.modProduct(productMap);

			if (productImage != null && productImage.size() != 0) {

				String OrignProductImage = (String) productMap.get("OrignProductImage");
				String OrignProductContentImage = (String) productMap.get("OrignProductContentImage");
				
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
			message += "alert('?????? ????????????.');";
			message += "location.href='" + multipartRequest.getContextPath()
					+ "/product/admin_detailproduct.do?productNum=" + productNum + "';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productImage);
			srcFile.delete();
			message = "<script>";
			message += "alert('?????? ????????????. ???? ????????????');";
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
			message += " alert('?????? ????????????.');";
			message += "  location.href='" + request.getContextPath() + "/product/admin_listProduct.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			message = "<script>";
			message += " alert('?????? ????????????. ???? ????????????');";
			message += "  location.href='" + request.getContextPath() + "/product/admin_listProduct.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
  	@RequestMapping(value = "/product/viewProduct.do", method = RequestMethod.GET)
public ModelAndView viewProduct(@RequestParam("productNum") String productNum, Criteria cri,Criteria2 cri2, HttpServletRequest request,
	HttpServletResponse response) throws Exception {
Map<String, Object> productMap = new HashMap();
String viewName = (String) request.getAttribute("viewName");
HttpSession session=request.getSession();
productVO = productService.viewProduct(productNum);
Map<String, Object> option = (Map<String, Object>) productService.viewOptionvalue(productNum);
ModelAndView mav = new ModelAndView();

int pageStart = cri.getPageStart();
int perPageNum = cri.getPerPageNum();
int pageStart2 = cri2.getPageStart2();
int perPageNum2 = cri2.getPerPageNum2();
productMap.put("pageStart", pageStart);
productMap.put("perPageNum", perPageNum);
productMap.put("pageStart2", pageStart2);
productMap.put("perPageNum2", perPageNum2);
productMap.put("productNum", productNum);
List<ProductVO> productReviewList= productService.listProductReview(productMap);
int productReviewCount = productService.productReviewCount(productNum);
List<ProductVO> productQuestionList = productService.listProductQuestion(productMap);
int productQuestionCount = productService.productQuestionCount(productNum);
PageMaker pageMaker = new PageMaker();
pageMaker.setCri(cri);
pageMaker.setTotalCount(productReviewCount);
int pageNum = pageMaker.getCri().getPage();

PageMaker2 pageMaker2 = new PageMaker2();
pageMaker2.setCri2(cri2);
pageMaker2.setTotalCount2(productQuestionCount);
int pageNum2 = pageMaker2.getCri2().getPage2();

addQuick(productNum,productVO,session);
mav.setViewName(viewName);
mav.addObject("option", option);
mav.addObject("product", productVO);
mav.addObject("productReviewList", productReviewList);
mav.addObject("productQuestionList", productQuestionList);
mav.addObject("pageMaker", pageMaker);
mav.addObject("pageNum", pageNum);
mav.addObject("pageMaker2", pageMaker2);
mav.addObject("pageNum2", pageNum2);


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

	// ?????? ????
	@RequestMapping(value = "/keywordSearch.do", method = RequestMethod.GET, produces = "application/text; charset=utf8") // ??????????
																															// ????????
																															// json????????
																															// ????
																															// ????????
																															// ????
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword, // ?????? ?????? ??????
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		// System.out.println(keyword);
		if (keyword == null || keyword.equals(""))
			return null;

		keyword = keyword.toUpperCase();
		List<String> keywordList = productService.keywordSearch(keyword);// ?????? ???????? ?????? ???? ???? ????

		// ???? ?????? JSONObject ????(????)
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList); // ?????? ???????? json?? ????

		String jsonInfo = jsonObject.toString(); // json?? ???????? ?????? ?? ?????????? ????
		// System.out.println(jsonInfo);
		return jsonInfo;
	}

	@RequestMapping(value = "/searchProduct.do", method = RequestMethod.GET)
	public ModelAndView searchProduct(@RequestParam("searchWord") String searchWord, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ProductVO> productList = productService.searchProduct(searchWord); // ?????????? ?????? ?????? ?????? ???? ?????? ????

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("productList", productList);
		return mav;

	}
	
	//?????? ????
	private void addQuick(String productNum,ProductVO productVO,HttpSession session){
		boolean already_existed=false;
		List<ProductVO> quickList; //???? ?? ???? ???? ArrayList
		List<ProductVO> quickListAll;
		
		//MemberVO memberVO=(MemberVO)session.getAttribute("member");
		//String memId=memberVO.getmemId();
		
		quickList=(ArrayList<ProductVO>)session.getAttribute("quickList");//?????? ?????? ???? ?? ???? ?????? ??????
		quickListAll=(ArrayList<ProductVO>)session.getAttribute("quickListAll");
		
		if(quickList!=null){//???? ?? ?????? ???? ????
			
			if(quickList.size() < 2){ //?????? ???? ???????? ?????????? 2?? ?????? ????
				for(int i=0; i<quickList.size();i++){
					ProductVO productBean=(ProductVO)quickList.get(i);
					if(productNum.equals(productBean.getproductNum())){					
						already_existed=true;
						break;
					}
				}//???? ?????? ?????? ???? ???????? ???????? ????
				if(already_existed==false){
					quickList.add(productVO);
					
				}//already_existed?? false???? ???? ?????? ?????? ????
			}
			else {
				for(int i=0; i<quickList.size();i++){
					ProductVO productBean=(ProductVO)quickList.get(i);
					if(productNum.equals(productBean.getproductNum())){					
						already_existed=true;
						break;
					}
				}//???? ?????? ?????? ???? ???????? ???????? ????
				if(already_existed==false){
					for(int i=0; i<2;i++) {
						Collections.reverse(quickList);
					quickList.set(i,productVO);}
					
				}//already_existed?? false???? ???? ?????? ?????? ????
				
			
			}
			
		}else{
			quickList =new ArrayList<ProductVO>();
			quickList.add(productVO);
			
		}//???? ?? ???? ?????? ?????? ???????? ???? ?????? ????
		
		//quickList =new ArrayList<ProductVO>();
		//quickList.add(productVO);
		
		session.setAttribute("quickList",quickList);//???? ?? ???? ?????? ?????? ????
		session.setAttribute("quickListNum", quickList.size());//???? ?? ???? ?????? ?????? ?????????? ?????? ????
		
		if(quickListAll!=null){//???? ?? ?????? ???? ????
				for(int i=0; i<quickListAll.size();i++){
					ProductVO productBean=(ProductVO)quickListAll.get(i);
					if(productNum.equals(productBean.getproductNum())){
						already_existed=true;
						break;
					}
				}//???? ?????? ?????? ???? ???????? ???????? ????
				if(already_existed==false){
					quickListAll.add(productVO);
					Collections.reverse(quickList);
					
				}//already_existed?? false???? ???? ?????? ?????? ????
			
		
		}else{
			quickListAll =new ArrayList<ProductVO>();
			quickListAll.add(productVO);
			
		}//???? ?? ???? ?????? ?????? ???????? ???? ?????? ????
		session.setAttribute("quickListAll",quickListAll);//???? ?? ???? ?????? ?????? ????
		session.setAttribute("quickListAllNum", quickListAll.size());//???? ?? ???? ?????? ?????? ?????????? ?????? ????

		
	}
	
	@RequestMapping(value="/mypage_09.do" ,method = RequestMethod.GET)
	public ModelAndView QuickMain(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		List<ProductVO> quickListAll; //???? ?? ???? ???? ArrayList
		quickListAll=(ArrayList<ProductVO>)session.getAttribute("quickListAll");//?????? ?????? ???? ?? ???? ?????? ??????
		session.setAttribute("quickListAll",quickListAll);//???? ?? ???? ?????? ?????? ????
		session.setAttribute("quickListAllNum", quickListAll.size());//???? ?? ???? ?????? ?????? ?????????? ?????? ????
		System.out.println(quickListAll);
		
	
		return mav;
	}
	
	//???? ?????????? ???????? ?? ????
	@Override
	@RequestMapping(value = "/addNewQuestion.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewQuestion(@ModelAttribute("question") ProductVO question, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		
		question.setMemId(memId);
		String productNum = question.getproductNum();
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			productService.addNewQuestion(question);

			message = "<script>";
			message += " alert('?? ?????? ??????????????.');";
			message += "  location.href='" + request.getContextPath() + "/product/viewProduct.do?productNum="+ productNum  + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			message = "<script>";
			message += " alert('?????? ????????????. ???? ????????????');";
			message += "  location.href='" + request.getContextPath() + "/product/viewProduct.do?productNum="+ productNum  + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "/removeQuestion.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity removeQuestion(@RequestParam("productNum") String productNum, @RequestParam("productQuestionNum") int productQuestionNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset-utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			productService.removeQuestion(productQuestionNum);

			message = "<script>";
			message += " location.href='" + request.getContextPath() +"/product/viewProduct.do?productNum="+ productNum  + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('?????? ????????????. ???? ????????????);";
			message += " location.href='" + request.getContextPath() + "/product/viewProduct.do?productNum="+ productNum  + "';";
					
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}
	
	@RequestMapping(value = "/modNewQuestion.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modNewQuestion(@ModelAttribute("question") ProductVO question, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

	
		request.setCharacterEncoding("utf-8");


		String productNum = question.getproductNum();
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			productService.modQuestion(question);

			message = "<script>";
			message += " alert('???? ????????????.');";
			message += "  location.href='" + request.getContextPath() + "/product/viewProduct.do?productNum="+ productNum  + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			message = "<script>";
			message += " alert('?????? ????????????. ???? ????????????');";
			message += "  location.href='" + request.getContextPath() + "/product/viewProduct.do?productNum="+ productNum  + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	// ???????? value ????????
	@RequestMapping(value = "product/option1Value.do", method = RequestMethod.GET)
	@ResponseBody
	private Map<String,Object> optionValue(@RequestParam("option1Name") String option1Name, HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		Map<String,Object> option1Value = new HashMap<String,Object>();
		option1Value.put("option1Name", option1Name);
		productService.selectOption1Value(option1Value);

		option1Value.remove("option1Name");

		return option1Value;
	}


}