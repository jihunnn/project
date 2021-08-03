<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		style="padding-top: 100px;">
		<div class="container">
			<jsp:include page="/WEB-INF/views/common/admin_topmenu.jsp"
				flush="false" />

			<form name="memberSearch"
				action="${contextPath}/admin_listmember/memberSearch.do"
				method="post">
				<div style="margin-bottom: 10px;">
					<button type="submit" id="buttonmy" class="btn btn-dark"
						style="margin-top: 21px; float: right; padding-top: 4px; height: 34px; font-size: 14px; padding-top: 4px; background-color: #7e9c8c; border: none;">조회</button>
					<input type="text"
						style="margin-top: 21px; float: right; height: 34px; border: 1px solid #dcdcdc; font-size: 14px; margin-right: 5px;"
						name="search"> <select name="searchType"
						style="font-size: 14px; margin-bottom: 10px; margin-right: 5px; float: right; width: 80px; height: 34px; border: 1px solid #dcdcdc; margin-top: 21px;">
						<option value="memEmail">이메일</option>
						<option value="memPhoneNum">전화번호</option>
						<option value="memAdr">주소</option>
						<option value="logintype">회원유형</option>
					</select>

					<div
						style="font-size: 25px; font-weight: bold; margin-left: 18px; padding-top: 13px; float: left;">
						<a style="color: #7e9c8c;">회원조회</a>
					</div>
				</div>
			</form>

			<table class="table" style="font-size: 13px;">
				<thead class="table-dark" align=center>
					<tr align="center"
						style="background-color: #fbfbfb; color: black; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #c6c8ca; font-size: 14px;">
						<td scope="col" style="width: 80px;">선택</td>
						<td scope="col" style="width: 100px;">아이디</td>
						<td scope="col" style="width: 100px;">이름</td>
						<td scope="col">이메일</td>
						<td scope="col" style="width: 150px;">전화번호</td>
						<td scope="col">주소</td>
						<td scope="col" style="width: 100px;">회원유형</td>
						<td scope="col">가입일</td>
						<td scope="col">삭제</td>
					</tr>
					<c:choose>
						<c:when test="${!empty memberSearchMap.search}">
							<c:choose>
								<c:when test="${empty memberSearchMap.memberSearchList}">
									<tr height="200">
										<td colspan="5"
											style="background-color: white; padding-top: 100px;">
											<p align="center">
												<b><span style="color: black;">등록된 회원이 없습니다.</span></b>
											</p>
										</td>
									</tr>
								</c:when>
								<c:otherwise>

									<c:forEach var="memberSearch" items="${memberSearchList}">
										<tr
											style="border-bottom: 1px solid #eeeeee; background-color: white; color: black;">
											<td scope="col"><input type="checkbox" name="chk"
												value=""></td>
											<td scope="col">${memberSearch.memId}</td>
											<td scope="col">${memberSearch.memName }</td>
											<td scope="col">${memberSearch.memEmail}</td>
											<td scope="col">${memberSearch.memPhoneNum}</td>
											<td scope="col">${memberSearch.memAdr }</td>
											<td scope="col">${memberSearch.logintype }</td>
											<td scope="col">${memberSearch.memRegdate}</td>
											<td scope="col"><button type="button"
													onclick="location.href='${contextPath}/admin_removeMember.do?memId=${memberSearch.memId }'"
													class="btn btn-dark">삭제</button></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${empty memberSearchMap.search}">
							<c:choose>
								<c:when test="${empty membersList}">
									<tr height="200">
										<td colspan="5"
											style="background-color: white; padding-top: 100px;">
											<p align="center">
												<b><span style="color: black;">등록된 회원이 없습니다.</span></b>
											</p>
										</td>
									</tr>
								</c:when>
								<c:otherwise>





									<c:forEach var="member" items="${membersList}">

										<tr
											style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;"><input
												type="checkbox" name="chk" value=""></td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.memId}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.memName }</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.memEmail}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.memPhoneNum}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.memAdr }</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.logintype }</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.memRegdate}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;"><input
												type="hidden" value="${member.memId}" name="memId" />
												<button type="button" class="btn btn-dark"
													onclick="location.href='${contextPath}/admin/viewMember.do?memId=${member.memId }'"
													style="border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">수정</button>
												<br>
												<button type="button"
													onclick="location.href='${contextPath}/admin_removeMember.do?memId=${member.memId }'"
													class="btn btn-dark"
													style="border-radius: 2px; margin-bottom: 3px; margin-top: 5px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">삭제</button>
											</td>
										</tr>

									</c:forEach>

								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
				</thead>
			</table>
			<button type="button" onclick="deleteValue02();"
				style="float: right; border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;"
				class="btn-secondary btn-xs">선택삭제</button>
		</div>
		<!-- 내용 끝 -->

		<!-- 페이징 글번호 -->
		<div class="page_wrap" style="margin-left: 80px; margin-top: 60px;">
			<div class="page_nation" style="text-align: center;">

				<c:if test="${pageMaker.prev}">

					<a class="arrow prev"
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/admin_listmember.do?page=${pageMaker.startPage-1 }"/>'><i
						class="fa fa-chevron-left"></i></a>

				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">

					<a
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/admin_listmember.do?page=${pageNum }"/>'><i
						class="fa">${pageNum }</i></a>

				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

					<a class="arrow next"
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/admin_listmember.do?page=${pageMaker.endPage+1 }"/>'><i
						class="fa fa-chevron-right"></i></a>

				</c:if>

			</div>
		</div>




	</section>


</body>
</html>








