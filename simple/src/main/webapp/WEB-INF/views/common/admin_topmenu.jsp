<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="btn-group btn-group-justified" role="group"
		aria-label="..." style="margin-bottom: 30px; margin-top: 10px;">
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default"
				onclick="location.href='${contextPath}/product/admin_listProduct.do'"
				style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 150px; background-color: white; margin-left: 10px; font-weight: bold;">*상품조회</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default"
				onclick="location.href='${contextPath}/product/add_product.do'"
				style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 150px; background-color: white;">*상품등록</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default"
				onclick="location.href='${contextPath}/admin_listmember.do'"
				style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 150px; background-color: white;">*회원조회</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default"
				onclick="location.href='${contextPath}/board/listNotice.do'"
				style="font-size: 25px; border: none; color: #5a5a5a; background-color: white;">*게시판조회</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default"
				onclick="location.href='${contextPath}/admin_listorder.do'"
				style="font-size: 25px; border: none; color: #5a5a5a; background-color: white; padding-left:100px;">*주문리스트조회</button>
		</div>

	</div>
</body>
</html>