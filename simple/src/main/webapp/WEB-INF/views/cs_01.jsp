<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%
request.setCharacterEncoding("utf-8");
%>
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

#recentlyProduct {
	
}
</style>


</head>
<body>
	<!-- 타이틀 -->
	<section class="ftco-section" style="padding-top: 50px; margin-top:30px;">
		<div class="container">
			<jsp:include page="/WEB-INF/views/common/csMenu.jsp" flush="false" />

			<div>
				<h2 style="font-size: 28px; margin-top: 15px; float:left;">공지사항</h2>
				<h5 style="color:#828282; float:left; font-size:18px; margin-left:20px; margin-top:25px;">SIMPLE의 새로운 소식을 확인해보세요.</h5>
			</div>

			<!-- 타이틀 끝 -->

			<!-- 최근 본 상품 -->
			<div id="recentlyProduct"
				style="position: absolute; width: 120px; height: 310px; margin-left: 1370px; border: 1px solid #d2d2d2; margin-top: -100px;">
				<ul
					style="list-style: none; margin-top: 10px; padding-left: 20px; margin-bottom: 10px;">
					<li><a href="#"
						style="padding-left: -10px; padding-bottom: 1px; color: black;">최근본상품</a></li>
				</ul>
				<hr style="margin-top: 0px; margin-bottom: 0px; color: #d2d2d2;">
				<ul style="list-style: none; padding-top: 5px;">
					<li><a href="#"><img
							src="${contextPath}/download_product.do?productNum=${productNum}&productImage=${productImage}"
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
			<!-- 최근 본 상품 끝 -->

			<!-- 내용 -->

			<table class="table" style="height: 25px; font-size: 14px;">
				<thead class="table-dark" align=center>
					<tr align="center" style="background-color: #212529;">
						<td scope="col" width="100">번호</td>
						<td scope="col" width="500">내용</td>
						<td scope="col" width="150">작성자</td>
						<td scope="col" width="150">작성일</td>
						<td scope="col" width="80">조회수</td>
					</tr>
					<c:choose>
						<c:when test="${empty noticeList}">
							<tr height="200">
								<td colspan="5"
									style="background-color: white; padding-top: 100px;">
									<p align="center">
										<b><span style="color: black;">등록된 글이 없습니다.</sapn></b>
									</p>
								</td>
							</tr>
						</c:when>
						<c:when test="${!empty noticeList}">
							<c:forEach var="notice" items="${noticeList}">
								<tr
									style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">
									<td scope="col" width="50">${notice.noticeNum}</td>
									<td align="left" scope="col" width="500"><a
										href="${contextPath}/board/viewNotice.do?noticeNum=${notice.noticeNum}"
										style="color: black; padding-left: 30px;">${notice.noticeTitle}</a></td>
									<td scope="col" width="150">${notice.noticeWriter }</td>
									<td scope="col" width="150"><fmt:formatDate
											value="${notice.noticeDate}" /></td>
									<td scope="col" width="80">${notice.noticeHit}</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>

				</thead>
			</table>
		</div>
		<!-- 내용 끝 -->

		<!-- 페이징 글번호 -->
		<div class="page_wrap" style="margin-left: 80px; margin-top: 50px;">
			<div class="page_nation">

				<c:if test="${pageMaker.prev}">

					<a class="arrow prev" style="border: none; color:black; margin-right:0px; margin-left:0px;"
						href='<c:url value="/board/listNotice.do?page=${pageMaker.startPage-1 }"/>'><i
						class="fa fa-chevron-left"></i></a>

				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">

					<a style="border: none; color:black; margin-right:0px; margin-left:0px;" href='<c:url value="/board/listNotice.do?page=${pageNum }"/>'><i
						class="fa">${pageNum }</i></a>

				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

					<a class="arrow next" style="border: none; color:black; margin-right:0px; margin-left:0px;"
						href='<c:url value="/board/listNotice.do?page=${pageMaker.endPage+1 }"/>'><i
						class="fa fa-chevron-right"></i></a>

				</c:if>

			</div>
		</div>

	</section>
</body>
</html>