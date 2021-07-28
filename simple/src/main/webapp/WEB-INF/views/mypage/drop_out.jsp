<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

<style>
#main_box { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 10px;
}

#Drop out { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	width: 1300px;
	height: 100px;
	align-items: center;
	padding-top: 10px;
	font-size: 20px;
}

.order_text {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-bottom: 20px;
	font-size: 20px;
}

#main-back {
	padding-top: 20px;
	text-align: center;
}
</style>
</head>
<title>주문결제창</title>
<body>
	<!-- 최근 본 상품 -->
	<div id="recentlyProduct"
		style="position: absolute; width: 120px; height: 310px; margin-left: 1700px; border: 1px solid #d2d2d2; margin-top: 0px;">
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
	<!-- 최근본상품끝 -->

	<!-- 타이틀(음영X) -->
	<section class="ftco-section testimony-section">
		<div class="container">
			<div id=main_box>
				<div id="Drop out">
					<h1 class="mb-4">회원탈퇴</h1>
				</div>
				<!-- 타이틀 끝 -->
				<!-- 내용 -->
				<section class="ftco-section testimony-section">
					<div class="container">
						<div class="order_text">
							<h4>회원 탈퇴가 완료되었습니다.</h4>
							<h4>그동안 Simple서비스를 아끼고 사랑해주셔서 고맙습니다.</h4>
							<h4>더욱 더 노력하고 발전하는 Simple이 되겠습니다.</h4>
						</div>
					</div>

					<div class="container">
						<div id="main-back">
							<button onclick="location.href='${contextPath}/main.do'"
								style="height: 40px; width: 210px; font-size: 17px; background-color: #212529; color: white;">Simple
								홈 바로가기</button>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
	<!-- 내용 끝 -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>














