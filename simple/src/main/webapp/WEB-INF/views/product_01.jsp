<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">침ㅤㅤ
						대</h2>
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
				<c:choose>
				<c:when test="${empty quickList }">
				<ul
					style="list-style: none;padding-top: 80px;padding-right: 0px;padding-left: 0px;">
					<li><a
						style="color: black; text-align: center; margin-top: 8px; padding-top: 30px;">상품</a></li>
						<li><a
						style="color: black; text-align: center; margin-top: 8px; padding-top: 30px;">없음</a></li>
				</ul>
				</c:when>
				<c:otherwise>
				<c:forEach var="item" items="${quickList}" varStatus="itemNum">
				<li><a href="${contextPath}/product/viewProduct.do?productNum=${item.productNum}">
					<img src="${contextPath}/download_product.do?productNum=${item.productNum}&productImage=${item.productImage}" style="width: 100px; height: 100px; padding-top: 10px; margin-left: -30px;"></a>
				</li>
		
			
				</c:forEach>
				</c:otherwise>
				</c:choose>
				</ul>
				<c:choose>
				<c:when test="${!empty quickList }">
				<hr style="margin-top: 0px; margin-bottom: 0px; color: #d2d2d2;">
				<ul
					style="list-style: none; padding-left: 30px; margin-bottom: 10px; margin-top: 8px;">
					<li><a href="${contextPath}/mypage_09.do"
						style="color: black; text-align: center; margin-top: 8px; padding-top: 30px;">더보기▼</a></li>
				</ul>
				</c:when>
				</c:choose>
				
			</div>
			
			<!-- 최근 본 상품 끝 -->


			<div class="btn-group btn-group-justified" role="group"
				aria-label="..." style="margin-bottom: 30px; margin-top: 10px;">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick = "location.href ='${contextPath}/product/listProduct.do?sort=침대&subsort=싱글'"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white; margin-left: 10px;">*싱글</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick = "location.href ='${contextPath}/product/listProduct.do?sort=침대&subsort=킹'"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white;">*킹</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick = "location.href ='${contextPath}/product/listProduct.do?sort=침대&subsort=이층침대'"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white;">*이층침대</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick = "location.href ='${contextPath}/product/listProduct.do?sort=침대&subsort=패밀리'"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white;">*패밀리</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick = "location.href ='${contextPath}/product/listProduct.do?sort=침대&subsort=퀸'"
						style="font-size: 25px; border: none; color: #5a5a5a; background-color: white;">*퀸</button>
				</div>
			</div>

			<div class="btn-group" role="group" aria-label="..."
				style="margin-bottom: 20px; margin-top: 30px;">
				<button type="button" class="btn btn-default"
					style="border: 0; outline: 0; border-radius: 1px;">인기순</button>
				<button type="button" class="btn btn-default"
					style="border: 0; outline: 0;">낮은가격순</button>
				<button type="button" class="btn btn-default"
					style="border: 0; outline: 0;">높은가격순</button>
				<button type="button" class="btn btn-default"
					style="border: 0; outline: 0; border-radius: 1px;">상품평순</button>
			</div>
			<hr style="margin-top: -10px;">




              
			<div class="row">
			   <c:choose>
			      <c:when test="${empty productList}">
			         <b><span style="color:black;">등록된 상품이 없습니다.</span></b>
			      </c:when>
			      <c:when test="${!empty productList}">
			      <c:forEach var="product" items="${productList}" varStatus="productNum">
				<div class="col-md-4 ftco-animate">
					<div class="blog-entry">
					<c:choose>		
				<c:when test="${not empty product.productImage && product.productImage != 'null'}">
					<input type="hidden" name="OrignProductFile" value="${product.productImage}"class="block-20" />
					<a href="${contextPath}/product/viewProduct.do?productNum=${product.productNum}">
				   <img  class="block-20" style="width: 346px;"src="${contextPath}/download_product.do?productNum=${product.productNum}&productImage=${product.productImage}" id="preview" /></a><br>
						</c:when>
			</c:choose>
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
		</div>
		

	</section>


</body>
</html>