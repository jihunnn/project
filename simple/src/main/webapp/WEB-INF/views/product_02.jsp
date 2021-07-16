<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="option1" value="${option.optionList1}" />
<c:set var="option2" value="${option.optionList2}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
#pdcategory {
	font-size: 17px;
	background-color: #f8f8f8;
	border: 1px solid #e7e7e7;
	border-right: none;
	height: 50px;
	color: #777;
}

#recentlyProduct {
	position: absolute;
	top: 180px;
	right: 50%;
	margin-right: -670px;
}

<!--
상품리뷰 오버랩 디자인------------->textarea {
	width: 439px;
	height: 27px;
	background-color: #efefef;
	border-radius: 6px;
	border: 1px solid #dedede;
	padding: 10px;
	margin-top: 3px;
	font-size: 0.9em;
	color: #3a3a3a;
}

input:focus, textarea:focus {
	border: 1px solid #97d6eb;
}

textarea {
	height: 60px;
	background-color: #efefef;
}

#submit {
	width: 127px;
	height: 48px;
	text-align: center;
	border: none;
	margin-top: 20px;
	cursor: pointer;
}

#submit:hover {
	color: #fff;
	background-color: #216282;
	opacity: 0.9;
}

#cancel {
	width: 127px;
	height: 48px;
	text-align: center;
	border: none;
	margin-top: 20px;
	cursor: pointer;
}

#cancel:hover {
	color: #fff;
	background-color: #216282;
	opacity: 0.9;
}

.review {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	opacity: 0;
	visibility: hidden;
	transform: scale(1.1);
	transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform
		0.25s;
}

.review-content {
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 1rem 1.5rem;
	width: 850px;
	height: 500px;
	border-radius: 0.5rem;
}

.close-button {
	float: right;
	width: 1.5rem;
	line-height: 1.5rem;
	text-align: center;
	cursor: pointer;
	border-radius: 0.25rem;
	background-color: lightgray;
}

.close-button:hover {
	background-color: darkgray;
}

.show-modal {
	opacity: 1;
	visibility: visible;
	transform: scale(1.0);
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
}
</style>


<script type="text/javascript">


	
	<!--옵션 + 수량 총 합계금액 -->
	
	var fo;
	window.onload = function() {
		fo = document.forms["form1"];
		fo['total'].value = fo['price'].value;
	}

	
	function checkPrice() {
		fo['total'].value= Number(fo['price'].value) + Number(fo['option1'].value) + Number(fo['option2'].value);
	}
		
	<!-- 옵션선택 유효성 검사 -->
	
	function checkbuy() {
		var form = document.form1;

		if (form.option1.value == "") {
			alert("옵션을 선택해주세요.")
			form.form1.focus();
			return false;
		}
		
		if (form.option2.value == "") {
			alert("옵션을 선택해주세요.")
			form.form1.focus();
			return false;
		}
		
		form.submit();
	}
	
	function addCartBtn() {
		var form = document.form1;

		if (form.option1.value == "") {
			alert("옵션을 선택해주세요.")
			form.form1.focus();
			return false;
		}
		
		if (form.option2.value == "") {
			alert("옵션을 선택해주세요.")
			form.form1.focus();
			return false;
		}
		
		form.submit();
	}
	

	
	
</script>
</head>
<body>


	<section class="ftco-section" style="padding-top: 20px;">
		<div class="container">

			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 18px;">${product.productName}</h2>
				</div>
			</div>
			<!-- 최근 본 상품 -->
			<div id="recentlyProduct"
				style="position: absolute; left: 180px; width: 120px; height: 310px; margin-left: 1570px; border: 1px solid #d2d2d2; margin-top: 0px;">
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
			<!-- 내용 -->
			<form name="form1" method="post" id="addCartForm"
				action="${contextPath}/product/viewProduct.do?productNum=${product.productNum}">
				<div class="row">
					<section>
						<div class="col-md-4 ftco-animate">
							<div class="blog-entry">
								<a><img src="${contextPath}/resources/images/image_1.jpg"
									style="width: 600px; padding-top: 10px; padding-top: 10px; margin-left: -15px; float: left;">
								</a> <br>
							</div>
						</div>
					</section>


					<section style="width: 685px; height: 480px;">

						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 5px; margin-left: 50px; float: left; font-size: 18px;">판매가ㅤㅤ
								ㅤ</a><a
								style="position: absolute; white-space: nowrap; margin-top: 5px; margin-left: 180px; font-size: 18px;">${product.productPrice}원</a><input
								type="hidden" name="price" value="${product.productPrice}">
						</h3>

						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 50px; margin-left: 51px; float: left; font-size: 18px;">제조사ㅤㅤ
								ㅤ</a><a
								style="position: absolute; white-space: nowrap; margin-top: 50px; margin-left: 180px; font-size: 18px;">${product.productManufacturer}</a>
						</h3>
						<br> <br>
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 50px; margin-left: 51px; float: left; font-size: 18px;">원산지ㅤㅤ
								ㅤ</a>
						</h3>
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 40px; margin-left: 180px; font-size: 18px;">${product.productOrigin}</a>
						</h3>
						<br>



						<h3 class="heading">
							<c:forEach items="${option1}" var="name1">
								<a
									style="position: absolute; white-space: nowrap; margin-top: 80px; margin-left: 51px; float: left; font-size: 18px;">${name1.option1name}ㅤㅤ
									ㅤ</a>
							</c:forEach>
						</h3>
						<select id="option1" name="option1" onchange="checkPrice()"
							style="margin-left: 180px; margin-top: 70px; float: left !important; width: 300px; height: 30px;">
							<option value="">옵션 선택</option>
							<c:forEach items="${option1}" var="option1">
								<option value="${option1.option1price}">${option1.option1value}
									+ (${option1.option1price}원)</option>
							</c:forEach>
						</select> <br> <br>
						<h3 class="heading">
							<c:forEach items="${option2}" var="name2">
								<a
									style="position: absolute; white-space: nowrap; margin-top: 80px; margin-left: 51px; float: left; font-size: 18px;">${name2.option2name}
									ㅤ</a>
							</c:forEach>

						</h3>
						<select name="option2" id="option2" onchange="checkPrice()"
							style="margin-left: 180px; margin-top: 70px; float: left !important; width: 300px; height: 30px;">
							<option value="">옵션 선택</option>
							<c:forEach items="${option2}" var="option2">
								<option value="${option2.option2price}">${option2.option2value}
									+ (${option2.option2price}원)</option>
							</c:forEach>
						</select> <br>

						<button type="button" class="btn btn-default" onclick="checkbuy()"
							style="background-color: #dcdcdc; float: left; margin-left: 50px; margin-top: 30px; width: 280px; height: 50px; border-radius: 2px;">바로구매</button>
						<button type="button" class="btn btn-default"
							onclick="addCartBtn()"
							style="background-color: #dcdcdc; float: left; margin-left: 350px; margin-top: -50px; width: 280px; height: 50px; border-radius: 2px;">장바구니</button>

						<h2 style="margin-top: 250px; margin-left: 50px;">총 상품 금액</h2>
						<input type="text" name="total" value="0"
							style="border: none; text-align: right; font-size: 40px;"
							readonly />원

					</section>
				</div>
			</form>

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
				});
			</script>

			<section>
				<!-- 탭메뉴 영역 -->

				<ul class="nav  tabs" style="margin-top: 100px;">
					<li role="presentation" class="active"
						style="width: 290px; text-align: center;"><a href="#tab1"
						style="font-size: 23px; color: black;">상품상세정보</a></li>
					<li role="presentation" style="width: 290px; text-align: center;"><a
						href="#tab2" style="font-size: 23px; color: black;">고객후기</a></li>
					<li role="presentation" style="width: 290px; text-align: center;"><a
						href="#tab3" style="font-size: 23px; color: black;">AS/배송/반품안내</a></li>
					<li role="presentation" style="width: 290px; text-align: center;"><a
						href="#tab4" style="font-size: 23px; color: black;">상품문의</a></li>

				</ul>
				<hr>
				<div id="wrapper">
					<div class="tab_container" style="margin-left: 50px;">

						<div id="tab1" class="tab_content"
							style="margin-left: 170px; margin-right: 170px;">
							<!--Content-->
							<img
								src="${contextPath}/resources/images/product/sopiaDetiles.jpg"
								style="width: 1200px; margin-left: -180px;"> <img
								src="${contextPath}/resources/images/product/sopiaDetiles2.jpg">
						</div>
						<div id="tab2" class="tab_content"
							style="margin-left: 150px; width: 1000px;">
							<!--Content-->
							<table class="table"
								style="margin-top: 60px; text-align: center; width: 1200px; margin-left: -80px;">

								<tr
									style="bakground-color: grey; border-bottom: 1px solid grey;">
									<td
										style="width: 100px; background-color: #212529; color: white;">번호</td>
									<td
										style="width: 200px; background-color: #212529; color: white;">작성자</td>
									<td
										style="width: 600px; background-color: #212529; color: white;">내용</td>
									<td
										style="width: 200px; background-color: #212529; color: white;">작성일자</td>
								</tr>
								<tr style="border-bottom: 1px solid grey;">
									<td style="width: 100px;">1</td>
									<td style="width: 200px;">홍두깨</td>
									<td style="width: 500px;"><a class="trigger"
										style="color: black; cursor: pointer;"> 좋아요좋아요좋아요</a> <!-- 팝업 될 레이어 -->
										<div class="review" style="text-align: left;">
											<div class="review-content">
												<span class="close-button" style="margin-bottom: 5px;">&times;</span>
												<table style="width: 800px;">
													<tr style="background-color: #212529;">
														<td>
															<h3 class="title"
																style="font-size: 17px; text-align: center; height: 10px; color: white;">좋아요좋아요좋아요</h3>
														</td>
													</tr>
													<tr>
														<td><p>너무 맘에 들어요 좋네요 ~! 만족합니당. 번창하세요~~!!</p> <img
															src="${contextPath}/resources/images/product/sopia.jpg"
															style="width: 400px; height: 300px;" /></td>
													</tr>
												</table>
											</div>
										</div> <!-- 상품평 오버랩 스크립트 위로 올리면안됨 --> <script type="text/javascript">
											var modal = document
													.querySelector(".review");
											var trigger = document
													.querySelector(".trigger");
											var closeButton = document
													.querySelector(".close-button");
											var cancelButton = document
													.querySelector("#cancel");
											//console.log(modal);
											function toggleModal() {
												modal.classList
														.toggle("show-modal");
											}
											function windowOnClick(event) {
												if (event.target === modal) {
													toggleModal();
												}
											}
											trigger.addEventListener("click",
													toggleModal);
											closeButton.addEventListener(
													"click", toggleModal);
											cancel.addEventListener("click",
													toggleModal);
											window.addEventListener("click",
													windowOnClick);
										</script> <!-- 상품평 오버랩 스크립트 위로 올리면안됨 끝끝 --></td>


									<td style="width: 200px;">2021-06-12</td>
								</tr>
								<tr style="border-bottom: 1px solid grey;">
									<td style="width: 100px;">2</td>
									<td style="width: 200px;">나애리</td>
									<td style="width: 500px;"><a href="#"
										style="color: black;"> 별로별로별로 그냥그럼</a></td>
									<td style="width: 200px;">2021-06-12</td>
								</tr>
							</table>


							<table class="table"
								style="margin-top: 20px; text-align: center; width: 1000px; margin-left: -80px; margin-bottom: 1px;">
								<tr>
									<td
										style="border: 1px solid grey; padding-top: 30px; padding-left: 0px;"><button
											type="submit" class="btn btn-default"
											style="background-color: #dcdcdc; margin-left: 845px; border-radius: 2px; width: 90px; height: 100px; margin-bottom: 3px;">등록</button>
										<img id="preview" src="#"
										style="background-color: #dcdcdc; margin-left: 630px; margin-top: -134px; width: 100px; height: 98px; margin-bottom: 0px; z-index: 1;" />
										<input type="text"
										placeholder="후기를 입력해주세요^^베스트 후기를 뽑아서 적립금을 드립니다."
										style="margin-top: -126px; width: 730px; height: 97px; float: left; margin-left: 20px;" />
										<input type="file" name="imageFileName"
										onchange="readURL(this);"
										style="margin-right: 670px; width: 300px; background-color: white; border: none; padding-top: 0px; padding-bottom: 50px; padding-left: 12px; padding-bottom: 10px;" /></td>
								</tr>
							</table>


						</div>
						<div id="tab3" class="tab_content"
							style="margin-left: 0px; margin-right: 170px;">
							<!--Content-->
							<img src="${contextPath}/resources/images/delivery.png"
								style="width: 1000px; margin-left: 20px; margin-top: 50px;">

						</div>

						<div id="tab4" class="tab_content"
							style="margin-left: 0px; margin-right: 170px;">
							<!--Content-->


							<table class="table"
								style="margin-top: 60px; text-align: center; width: 1000px; margin-left: 70px;">

								<tr
									style="bakground-color: grey; background-color: #dcdcdc; border-bottom: 1px solid grey;">
									<td
										style="width: 100px; background-color: #212529; color: white;">번호</td>
									<td
										style="width: 200px; background-color: #212529; color: white;">작성자</td>
									<td
										style="width: 500px; background-color: #212529; color: white;">내용</td>
									<td
										style="width: 200px; background-color: #212529; color: white;">작성일자</td>
								</tr>
								<tr style="border-bottom: 1px solid grey;">
									<td style="width: 100px;">1</td>
									<td style="width: 200px;">홍두깨</td>
									<td style="width: 500px;"><a href="#"
										style="color: black;">이거 그레이색 언제 재입고 되나요</a></td>
									<td style="width: 200px;">2021-06-12</td>
								</tr>
								<tr style="border-bottom: 1px solid grey;">
									<td style="width: 100px;">2</td>
									<td style="width: 200px;">나애리</td>
									<td style="width: 500px;"><a href="#"
										style="color: black;"> 언제와요</a></td>
									<td style="width: 200px;">2021-06-12</td>
								</tr>
							</table>
							<table class="table"
								style="margin-top: 20px; text-align: center; width: 1000px; margin-left: 70px; margin-bottom: 1px;">
								<tr>
									<td style="border: 1px solid grey; padding-top: 100px;"><button
											type="submit" class="btn btn-default"
											style="background-color: #dcdcdc; margin-left: 860px; margin-top: -85px; width: 100px; height: 100px; border-radius: 2px;">등록</button>
										<input type="text" placeholder="글을 입력해주세요^^"
										style="margin-top: -105px; width: 850px; height: 100px; float: left;" />
									</td>
								</tr>
							</table>
						</div>
					</div>

				</div>

			</section>
		</div>
	</section>



</body>
</html>