<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 탭메뉴 자바스크립트 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.tabs li").click(function() {

			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});

	});d
</script>

</head>
<body>

	<img src="${contextPath}/resources/images/store.jpg" width=100%
		height=350px>

	<section class="ftco-section"
		style="padding-top: 20px; margin-bottom: 50px; padding-bottom: 0px; margin-bottom: 400px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">매장안내</h2>
				</div>
			</div>


			<!-- 탭메뉴 영역 -->

			<ul class="nav  tabs" style="margin-top: 100px; margin-left: 0px;">
				<li role="presentation" class="active"
					style="width: 500px; margin-lift: 300px;"><a href="#tab1"
					style="text-align: center; font-size: 22px; color: black; padding-left: 300px;">회사소개</a></li>
				<li role="presentation" style="width: 500px;"><a href="#tab2"
					style="text-align: center; font-size: 22px; color: black; padding-left: 300px;">매장안내</a></li>
			</ul>
			<hr>
			<div id="wrapper">
				<div class="tab_container">

					<div id="tab1" class="tab_content"
						style="margin-left: 150px; margin-right: 170px;">
						<!--Content-->
						<img src="${contextPath}/resources/images/storeInfomation-01.jpg"
							style="width: 1000px;">

					</div>
					<div id="tab2" class="tab_content"
						style="margin-left: 170px; margin-right: 170px;">
						<!--Content-->
						<table class="table"
							style="margin-top: 50px; border-right: 1px solid#">
							<thead class="table-dark" align=center>
								<tr align="center">
									<td scope="col" width="100">대전 본사</td>
									<td scope="col" width="100">천안 칙영</td>

								</tr>
								<tr
									style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">
									<td scope="col" width="50" height="150">주소: 대전 서구 탄방동
										83-13<br>전화번호: 042-527-3038<br> 영업시간: AM9:00 ~
										PM07:00<br>매주 <span style="color: red;">일요일 휴무</span>,공휴일
										정상 영업
									</td>
									<td scope="col" width="50" height="150">주소: 충남 천안시 서북구 쌍용동
										1736<br>전화번호: 041-571-7007<br> 영업시간: AM9:00 ~
										PM07:00<br>매주 <span style="color: red;">일요일 휴무</span>,공휴일
										정상 영업
									</td>
								</tr>
								<tr
									style="border-bottom: 1px solid #212529;; background-color: white; color: black;">

									<td scope="col" width="50" height="300">위치지도</td>
									<td scope="col" width="50">위치지도</td>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
