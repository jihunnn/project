<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
	function modProduct(obj) {
		obj.action = "${contextPath}/product/modNewProduct.do?productNum=${productNum.productNum}";
		obj.submit();

	}

	function removeProduct(obj) {
		var form = document.RemoveProduct;

		if (confirm("상품을 삭제하시겠습니까?")) { //확인
			obj.action = "${contextPath}/product/removeProduct.do?productNum=${product.productNum}";

		} else { //취소
			return false;
		}
		obj.submit();
	}
</script>

</head>
<body>
	<form name="RemoveProduct"
		action="${contextPath}/product/modProduct.do?productNum=${product.productNum}"
		method="post" enctype="multipart/form-data">
		<section class="ftco-section" style="padding-top: 100px;">
			<div class="container">

				<!-- 내용 -->
				<div class="row">
					<section>
						<div class="col-md-4 ftco-animate">
							<div class="blog-entry">
								<a><img src="${contextPath}/resources/images/bed.jpg"
									style="width: 600px; padding-top: 10px; padding-top: 10px; margin-left: -15px; float: left;">
								</a> <br>
							</div>
						</div>
					</section>


					<div style="width: 685px; height: 480px;">
						<h3
							style="font-size: 20px; color: #7e9c8c; margin-left: 50px; margin-top: 5px;">${product.productName}</h3>
						<hr style="width: 600px;">
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 5px; margin-left: 50px; float: left; font-size: 14px; color: #5f5f5f;">판매가ㅤㅤ
								ㅤ</a><a
								style="position: absolute; white-space: nowrap; margin-top: 5px; margin-left: 180px; font-size: 14px; color: #5f5f5f;">${product.productPrice}원</a><input
								type="hidden" name="price" value="${product.productPrice}">
						</h3>

						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 50px; margin-left: 51px; float: left; font-size: 14px; color: #5f5f5f;">제조사ㅤㅤ
								ㅤ</a><a
								style="position: absolute; white-space: nowrap; margin-top: 50px; margin-left: 180px; font-size: 14px; color: #5f5f5f;">${product.productManufacturer}</a>
						</h3>
						<br> <br>
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 50px; margin-left: 51px; float: left; font-size: 14px; color: #5f5f5f;">원산지ㅤㅤ
								ㅤ</a>
						</h3>
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 40px; margin-left: 180px; font-size: 14px; color: #5f5f5f;">${product.productOrigin}</a>
						</h3>
						<br>



						<h3 class="heading">
							<c:forEach items="${option1}" var="name1">
								<a
									style="position: absolute; white-space: nowrap; margin-top: 82px; margin-left: 51px; float: left; font-size: 14px; color: #5f5f5f; font-weight: normal;">${name1.option1name}ㅤㅤ
									ㅤ</a>
							</c:forEach>
						</h3>
						<select id="option1" name="option1"
							onchange="checkPrice();getSelectValue1(this.form);"
							style="margin-left: 180px; margin-top: 70px; float: left !important; left: 675px; font-size: 14px; border: 1px solid #dcdcdc; width: 326px; height: 32px;">
							<option value="">옵션 선택</option>
							<c:forEach items="${option1}" var="option1">
								<option value="${option1.option1price}">${option1.option1value}
									+ (${option1.option1price}원)</option>
							</c:forEach>
						</select> <input type="hidden" name="option1value"> <br>
						<h3 class="heading">
							<c:forEach items="${option2}" var="name2">
								<a
									style="position: absolute; float: left !important; left: 809px; white-space: nowrap; margin-top: 100px; margin-left: 155px; float: left; font-size: 14px; color: #5f5f5f; font-weight: normal;">${name2.option2name}
									ㅤ</a>
							</c:forEach>

						</h3>
						<select name="option2" id="option2"
							onchange="checkPrice();getSelectValue2(this.form);"
							style="margin-left: 180px; margin-top: 20px; float: left !important; font-size: 14px; border: 1px solid #dcdcdc; width: 326px; height: 32px;">
							<option value="">옵션 선택</option>
							<c:forEach items="${option2}" var="option2">
								<option value="${option2.option2price}">${option2.option2value}
									+ (${option2.option2price}원)</option>
							</c:forEach>
						</select> <br> <input type="hidden" name="option2value">

						<button type="button" class="btn btn-default" onclick="checkbuy()"
							style="background-color: #7e9c8c; float: left; margin-left: 50px; margin-top: 37px; width: 280px; height: 50px; border-radius: 2px; font-size: 14px; color: white;">바로구매</button>
						<button type="button" class="btn btn-default"
							onclick="addCartBtn()"
							style="background-color: #eeeeee; float: left; margin-left: 350px; margin-top: -50px; width: 280px; height: 50px; border-radius: 2px; font-size: 14px;">장바구니</button>

						<input type="button" name="up" onclick="up()" value=" + " size="3"
							style="width: 27px; height: 28px; white-space: nowrap; float: left; color: #5f5f5f; margin-left: 50px; font-size: 18px; border: none; margin-top: 30px;">

						<input type="text" name="productCnt" id="quantity" value="1"
							readonly="readonly"
							style="white-space: nowrap; float: left; font-size: 14px; width: 50px; height: 28px; text-align: center; margin-top: 30px; border: 1px solid #eeeeee;" />

						<input type="button" name="down" onclick="down()" value=" - "
							size="3"
							style="width: 27px; height: 28px; white-space: nowrap; color: #5f5f5f; float: left; font-size: 18px; border: none; margin-top: 30px;">
						<h2
							style="margin-top: 200px; font-size: 18px; test-align: right; width: 400px; margin-left: 380px;">
							총 상품 금액ㅤ<input type="text" name="totalPrice" value="0"
								style="border: none; text-align: right; font-size: 20px; width: 98px; margin-left: 18px;"
								readonly />원
						</h2>

					</div>

				</div>
				<div style="float: right;">
					<input type="button" onclick="removeProduct(this.form)"
						value="삭    제"
						style="float: right; margin-top: 25px; border-radius: 2px;margin-right:40px; background-color: #5f5f5f; color: white; border: none; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; font-size: 14px;">
					<input type="submit" name="modify" value="수    정"
						style="float: right; margin-top: 25px; border-radius: 2px; margin-right:20px; background-color: #5f5f5f; color: white; border: none; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; font-size: 14px;">

				</div>



				<ul class="nav  tabs" style="margin-top: 100px;">
					<li role="presentation" class="active"
						style="width: 290px; text-align: center;"><a href="#tab1"
						style="font-size: 23px; color: black;">상품상세정보</a></li>

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
								src="${contextPath}/download_product1.do?productNum=${product.productNum}&productContentImage=${product.productContentImage}">
						</div>

					</div>


					<div id="tab4" class="tab_content"
						style="margin-left: 0px; margin-right: 170px;">
						<!--Content-->

					</div>
				</div>

			</div>


		</section>
	</form>

</body>
</html>