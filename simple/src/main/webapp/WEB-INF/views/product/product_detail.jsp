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


function getSelectValue1(frm)
{
	frm.option1value.value = frm.option1.options[frm.option1.selectedIndex].text;
}

function getSelectValue2(frm)
{
	frm.option2value.value = frm.option2.options[frm.option2.selectedIndex].text;
}

<!--옵션 + 수량 총 합계금액 -->

var fo;
window.onload = function() {
	fo = document.forms["form1"];
	fo['productPrice'].value = fo['price'].value;
}


function checkPrice() {
	fo['productPrice'].value= Number(fo['price'].value) + Number(fo['option1'].value) + Number(fo['option2'].value);
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
	if (confirm("선택한 상품을 구매하시겠습니까?")) { //확인
		
	} else { //취소
		return false;
	}
	form.action="${contextPath}/order.do"
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
	
	if (confirm("장바구니에 담으시겠습니까?")){ //확인
		
		
	} else { //취소
		return;
	}
	form.action="${contextPath}/cartall.do"
	form.submit();
}

function add_favorite(productNum) {
	if(confirm("관심상품에 등록하시겠습니까?"))
	{
		if(${isLogOn != true}){
		      alert("로그인이 필요합니다.");
		}else{
    	    $.ajax({
	        	type : "post",
	        	async : false, //false인 경우 동기식으로 처리한다.
	        	url : "${contextPath}/addProductInFavorite.do",
	        	data : {
	        		productNum:productNum
			
    	    	},
    	    	success : function(data, textStatus) {
	        		//alert(data);
	            	//	$('#message').append(data);
	        		if(data.trim()=='add_success'){
	        			alert("관심상품에 등록되었습니다.");	
	        			
	        			document.getElementById('favorite').style.display = 'none';
	        			document.getElementById('favorite_add').style.display = 'block';
	        			
	        		}else if(data.trim()=='already_existed'){
		    	    	alert("이미 관심상품에 등록된 상품입니다.");	
		        	}
	     		
	        	},
	        	error : function(data, textStatus) {
	        		alert("에러가 발생했습니다."+data);
    	    	},
    	    	complete : function(data, textStatus) {
    	     		//alert("작업을완료 했습니다");
    	    	}
        	}); //end ajax	
		}
	}else{
		return false;
	}
	
}


	
</script>


</head>
<body>
	<!-- 최근 본 상품 -->

	<!-- 최근 본 상품 끝 -->


	<section class="ftco-section"
		style="padding-top: 20px; margin-bottom: 200px; margin-top: 80px;">
		<div class="container">
			<form name="form1" method="GET" id="addCartForm">
				<input type="hidden" name="productNum" value="${product.productNum}" />
				<input type="hidden" name="productName"
					value="${product.productName}" /> <input type="hidden"
					name="option1name" value="${option1[1].option1Name}" /> <input
					type="hidden" name="option2name" value="${option2[1].option2Name}" />
				<input type="hidden" name="deliverycharge" value="무료배송" />




				<!-- 내용 -->
				<div class="row">
					<section>
						<div class="col-md-4 ftco-animate">
							<div class="blog-entry">
								<a><img
									src="${contextPath}/download_product.do?productNum=${product.productNum}&productImage=${product.productImage}"
									style="border:1px solid gray; width: 600px; height:409.68px; padding-top: 10px; padding-top: 10px; margin-left: -15px; float: left;">
								</a> <br>
							</div>
						</div>
					</section>


					<div style="width: 685px; height: 480px;">
					
						<h1
							style="font-weight:bold; font-size: 20px; color: #7e9c8c; float: left; margin-left: 50px; margin-top: 5px;">${product.productName}</h1>

						<a  href="javascript:add_favorite('${product.productNum }')"
							style="all: none; font-size: 15px; color: #7e9c8c; margin-left: 430px; margin-top: 5px;">관심상품</a>
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
							<c:forEach items="${option1}" var="name1" begin="0" end="0">
								<a
									style="position: absolute; white-space: nowrap; margin-top: 82px; margin-left: 51px; float: left; font-size: 14px; color: #5f5f5f; font-weight: normal;">${name1.option1Name}ㅤㅤ
									ㅤ</a>
							</c:forEach>
						</h3>
						<select id="option1" name="option1"
							onchange="checkPrice();getSelectValue1(this.form);"
							style="margin-left: 180px; margin-top: 70px; left: 675px; font-size: 14px; border: 1px solid #dcdcdc; width: 326px; height: 32px;">
							<option value="">옵션 선택</option>
							<c:forEach items="${option1}" var="option1">
								<option value="${option1.option1price}">${option1.option1value}
									+ (${option1.option1price}원)</option>
							</c:forEach>
						</select> <input type="hidden" name="option1value"> <br>
						<h3 class="heading">
							<c:forEach items="${option2}" var="name2" begin="0" end="0">
								<a
									style="position: absolute; white-space: nowrap; margin-top: 35px; margin-left: 51px; float: left; font-size: 14px; color: #5f5f5f; font-weight: normal;">${name2.option2Name}
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
							총 상품 금액ㅤ<input type="text" name="productPrice" value="0"
								style="border: none; text-align: right; font-size: 20px; width: 98px; margin-left: 18px;"
								readonly />원
						</h2>

					</div>

				</div>

			</form>

			<!-- 탭메뉴 자바스크립트 -->
			<c:choose>
				<c:when test="${pageNum != 1}">
					<script type="text/javascript"
						src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
					<script type="text/javascript">
						$(document).ready(function() {
							//When page loads...
							$(".tab_content").hide(); //Hide all content
							$("ul.tabs li:nth(1)").addClass("active").show(); //Activate first tab
							$(".tab_content:nth(1)").show(); //Show first tab content
							//On Click Event
							$("ul.tabs li").click(function() {
								$("ul.tabs li").removeClass("active"); //Remove any "active" class
								$(this).addClass("active"); //Add "active" class to selected tab
								$(".tab_content").hide(); //Hide all tab content
								var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
								$(activeTab).fadeIn(); //Fade in the active ID content
								return false;

							});

							window.scrollBy(200, 600);

						});
					</script>
				</c:when>
				<c:otherwise>
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
				</c:otherwise>
			</c:choose>
			<!-- 탭메뉴 영역 -->



			<ul class="nav  tabs" style="margin-top: 100px;">
				<li role="presentation" class="active"
					style="width: 290px; margin-left: 30px; text-align: center;"><a
					href="#tab1" style="font-size: 17px; color: black;">상품상세정보</a></li>
				<li role="presentation" style="width: 290px; text-align: center;"><a
					href="#tab2" style="font-size: 17px; color: black;" id="tab2Review">고객후기<span
						style="color: #7e9c8c; font-weight: bold;">
							(${pageMaker.totalCount})</span></a></li>
				<li role="presentation" style="width: 290px; text-align: center;"><a
					href="#tab3" style="font-size: 17px; color: black;">AS/배송/반품안내</a></li>
				<li role="presentation" style="width: 290px; text-align: center;"><a
					href="#tab4"
					style="font-size: 17px; margin-left: 50px; color: black;">상품문의</a></li>

			</ul>
			<hr style="margin-right: 30px;">
			<div id="wrapper">
				<div class="tab_container">

					<div id="tab1" class="tab_content"
						style="margin-left: 190px; margin-right: 170px;">
						<!--Content-->
						<img style="width: 1200px; margin-left: -180px;"
							src="${contextPath}/download_product1.do?productNum=${product.productNum}&productContentImage=${product.productContentImage}">
					</div>
					<div id="tab2" class="tab_content">
						<!--Content-->
						<table class="table"
							style="margin-top: 60px; text-align: center; width: 1200px; margin-left: -70px; font-size: 14px;">

							<tr
								style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #c6c8ca;">
								<td>번호</td>
								<td>작성자</td>
								<td>내용</td>
								<td>작성일자</td>
							</tr>
							<c:set var="num"
								value="${pageMaker.totalCount - ((pageNum-1) * 10) }" />
							<c:choose>
								<c:when test="${empty productReviewList}">
									<tr style="backgroundcolor: white; width: 1000px;">

										<td colspan="4" style="padding-top: 100px;">등록 된 리뷰가
											없습니다.</td>
									</tr>
								</c:when>

								<c:when test="${!empty productReviewList}">
									<c:forEach var="productReview" items="${productReviewList}">

										<!-- 레이어 팝업창 -->
										<div id="tallModal" class="modal modal-wide fade">
											<div class="modal-dialog">
												<div class="modal-content"
													style="width: 600px; height: 500px;">
													<div class="modal-header" style="text-align: center;">
														<h4 class="modal-title" style="font-size: 17px;">${productReview.productReviewTitle}</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
													</div>
													<div class="modal-body">
														<p>${productReview.productContent}</p>
													</div>

													<img src="" />
													<div class="modal-footer">
														<button type="button" class="btn btn-primary"
															data-dismiss="modal"
															style="float: right; border-radius: 2px;">Close</button>
													</div>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
										</div>


										<!-- /.modal -->
										<tr style="border-bottom: 1px solid #c6c8ca;">
											<td style="width: 100px;">${num}</td>
											<td style="width: 200px;">${productReview.memName }</td>
											<td style="width: 500px; text-align: left;"><a
												style="color: black; cursor: pointer;" data-toggle="modal"
												href="#tallModal"> ${productReview.productReviewTitle}</a> <!-- 팝업시킬 태그 -->
											</td>
											<td style="width: 200px;">2021-06-12</td>
										</tr>
										<c:set var="num" value="${num-1}"></c:set>
									</c:forEach>
								</c:when>
							</c:choose>
						</table>

						<div class="page_wrap"
							style="margin-top: 50px; margin-left: -80px;" align="center">
							<div class="page_nation">
								<c:if test="${pageMaker.prev}">

									<a class="arrow prev"
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 6px; padding-right: 7px;"
										href='<c:url value="/product/viewProduct.do?productNum=${product.productNum}&page=${pageMaker.startPage-1 }"/>'><i
										class="fa fa-chevron-left"></i></a>

								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="pageNum">

									<a
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 6px; padding-right: 7px;"
										href='<c:url value="/product/viewProduct.do?productNum=${product.productNum}&page=${pageNum }"/>'><i
										class="fa">${pageNum }</i></a>

								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

									<a class="arrow next"
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 6px; padding-right: 7px;"
										href='<c:url value="/product/viewProduct.do?productNum=${product.productNum}&page=${pageMaker.endPage+1 }"/>'><i
										class="fa fa-chevron-right"></i></a>

								</c:if>
							</div>
						</div>



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
								<td style="width: 500px;"><a href="#" style="color: black;">이거
										그레이색 언제 재입고 되나요</a></td>
								<td style="width: 200px;">2021-06-12</td>
							</tr>
							<tr style="border-bottom: 1px solid grey;">
								<td style="width: 100px;">2</td>
								<td style="width: 200px;">나애리</td>
								<td style="width: 500px;"><a href="#" style="color: black;">
										언제와요</a></td>
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
		</div>


	</section>


</body>
</html>