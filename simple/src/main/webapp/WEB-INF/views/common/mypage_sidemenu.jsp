<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="col-lg-2"
		style="float: left; margin-right: 50px; width: 230px; font-size: 17px; padding-left: 0px; padding-top: 13px;">
		<div class="list-group list-group-flush">
			<a href="#"
				class="list-group-item list-group-item-action text-center font-weight-bold">마이
				쇼핑</a> <a href="${contextPath}/mypage_02.do"
				class="list-group-item list-group-item-action text-center font-weight-bold">회원정보
				수정</a> <a href="#"
				class="list-group-item list-group-item-action text-center font-weight-bold">주문/배송조회</a>
			<a href="#"
				class="list-group-item list-group-item-action text-center font-weight-bold">취소/반품내역</a>
			<a href="${contextPath}/myCartList.do"
				class="list-group-item list-group-item-action text-center font-weight-bold">장바구니</a>
			<a href="${contextPath}/mypage_08.do"
				class="list-group-item list-group-item-action text-center font-weight-bold">관심상품</a>
			<a href="#"
				class="list-group-item list-group-item-action text-center font-weight-bold">1:1문의</a>
			<a href="#"
				class="list-group-item list-group-item-action text-center font-weight-bold">A/S접수</a>
			<a href="#"
				class="list-group-item list-group-item-action text-center font-weight-bold">상품
				리뷰</a>
		</div>
	</div>
</body>
</html>