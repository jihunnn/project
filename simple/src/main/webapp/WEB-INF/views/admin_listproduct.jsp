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


	<section class="ftco-section" style="padding-top: 30px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 20px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">관리자 페이지</h2>
				</div>
			</div>

			

			<div class="btn-group btn-group-justified" role="group"
				aria-label="..." style="margin-bottom: 30px; margin-top: 10px;">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick="location.href='${contextPath}/product/admin_listProduct.do'"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white; margin-left: 10px; font-weight: bold;">*상품조회</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick="location.href='${contextPath}/product/add_product.do'"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white;">상품등록</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick="location.href='${contextPath}/admin_listmember.do'"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white;">회원조회</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick="location.href='${contextPath}/board/listNotice.do'"
						style="font-size: 25px; border: none; color: #5a5a5a; background-color: white;">게시판조회</button>
				</div>
			
			</div>

		
			<hr style="margin-top: -10px;">

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
				   <img  class="block-20" style=" width: 346px;"src="${contextPath}/download_product.do?productNum=${productSearch.productNum}&productImage=${productSearch.productImage}" id="preview" /></a><br>
						</c:when>
			</c:choose>
						<div class="text d-flex py-1">
							<div class="desc pl-2">
								<h3 class="heading">
									<a href="${contextPath}/product/admin_detailproduct.do?productNum=${productSearch.productNum}">${productSearch.productName}</a>
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
					<a href="${contextPath}/product/viewProduct.do?productNum=${product.productNum}">
				   <img  class="block-20" style=" width: 346px;"src="${contextPath}/download_product.do?productNum=${product.productNum}&productImage=${product.productImage}" id="preview" /></a><br>
						</c:when>
			</c:choose>
						<div class="text d-flex py-1">
							<div class="desc pl-2">
								<h3 class="heading">
									<a href="${contextPath}/product/admin_detailproduct.do?productNum=${product.productNum}">${product.productName}</a>
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