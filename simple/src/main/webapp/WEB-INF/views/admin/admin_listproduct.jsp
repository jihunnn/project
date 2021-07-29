<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test="${!empty productSearchMap.search}">
		<c:set var="productSearchList"
			value="${productSearchMap.productSearchList}" />
</c:if>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>

<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:500);

.snip1284 {
	font-family: 'Raleway', Arial, sans-serif;
	text-align: center;
	text-transform: uppercase;
	font-weight: 500;
	letter-spacing: 1px;
}

.snip1284 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

.snip1284 li {
	display: inline-block;
	list-style: outside none none;
	margin: 0.5em 1.2em;
	padding: 0;
}

.snip1284 a {
	padding: 0 0.6em;
	color: rgba(255, 255, 255, 0.5);
	position: relative;
	text-decoration: none;
}

.snip1284 a:before, .snip1284 a:after {
	width: 3px;
	height: 0;
	position: absolute;
	content: '';
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
	background-color: #7e9c8c;
}

.snip1284 a:before {
	top: 0;
	right: 0;
}

.snip1284 a:after {
	bottom: 0;
	left: 0;
}

.snip1284 a:hover, .snip1284 .current a {
	color: #ffffff;
}

.snip1284 a:hover:before, .snip1284 .current a:before, .snip1284 a:hover:after,
	.snip1284 .current a:after {
	height: 100%;
}


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
#buttonmy {
	width: 80px;
	height: 30px;
	float: left;
	border-radius: 2px;
	padding-top: 1.8px;
}
</style>


</head>
<body>


	<section class="ftco-section testimony-section"
		style="padding-top: 100px;">
		<div class="container">
		<ul class="snip1284" style="padding-left: 0px; margin-bottom: 30px;">
	           <li class="current"><a
					onclick="location.href='${contextPath}/product/admin_listProduct.do'"
					data-hover="상품관리"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; margin-left: 20px; padding-bottom: 0px;">상품관리</a></li>


				<li><a
					onclick="location.href='${contextPath}/product/add_product.do'"
					data-hover="상품등록"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; padding-bottom: 0px;">상품등록</a></li>


				<li><a
					onclick="location.href='${contextPath}/admin_listmember.do'"
					data-hover="회원관리"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; padding-bottom: 0px;">회원관리</a></li>


				<li><a
					onclick="location.href='location.href='${contextPath}/board/listNotice.do'"
					data-hover="게시판관리"
					style="font-size: 20px; border: none; color: #5a5a5a; background-color: white; cursor: pointer; padding-bottom: 0px;">게시판관리</a></li>
			</ul>
		
	

              <form name="productSearch"
				action="${contextPath}/product/admin_listProduct/productSearch.do" method="post">
				<div style="margin-bottom: 10px;">
					<select name="searchType"
						style="margin-left: 850px;float: left;width: 120px;height: 31px;border: 1px solid #b3b5b6;">
						<option value="productName">상품이름</option>
						<option value="productNum">상품번호</option>
						<option value="category">카테고리</option>
						<option value="subcategory">하위카테고리</option>
					</select> <input type="text" class="form-control" id="inputbox"
						style="margin-top: 10px; margin-left: 980px;" name="search">
					<button type="submit" id="buttonmy" class="btn btn-dark"
						style="margin-top: -33px; margin-left: 1190px; padding-top: 4px; height: 33px;">조회</button>
				</div>
			</form>
     
	
           <hr style="margin-top: 15px;">

              
			<div class="row">
			<c:choose>
					<c:when test="${!empty productSearchMap.search}">
					<c:choose>
						<c:when test="${empty productSearchMap.productSearchList}">
						 <b><span style="color:black;">등록된 상품이 없습니다.</span></b>
						</c:when>
						<c:otherwise>
						<c:forEach var="productSearch" items="${productSearchList}"  varStatus="productNum" >
						<div class="col-md-4 ftco-animate">
					<div class="blog-entry">
					<c:choose>		
				<c:when test="${not empty productSearch.productImage && productSearch.productImage != 'null'}">
					<input type="hidden" name="OrignProductFile" value="${productSearch.productImage}"class="block-20" />
					<a href="${contextPath}/product/viewProduct.do?productNum=${productSearch.productNum}">
				   <img  class="block-20" style=" width: 400px;"src="${contextPath}/download_product.do?productNum=${productSearch.productNum}&productImage=${productSearch.productImage}" id="preview" /></a><br>
						</c:when>
			</c:choose>
						<div class="text d-flex py-1">
							<div class="desc pl-2">
								<h3 class="heading">
									<a style="font-size:15px;" href="${contextPath}/product/admin_detailproduct.do?productNum=${productSearch.productNum}">${productSearch.productName}</a>
								</h3>
								<hr style="margin-top: 25px;">
							
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				</c:otherwise>
				</c:choose>
				</c:when>
				<c:when test="${empty productSearchMap.search}">
					<c:choose>
					<c:when test="${empty admin_productList}">
					 <b><span style="color:black;">등록된 상품이 없습니다.</span></b>
			        </c:when>
			        <c:otherwise>
					<c:forEach var="product" items="${admin_productList}" varStatus="productNum" >
					<div class="col-md-4 ftco-animate">
					<div class="blog-entry">
					<c:choose>		
				<c:when test="${not empty product.productImage && product.productImage != 'null'}">
					<input type="hidden" name="OrignProductFile" value="${product.productImage}"class="block-20" />
					<a href="${contextPath}/product/admin_detailproduct.do?productNum=${product.productNum}">
				   <img  class="block-20" style=" width: 400px;"src="${contextPath}/download_product.do?productNum=${product.productNum}&productImage=${product.productImage}" id="preview" /></a><br>
						</c:when>
			</c:choose>
						<div class="text d-flex py-1">
							<div class="desc pl-2">
								<h3 class="heading">
									<a style="font-size:15px;" href="${contextPath}/product/admin_detailproduct.do?productNum=${product.productNum}">${product.productName}</a>
								</h3>
								<hr style="margin-top: 25px;">
							
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				</c:otherwise>
				</c:choose>
				</c:when>
				</c:choose>
	
			
			</div>
		</div>
		
		<!-- 페이징 글번호 -->
		<div class="page_wrap" style="margin-left: 80px; margin-top: 60px;">
			<div class="page_nation" style="text-align: center;">

				<c:if test="${pageMaker1.prev}">

					<a class="arrow prev"
						href='<c:url value="/product/admin_listProduct.do?page=${pageMaker1.startPage-1 }"/>'><i
						class="fa fa-chevron-left"></i></a>

				</c:if>
				<c:forEach begin="${pageMaker1.startPage }"
					end="${pageMaker1.endPage }" var="pageNum">

					<a href='<c:url value="/product/admin_listProduct.do?page=${pageNum }"/>'><i
						class="fa">${pageNum }</i></a>

				</c:forEach>
				<c:if test="${pageMaker1.next && pageMaker1.endPage >0 }">

					<a class="arrow next"
						href='<c:url value="/product/admin_listProduct.do?page=${pageMaker1.endPage+1 }"/>'><i
						class="fa fa-chevron-right"></i></a>

				</c:if>

			</div>
		</div>



	</section>


</body>
</html>