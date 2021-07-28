<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html>
<html lang="en">
<head>

<style>
.page_wrap {
	text-align: center;
	font-size: 0;
}
.page_nation {
	display: inline-block;
}
.page_nation .none {
	display: none;
}
.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}
.page_nation .arrow {
	border: 1px solid #ccc;
}
.page_nation .pprev {
	background: #f8f8f8
		url('${contextPath}/resources/images/page_pprev.png') no-repeat center
		center;
	margin-left: 0;
}
.page_nation .prev {
	background: #f8f8f8 url('${contextPath}/resources/images/page_prev.png')
		no-repeat center center;
	margin-right: 7px;
}
.page_nation .next {
	background: #f8f8f8 url('${contextPath}/resources/images/page_next.png')
		no-repeat center center;
	margin-left: 7px;
}
.page_nation .nnext {
	background: #f8f8f8
		url('${contextPath}/resources/images/page_nnext.png') no-repeat center
		center;
	margin-right: 0;
}
.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}
</style>


</head>
<body>

	
	<img src="${contextPath}/resources/images/product-01.jpg" width=100%
		height=350px>

	<section class="ftco-section" style="padding-top: 30px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 20px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">상품검색</h2>
				</div>
			</div>

			<!-- 최근 본 상품 -->
			<div id="recentlyProduct"
				style="position: absolute; left:80px;width: 120px; height: 310px; margin-left: 1650px; border: 1px solid #d2d2d2; margin-top: -130px;">
				<ul
					style="list-style: none; margin-top: 10px; padding-left: 20px; margin-bottom: 10px;">
					<li><a href="#"
						style="padding-left: -10px; padding-bottom: 1px; color: black;">최근본상품</a></li>
				</ul>
				<hr style="margin-top: 0px; margin-bottom: 0px; color: #d2d2d2;">
				<ul style="list-style: none; padding-top: 5px;">
					<li><a href="#"><img
							src="${contextPath}/resources/images/image_1.jpg"
							style="width: 100px; height: 100px; padding-top: 10px; margin-left: -30px;"></a></li>
					<li><a href="#"><img
							src="${contextPath}/resources/images/image_2.jpg"
							style="width: 100px; height: 100px; padding-top: 10px; padding-top: 10px; margin-left: -30px;"></a></li>
				</ul>
				<hr style="margin-top: 0px; margin-bottom: 0px; color: #d2d2d2;">
				<ul
					style="list-style: none; padding-left: 30px; margin-bottom: 10px; margin-top: 8px;">
					<li><a href="#"
						style="color: black; text-align: center; margin-top: 8px; padding-top: 30px;">더보기▼</a></li>
				</ul>
			</div>


			<div class="btn-group btn-group-justified" role="group"
				aria-label="..." style="margin-bottom: 30px; margin-top: 10px;">
				
			</div>

			<div class="row">
			   <c:choose>
			      <c:when test="${empty productList}">
			         <b><span style="color:black;">제품이 없습니다.</sapn></b>
			      </c:when>
			      <c:when test="${!empty productList}">
			      <c:forEach var="product" items="${productList}" >
				<div class="col-md-4 ftco-animate">
					<div class="blog-entry">
					
						<a href="${contextPath}/product/viewProduct.do?productNum=${product.productNum}" class="block-20"
							style="background-image: url('${contextPath}/resources/images/image_1.jpg');">
						</a>
						<div class="text d-flex py-1">
							<div class="desc pl-2">
								<h3 class="heading">
									<a href="${contextPath}/product/viewProduct.do?productNum=${product.productNum}">${product.productName}</a>
								</h3>
								<hr style="margin-top: 25px;">
								<h3 class="heading"
									style="padding-left: 67%; white-space: nowrap;">
									<a href="${contextPath}/product/viewProduct.do?productNum=${product.productNum}" style="font-size: 22px;"><fmt:formatNumber pattern="###,###,###" value="${product.productPrice}"/></a>
								</h3>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				</c:when>
				</c:choose>
				
			
			</div>
	


	</section>


</body>
</html>