<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

<style>
.table-light {
	background: #F7F7F7;
}

.table {
	table-border: 2px;
}

h4 {
	margin-top: 60px;
	font-weight: bold;
}
</style>
</head>
<title>주문결제창</title>
<body>


	<!-- 타이틀 -->
	<section class="ftco-section" style="padding-top: 50px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">주문결제</h2>
				</div>
			</div>
			<!-- 타이틀 끝 -->

			
			<h4>주문리스트</h4>

			<!-- 최근 본 상품 -->
			<div id="recentlyProduct"
				style="position: absolute; width: 120px; height: 310px; margin-left: 1370px; border: 1px solid #d2d2d2; margin-top: 0px;">
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


			<div class="order_list text-center">
				<table class="table">

					<thead class="table-dark">
						<tr>
							<th scope="col">제품</th>
							<th scope="col">수량</th>
							<th scope="col">가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="col">커스틴 천연면피 통가죽 4인 카우치형 소파</th>
							<th scope="col">1개</th>
							<th scope="col">3,740,000</th>
						</tr>
						<tr>
							<th scope="col">커스틴 천연면피 통가죽 4인 카우치형 소파</th>
							<th scope="col">1개</th>
							<th scope="col">3,740,000</th>
						</tr>
					</tbody>
				</table>
			</div>


			<h4>주문자정보</h4>
			<div class="order_list">
				<table class="table">
					<colgroup>
						<col width="20%" />
						<col width="25%" />
						<col width="" />
						<col width="30%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="col" style="padding-left: 40px">이름</th>
							<th scope="col"><input type="text"></th>
							<th scope="col" style="padding-left: 150px">주문비밀번호</th>
							<th scope="col"><input type="text"></th>
						</tr>
						<tr>
							<th scope="col" style="padding-left: 40px">이메일</th>
							<th scope="col"><input type="text" style="width: 80px">&nbsp;@<select
								id="email" style="width: 100px">
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="google.com">google.com</option>
									<th scope="col" style="padding-left: 150px">주문비밀번호 확인</th>
									<th scope="col"><input type="text"></th>
						</tr>
						<tr>
							<th scope="col" style="padding-left: 40px">연락처</th>
							<th scope="col"><select id="txtMobile1" style="width: 80px">
									<option value="">선택</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
									<option value="010">010</option>
							</select> - <input type="text" style="width: 80px"> - <input
								type="text" style="width: 80px"></th>
							<th></th>
							<th></th>
						</tr>
					</tbody>
				</table>
			</div>

			<h4>배송정보</h4>
			<div class="order_list">
				<table class="table">
					<colgroup>
						<col width="20%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="col" style="padding-left: 40px">이름</th>
							<th scope="col"><input type="text"></th>
						</tr>
						<tr>
							<th scope="col" style="padding-left: 40px">연락처1</th>
							<th scope="col"><select id="txtMobile1" style="width: 80px">
									<option value="">선택</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
									<option value="010">010</option>
							</select> - <input type="text" style="width: 80px"> - <input
								type="text" style="width: 80px"></th>
						</tr>
						<tr>
							<th scope="col" style="padding-left: 40px">연락처2</th>
							<th scope="col"><select id="txtMobile1" style="width: 80px">
									<option value="">선택</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
									<option value="010">010</option>
							</select> - <input type="text" style="width: 80px"> - <input
								type="text" style="width: 80px"></th>
						</tr>
						<tr>
							<th scope="col" style="padding-left: 40px"><br>주소</th>
							<th scope="col"><input type="text">&nbsp;&nbsp;&nbsp;<input
								type="button" value="우편번호 찾기">
							<p>
									<br>
									<input type="text" style="width: 325px">
								</p></th>
						</tr>
						<th scope="col" style="padding-left: 40px"
							style="padding-bottom:50px"><br>주문메세지<br>(100자내외)</th>
						<th scope="col"><textarea name="textarea" rows="4" cols="40"></textarea></th>
						<tr>
						<tr>
							<th scope="col">무통장 입금자명</th>
							<th scope="col"><input type="text"> (주문자와 같을 경우 생략
								가능)</th>
					</tbody>
				</table>
			</div>

			<h4>결제정보</h4>
			<div class="order_list">
				<table class="table">
					<colgroup>
						<col width="20%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="col" style="padding-left: 40px">결제방법</th>
							<th scope="col"><input type="radio" name="chk_info"
								value="HTML">신용/체크카드&nbsp;&nbsp;&nbsp; <input
								type="radio" name="chk_info" value="mutongjang">무통장입금&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_info" value="cellphone">휴대폰결제</th>
						</tr>
						<tr>
							<th scope="col" style="padding-left: 40px">카드선택</th>
							<th scope="col"><select id="month" style="width: 130px">
									<option value="현대카드">현대카드</option>
									<option value="kukmin">국민카드</option>
									<option value="nonghyep">농협카드</option>
									<option value="bc">BC카드</option>
									<option value="woori">우리카드</option>
									<option value="shinhan">신한카드</option></th>

						</tr>
						<tr>
							<th scope="col" style="padding-left: 40px">할부선택</th>
							<th scope="col"><select id="month" style="width: 130px">
									<option value="현대카드">일시불</option>
									<option value="1">1개월</option>
									<option value="2">2개월</option>
									<option value="3">3개월</option>
									<option value="4">4개월</option>
									<option value="5">5개월</option></th>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<br>
			<div style="text-align: center">
				<button type="button" class="btn btn-secondary">결제하기</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-secondary">취소하기</button>
			</div>
			<br>
			<br>
		</div>
	</section>
</body>
</html>
