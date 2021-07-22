<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test="${!empty memberSearchMap.search}">
		<c:set var="memberSearchList"
			value="${memberSearchMap.memberSearchList}" />
</c:if>
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
<title>회원관리창</title>
<body>

	<section class="ftco-section testimony-section"
		style="padding-top: 50px;">
		
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
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white; margin-left: 10px;">상품조회</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick="location.href='${contextPath}/product/add_product.do'"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white; ">상품등록</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick="location.href='${contextPath}/admin_listmember.do'"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white; font-weight: bold;">*회원조회</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick="location.href='${contextPath}/board/listNotice.do'"
						style="font-size: 25px; border: none; color: #5a5a5a; background-color: white;">게시판조회</button>
				</div>
			
			</div>
			<hr style="margin-top: -10px;">
			
			<form name="memberSearch"
				action="${contextPath}/admin_listmember/memberSearch.do" method="post">
				<div style="margin-bottom: 10px;">
					<select name="searchType"
						style="margin-left: 850px;float: left;width: 120px;height: 31px;border: 1px solid #b3b5b6;">
						<option value="memEmail">이메일</option>
						<option value="memPhoneNum">전화번호</option>
						<option value="memAdr">주소</option>
						<option value="logintype">회원유형</option>
					</select> <input type="text" class="form-control" id="inputbox"
						style="margin-top: 10px; margin-left: 980px;" name="search">
					<button type="submit" id="buttonmy" class="btn btn-dark"
						style="margin-top: -33px; margin-left: 1190px; padding-top: 4px; height: 33px;">조회</button>
				</div>
			</form>


				<table class="table">
				<thead class="table-dark" align=center>
					<tr align="center">
						<td scope="col">아이디</td>
						<td scope="col">비밀번호</td>
						<td scope="col">이름</td>
						<td scope="col">이메일</td>
						<td scope="col">전화번호</td>
						<td scope="col">주소</td>
						<td scope="col">회원유형</td>
						<td scope="col">가입일</td>
						<td scope="col">삭제</td>
					</tr>
				<c:choose>
					<c:when test="${!empty memberSearchMap.search}">
					<c:choose>
						<c:when test="${empty memberSearchMap.memberSearchList}">
						<tr height="200">
							<td colspan="5" style="background-color:white; padding-top:100px;">
								<p align="center">
									<b><span style="color:black; ">등록된 회원이 없습니다.</span></b>
								</p>
							</td>
						</tr>
						</c:when>
						<c:otherwise>
					
						<c:forEach var="memberSearch" items="${memberSearchList}" >
						<tr
						style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">
						<td scope="col">${memberSearch.memId}</td>
						<td scope="col">${memberSearch.memPwd}</td>
						<td scope="col">${memberSearch.memName }</td>
						<td scope="col">${memberSearch.memEmail}</td>
						<td scope="col">${memberSearch.memPhoneNum}</td>
						<td scope="col">${memberSearch.memAdr }</td>
						<td scope="col">${memberSearch.logintype }</td>
						<td scope="col">${memberSearch.memRegdate}</td>
						<td scope="col"><button type="button" onclick="location.href='${contextPath}/admin_removeMember.do?memId=${memberSearch.memId }'" class="btn btn-dark">삭제</button></td>
					</tr>
					</c:forEach>
					</c:otherwise>
					</c:choose>
					</c:when>
					<c:when test="${empty memberSearchMap.search}">
					<c:choose>
					<c:when test="${empty membersList}">
					    <tr height="200">
							<td colspan="5" style="background-color:white; padding-top:100px;">
								<p align="center">
									<b><span style="color:black; ">등록된 회원이 없습니다.</span></b>
								</p>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
					<c:forEach var="member" items="${membersList}" >
						<tr
						style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">
						<td scope="col">${member.memId}</td>
						<td scope="col">${member.memPwd}</td>
						<td scope="col">${member.memName }</td>
						<td scope="col">${member.memEmail}</td>
						<td scope="col">${member.memPhoneNum}</td>
						<td scope="col">${member.memAdr }</td>
						<td scope="col">${member.logintype }</td>
						<td scope="col">${member.memRegdate}</td>
						<td scope="col"><button type="button" onclick="location.href='${contextPath}/admin_removeMember.do?memId=${member.memId }'" class="btn btn-dark">삭제</button></td>
					</tr>
					</c:forEach>
					</c:otherwise>
					</c:choose>
					</c:when>
					</c:choose>
				
				</thead>
			</table>
		</div>
		<!-- 내용 끝 -->
		
		<!-- 페이징 글번호 -->
		<div class="page_wrap" style="margin-left: 80px; margin-top: 60px;">
			<div class="page_nation" style="text-align: center;">

				<c:if test="${pageMaker.prev}">

					<a class="arrow prev"
						href='<c:url value="/admin_listmember.do?page=${pageMaker.startPage-1 }"/>'><i
						class="fa fa-chevron-left"></i></a>

				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">

					<a href='<c:url value="/admin_listmember.do?page=${pageNum }"/>'><i
						class="fa">${pageNum }</i></a>

				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

					<a class="arrow next"
						href='<c:url value="/admin_listmember.do?page=${pageMaker.endPage+1 }"/>'><i
						class="fa fa-chevron-right"></i></a>

				</c:if>

			</div>
		</div>

	
	</section>


</body>
</html>








