<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="myOrderInfoList" value="${myOrderInfoMap.myOrderInfoList}" />
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 날짜위젯 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 조회기간 선택 자바스크립트 -->
<script>
	$(function() {
		//input을 datepicker로 선언
		$("#datepicker1, #datepicker2")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd' //달력 날짜 형태
							,
							showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
							,
							showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서
							,
							changeYear : true //option값 년 선택 가능
							,
							changeMonth : true //option값  월 선택 가능                
							,
							showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
							,
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
							,
							buttonImageOnly : true //버튼 이미지만 깔끔하게 보이게함
							,
							buttonText : "선택" //버튼 호버 텍스트              
							,
							yearSuffix : "년" //달력의 년도 부분 뒤 텍스트
							,
							monthNamesShort : [ '1월', '2월', '3월', '4월', '5월',
									'6월', '7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트
							,
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip
							,
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 텍스트
							,
							dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
									'금요일', '토요일' ] //달력의 요일 Tooltip
							,
							minDate : "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
							,
							maxDate : "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
						});

		//초기값을 오늘 날짜로 설정해줘야 합니다.
		$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	});

	//구매확정 이벤트창
	function confirmOrderConfirm(obj) {
		if (confirm("구매확정하시겠습니까??") == true) { //확인
			var memOrderSeqNum = jQuery('#memOrderSeqNum').val();
			obj.action = "${contextPath}/mypage/purchaseConfirm.do?memOrderSeqNum=memOrderSeqNum";
			obj.submit();

		} else { //취소

			return false;

		}

	}
</script>
<style>
#main_box { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 10px;
}

#Mypage { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	width: 1300px;
	height: 100px;
	align-items: center;
	padding-top: 10px;
	padding-left: 130px;
	font-size: 10px;
}

.my_row {
	flex-direction: row;
	padding-right: 70px;
}

.container1 {
	width: 250px;
}

.container2 {
	width: 800px;
}

#sect {
	display: flex;
	flex-direction: row;
	padding-bottom: 10px;
}

.nav_MyPage {
	width: 120px;
	list-style-type: none;
	margin: 0;
	padding: 0;
	font-size: 14px;
}

#MyPage_center1 {
	border: 1px solid rgb(140, 140, 140);
}

.nav_MyPage li a {
	display: block;
	color: #000000;
	padding: 8px;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
}

.nav_MyPage li a.current {
	background-color: rgb(200, 200, 200);
	color: block;
}

.nav_MyPage li a: hover:not(.current) {
	background-color: #CD853F;
	color: white;
}

#MyPage_top {
	align-items: top;
	float: center;
	margin-bottom: 10;
}

#Mypage_nav {
	width: 400px;
}

#Mypage-center {
	display: flex;
	flex-direction: row;
}

#Mypage_nav {
	display: flex;
	flex-direction: column;
	width: 120px;
}

.Easy-sgin-in-wrap {
	display: flex;
	flex-direction: column; /*column으로 정렬 */
	float: right;
}

.Easy-sgin-in-wrap .sign-button-list {
	list-style: none;
	width: 350px;
	display: flex;
	flex-direction: column;
}

.Easy-sgin-in-wrap .sign-button-list li {
	padding-top: 10px;
}

.Easy-sgin-in-wrap .sign-button-list li button {
	width: 350px;
	height: 40px;
	border: 1px solid rgb(0, 0, 0);
	text-align: center;
	background: rgb(255, 255, 255);
}

.Easy-sgin-in-wrap .sign-button-list li button i {
	font-size: 10px;
}
</style>
</head>
<title>주문결제창</title>
<body>

	<!-- 마이페이지 타이틀 -->
	<section class="ftco-section"
		style="padding-top: 50px; margin-bottom: 50px; padding-bottom: 0px; height: 700px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">마이페이지</h2>
				</div>
			</div>
			<!-- 마이페이지 타이틀 끝 -->
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
			<!-- 최근 본 상품 끝 -->
			<!-- Left Menu -->
			<jsp:include page="/WEB-INF/views/common/mypage_sidemenu.jsp"
				flush="false" />
			<!-- left Menu 끝-->
			<!-- 마이페이지 상단 공통 ui -->
			<div class="table_01" style="padding-top: 30px;">
				<div id="MyPage_top">
					<table style="width: 1000px; height: 80px; smargin-left: 80px;">
						<tbody id="MyPage_center1">
							<tr height="60px;">
								<th
									style="font-size: 16px; background-color: #212529; color: white;"
									colspan="3"><a
									style="font-size: 16px; padding-left: 10px;">홍길동</a> <a>님
										환영합니다.</a></th>
							</tr>
							<tr align="center"
								style="padding-left: 10px; font-size: 16px; height: 60px;"
								height="45%">
								<th width="220" style="text-align: center">주문/배송<a
									href="/MyPage-04" style="color: red;">4</a><a>건</a></th>
								<th width="220" style="text-align: center">취소/반품<a
									href="/MyPage-06" style="color: red;">2</a><a>건</a></th>
								<th width="220" style="text-align: center">장바구니<a
									href="/Cart" style="color: red;">1</a><a>건</a></th>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 마이페이지 상단 공통 ui 끝-->

				<div id="MyPage_top" style="padding-top: 40px;">
					<form name="dateinquiry1" action="#" method="post">
						<table style="width: 1000px; height: 80px; align: center;">
							<tbody id="MyPage_center3">
								<tr height="50%">
									<th
										style="font-size: 18px; text-align: left; font-weight: bold;"
										colspan="4">주문/배송조회(최근 1개월)</th>
								</tr>
								<tr align="center"
									style="padding-top: 10px; padding-left: 10px; font-size: 15px;"
									height="35%">
									<th style="text-align: left;">
										<div style="display: inline !important;">
											<p style="float: left; width: 80px; margin-top: 10px;">구매기간</p>

											<input type="text" id="datepicker1"
												style="width: 120px; margin-right: 50px; margin-top: 10px; height: 30px; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

											<span class="glyphicon glyphicon-calendar" aria-hidden="true"
												style="margin-left: -35px;"> </span> ~ <input type="text"
												id="datepicker2"
												style="width: 120px; margin-right: 50px; height: 30px; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

											<span class="glyphicon glyphicon-calendar" aria-hidden="true"
												style="margin-left: -35px;"> </span>

											<button type="submit" class="btn btn-default"
												style="background-color: #dcdcdc; fmargin-left: 380px; margin-top: 0px; width: 80px; height: 28px; display: inline !important; background-color: #212529; color: white; border-radius: 2px; height: 30px; margin-right: 500px; padding-top: 3px;">조회</button>
										</div>
									</th>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div id="MyPage_top">
					<table border="1"
						style="width: 1000px; height: 180px; align: center;">
						<tbody id="MyPage_center2">
							<tr height="30%" style="background-color: #212529; color: white;">
								<th style="font-size: 15px; text-align: center; border-left: 0;"
									width="100" height="40"
									style="background-color: #212529; color: white;">주문일자</th>
								<th style="font-size: 15px; text-align: center;" width="250"
									style="background-color: #212529; color: white;">상품명</th>
								<th style="font-size: 15px; text-align: center;" width="70"
									style="background-color: #212529; color: white;">수량</th>
								<th style="font-size: 15px; text-align: center;" width="110"
									style="background-color: #212529; color: white;">금액</th>
								<th
									style="font-size: 14px; text-align: center; border-right: 0;"
									width="130">현재상태</th>
							</tr>
							<c:forEach var="myOrderInfoList" items="${myOrderInfoList}">
								<tr height="80%">
									<th style="text-align: center;"><fmt:formatDate
											value="${myOrderInfoList.memOrderDate}" /></th>
									<th style="padding: 10px; text-align: left;"
										onClick="location.href='Product-02'">
										<div>
											<img src="${contextPath}/resources/images/image_1.jpg"
												width="110" height="110" style="float: left;"> <a
												style="margin-left: 30px;">${myOrderInfoList.productName}</a>
											<c:if test="${myOrderInfoList.option1 !=null}">
												<p style="margin-left: 140px; font-size: 13px;">옵션1 :
													${myOrderInfoList.option1}</p>
											</c:if>
											<c:if test="${myOrderInfoList.option2 !=null}">
												<p style="margin-left: 140px; font-size: 13px;">옵션2 :
													${myOrderInfoList.option2}</p>
											</c:if>
										</div>

									</th>
									<th style="text-align: center;">${myOrderInfoList.productCnt}</th>
									<th style="text-align: center;">${myOrderInfoList.productPrice}</th>
									<th style="text-align: center; height: 150px;"><ins
											onclick="location='#'" id="now-state"
											style="color: red; font-size: 14px; padding-left: 10px;">
											${myOrderInfoList.deliveryStatus}<br>
										</ins> <c:if test="${myOrderInfoList.purchaseConfirm =='구매'}">
											<form>
												<input type="button" name="purchaseConfirm"
													style="font-size: 14px; width: 110px; background-color: #212529; margin-bottom: 5px; color: white;"
													class="confirmation"
													onclick="confirmOrderConfirm(this.form)" value="구매확정">
												<input type="hidden" id="memOrderSeqNum"
													name="memOrderSeqNum"
													value="${myOrderInfoList.memOrderSeqNum}" />
											</form>
										</c:if> <c:if test="${myOrderInfoList.purchaseConfirm =='구매확정'}">
													
											<button
												style="font-size: 14px; width: 110px; background-color: #212529; margin-bottom: 5px; color: white;"
												id="pressbtn1" class="confirmation" onclick="location.href='${contextPath}/mypage/reviewWrite.do?productNum=${myOrderInfoList.productNum}&memOrderSeqNum=${myOrderInfoList.memOrderSeqNum}'">리뷰작성

											</button>
										</c:if>

										<button
											style="font-size: 14px; width: 110px; background-color: #212529; margin-bottom: 5px; color: white;"
											onclick="location.href='${contextPath}/mypage/addNewReturn.do?memOrderSeqNum=${myOrderInfoList.memOrderSeqNum}'">반품신청</button>
										<button
											style="font-size: 14px; width: 110px; background-color: #212529; color: white;"
											onclick="location.href='#'">주문 상세보기</button></th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 내용 -->

		</div>
	</section>
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