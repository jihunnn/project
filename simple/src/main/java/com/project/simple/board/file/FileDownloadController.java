package com.project.simple.board.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class FileDownloadController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\spring\\product_image";//상품 이미지 경로
	private static final String ARTICLE_IMAGE_REPO1 = "C:\\spring\\inquiry_image";//1:1문의 이미지 경로
	@RequestMapping("/download.do")
	protected void download(@RequestParam("inquiryFile") String inquiryFile,
							@RequestParam("inquiryNum") String inquiryNum,
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO1 + "\\" +inquiryNum+"\\"+ inquiryFile;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + inquiryFile);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/download_product.do")
	protected void download_product(@RequestParam("productImage") String productImage,
							@RequestParam("productNum") String productNum,
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO + "\\" +productNum+"\\"+ productImage;
		File file = new File(downFile);
		System.out.println(productNum);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + productImage);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

}
