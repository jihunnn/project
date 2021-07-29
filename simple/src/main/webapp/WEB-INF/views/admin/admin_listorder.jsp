<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test="${!empty orderSearchMap.search}">
	<c:set var="orderSearchList"
		value="${orderSearchMap.orderSearchList}" />
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
</style>


</head>
<title>회원관리창</title>
<body>

	<section class="ftco-section testimony-section"
		style="padding-top: 100px;">

		<div class="container">
			<ul class="snip1284" style="padding-left: 0px; margin-bottom: 30px;">
				<li><a
					onclick="location.href='${contextPath}/product/admin_listProduct.do'"
					data-hover="상품관리"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 100px; cursor: pointer; background-color: white; padding-bottom: 0px;">상품관리</a></li>


				<li><a
					onclick="location.href='${contextPath}/product/add_product.do'"
					data-hover="상품등록"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 100px; cursor: pointer; background-color: white; padding-bottom: 0px;">상품등록</a></li>


				<li class="current"><a
					onclick="location.href='${contextPath}/admin_listmember.do'"
					data-hover="회원관리"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 100px; cursor: pointer; background-color: white; padding-bottom: 0px;">회원관리</a></li>


				<li><a
					onclick="location.href='${contextPath}/board/listNotice.do'"
					data-hover="게시판관리"
					style="font-size: 20px; margin-right: 100px; border: none; color: #5a5a5a; background-color: white; cursor: pointer; padding-bottom: 0px;">게시판관리</a></li>

				<li><a onclick="location.href='${contextPath}/admin_listorder'"
					data-hover="게시판관리"
					style="font-size: 20px; border: none; color: #5a5a5a; background-color: white; cursor: pointer; padding-bottom: 0px;">주문관리</a></li>
			</ul>


			<form name="memberSearch"
				action="${contextPath}/admin_listorder/orderSearch.do" method="post">
				<div style="margin-bottom: 10px;">
					<button type="submit" id="buttonmy" class="btn btn-dark"
						style="margin-top: 21px; float: right; padding-top: 4px; height: 34px; font-size: 14px; padding-top: 4px; background-color: #7e9c8c; border: none;">조회</button>
					<input type="text"
						style="margin-top: 21px; float: right; height: 34px; border: 1px solid #dcdcdc; font-size: 14px; margin-right: 5px;"
						name="search"> <select name="searchType"
						style="font-size: 14px; margin-bottom: 10px; margin-right: 5px; float: right; width: 80px; height: 34px; border: 1px solid #dcdcdc; margin-top: 21px;">
						<option value="memId">아이디</option>
						<option value="memOrderNum">주문번호</option>
						<option value="productName">상품명</option>
						<option value="memSpPhoneNum1">전화번호</option>
					</select>
					<button type="button" onclick="deleteValue02();"
						style="float: left; border-radius: 2px; margin-bottom: 3px; margin-top: 25px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;"
						class="btn-secondary btn-xs">선택삭제</button>
					<button type="button" onclick="deleteValue02();"
						style="float: left; border-radius: 2px; margin-bottom: 3px; margin-left: 700px; margin-top: 25px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;"
						class="btn-secondary btn-xs">회원</button>
					<button type="button" onclick="deleteValue02();"
						style="float: left; border-radius: 2px; margin-bottom: 3px; margin-left: 10px; margin-top: 25px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;"
						class="btn-secondary btn-xs">비회원</button>

				</div>
			</form>


			<table class="table" style="font-size: 14px;">
				<thead class="table-dark" align=center>
					<tr align="center"
						style="background-color: #eeeeee; color: black; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
						<td scope="col" style="width: 50px;">선택</td>
						<td scope="col" style="width: 60px;">주문번호</td>
						<td scope="col" style="width: 60px;">아이디</td>
						<td scope="col" style="width: 120px;">상품명</td>
						<td scope="col" style="width: 150px;">상품옵션</td>
						<td scope="col" style="width: 1px;">가격</td>
						<td scope="col" style="width: 100px;">전화번호</td>
						<td scope="col" style="width: 130px;">주소</td>
						<td scope="col" style="width: 80px;">주문날짜</td>
						<td scope="col" style="width: 80px;">삭제</td>
					</tr>
					<c:choose>
						<c:when test="${!empty orderSearchMap.search}">
							<c:choose>
								<c:when test="${empty orderSearchMap.orderSearchList}">
									<tr height="200">
										<td colspan="5"
											style="background-color: white; padding-top: 100px;">
											<p align="center">
												<b><span style="color: black;">조회된 주문내역이 없습니다.</span></b>
											</p>
										</td>
									</tr>
								</c:when>
								<c:otherwise>

									<c:forEach var="orderSearch" items="${orderSearchList}">
										<tr
											style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">
											<th scope="col" style="vertical-align: middle;"><input
												type="checkbox" name="chk" value=""></th>
											<th scope="col" style="vertical-align: middle;">${orderSearch.memOrderNum}</th>
											<th scope="col" style="vertical-align: middle;">${orderSearch.memId}</th>
											<th scope="col" style="vertical-align: middle;">${orderSearch.productName}</th>
											<th scope="col" style="vertical-align: middle;">${orderSearch.option1name}:${orderSearch.option1value}<br>${orderSearch.option2name}:${orderSearch.option2value}</th>
											<th scope="col" style="vertical-align: middle;">${orderSearch.totalPrice}원</th>
											<th scope="col" style="vertical-align: middle;">${orderSearch.memSpPhoneNum1}</th>
											<th scope="col" style="vertical-align: middle;">${orderSearch.memSpAdr}</th>
											<th scope="col" style="vertical-align: middle;">${orderSearch.memOrderDate}</th>
											<th scope="col" style="vertical-align: middle;"><input
												type="hidden" value="${orderSearch.memId}" name="memId" />
												<button type="submit" class="btn btn-dark"
													style="border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">수정</button>
												<br>
												<button type="button"
													onclick="location.href='${contextPath}/admin_removeMember.do?memId=${orderSearch.memId}'"
													class="btn btn-dark"
													style="border-radius: 2px; margin-bottom: 3px; margin-top: 5px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">삭제</button>
											</th>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${empty orderSearchMap.search}">
							<c:choose>
								<c:when test="${empty ordersList}">
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
									<form action="${contextPath}/admin/viewOrder.do" method="post">
										<c:forEach var="ordersList" items="${ordersList}">

											<tr
												style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">
												<th scope="col" style="vertical-align: middle;"><input
													type="checkbox" name="chk" value=""></th>
												<th scope="col" style="vertical-align: middle;">${ordersList.memOrderNum}</th>
												<th scope="col" style="vertical-align: middle;">${ordersList.memId}</th>
												<th scope="col" style="vertical-align: middle;">${ordersList.productName}</th>
												<th scope="col" style="vertical-align: middle;">${ordersList.option1name}:${ordersList.option1value}<br>${ordersList.option2name}:${ordersList.option2value}</th>
												<th scope="col" style="vertical-align: middle;">${ordersList.totalPrice}원</th>
												<th scope="col" style="vertical-align: middle;">${ordersList.memSpPhoneNum1}</th>
												<th scope="col" style="vertical-align: middle;">${ordersList.memSpAdr}</th>
												<th scope="col" style="vertical-align: middle;">${ordersList.memOrderDate}</th>
												<th scope="col" style="vertical-align: middle;"><input
													type="hidden" value="${member.memId}" name="memId" />
													<button type="submit" class="btn btn-dark"
														style="border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">수정</button>
													<br>
													<button type="button"
														onclick="location.href='${contextPath}/admin_removeMember.do?memId=${member.memId }'"
														class="btn btn-dark"
														style="border-radius: 2px; margin-bottom: 3px; margin-top: 5px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">삭제</button>
												</th>
											</tr>

										</c:forEach>
									</form>
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
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/admin_listorder.do?page=${pageMaker.startPage-1 }"/>'><i
						class="fa fa-chevron-left"></i></a>

				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">

					<a
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/admin_listorder.do?page=${pageNum }"/>'><i
						class="fa">${pageNum }</i></a>

				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

					<a class="arrow next"
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/admin_listorder.do?page=${pageMaker.endPage+1 }"/>'><i
						class="fa fa-chevron-right"></i></a>

				</c:if>

			</div>
		</div>



	</section>


</body>
</html>
