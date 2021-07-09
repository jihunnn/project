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
<!-- 상품리뷰 오버랩 디자인------------->
 
    textarea {
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
    
    	input:focus, textarea:focus{
    		border: 1px solid #97d6eb;
    	}
	
    textarea{
    	height: 60px;
    	background-color: #efefef;
    }
    #submit{
    	width: 127px;
    	height: 48px;
    	text-align: center;
    	border: none;
    	margin-top: 20px;
    	cursor: pointer;
    }
    #submit:hover{
    	color: #fff;
    	background-color: #216282;
    	opacity: 0.9;
    }
    #cancel {
    	width: 127px; height: 48px;
    	text-align: center;
    	border: none;
    	margin-top: 20px;
    	cursor: pointer;
    }
    #cancel:hover{
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
        transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s;
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
	obj.action="${contextPath}/product/modNewProduct.do?productNum=${productNum.productNum}";
	obj.submit();
	
}

    function removeProduct(obj){
    	var form = document.RemoveProduct;

	    if (confirm("상품을 삭제하시겠습니까?")){ //확인
	    	obj.action="${contextPath}/product/removeProduct.do?productNum=${product.productNum}";
	    	
	    } else { //취소
	     	return false;
	    }
	    obj.submit();
    }
</script>

</head>
<body>
    <form name="RemoveProduct" action="${contextPath}/product/modProduct.do?productNum=${product.productNum}"  method="post"enctype="multipart/form-data">
	<section class="ftco-section" style="padding-top: 20px; ">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 18px;">${product.productName}</h2>
				</div>
			</div>
	
			<!-- 내용 -->
			<div class="row">

	
	
				<div class="col-md-4 ftco-animate">
					<div class="blog-entry">
						<c:choose>	
					<c:when test="${not empty product.productImage && product.productImage != 'null'}">
					<input type="hidden" name="OrignProductFile" value="${product.productImage}"class="block-20" />	
						<a><img style="width: 600px; height:410px; padding-top: 10px; padding-top: 10px; margin-left: -15px; float: left;" src="${contextPath}/download_product.do?productNum=${product.productNum}&productImage=${product.productImage}" id="preview" /><br>
						</a>
						</c:when>
			       </c:choose>
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 5px; margin-left: 50px; float: left;">판매가ㅤㅤ
								ㅤ</a>
						</h3>
						<br>
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 50px; margin-left: 51px; float: left; font-size: 18px;">제조사ㅤㅤ
								ㅤ</a>
						</h3>
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 40px; margin-left: 180px; font-size: 18px;">${product.productManufacturer}</a>
						</h3>
						<br>
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 45px; margin-left: 51px; float: left; font-size: 18px;">원산지ㅤㅤ
								ㅤ</a>
						</h3>
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 35px; margin-left: 180px; font-size: 18px;">${product.productOrigin}</a>
						</h3>
						<br>


						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 80px; margin-left: 51px; float: left; font-size: 18px;">옵션1ㅤㅤ
								ㅤ</a>
						</h3>

						<select id="selectBox" name="selectBox"
							style="margin-left: 765px; margin-top: -230px; float: left !important; width: 300px; height: 30px;">
							<option value="" selected="selected">옵션 선택</option>
							<option value="option1">뭐지</option>
						</select> <br>
						
						<br>
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 90px; margin-left: -430px; float: left; font-size: 18px;">옵션2ㅤㅤ
								ㅤ</a>
						</h3>
						</div>
						<div>
						  <h3 class="heading" style="padding-left: 950px;padding-top: 150px;text-align: center;width: 400px;">
							<a><fmt:formatNumber pattern="###,###,###" value="${product.productPrice}"/>원</a>
						  </h3>
						</div>
						<select
							style="margin-left: 765px; margin-top: -150px; float: left !important; width: 300px; height: 30px;">
							<option>옵션 선택</option>
						</select> <br>
			    	</div>
			    </div>
                <div style="float: right;">
                         <input type="submit" name="modify" value="수    정" style="width: 75px; height: 40px; padding-left: 10px; background-color: #212529; color: white; border-radius:2px;"> 
						 <input type="button" onclick="removeProduct(this.form)"value="삭    제" style="width: 75px; height: 40px; background-color: #212529; color: white; border-radius:2px; margin-left:20px;">
						<input type="button" name="backlistproduct" value="뒤로가기" style="width: 75px; height: 40px; background-color: #212529; color: white; border-radius:2px; margin-left:20px;" onclick="location.href='${contextPath}/product/admin_listProduct.do'">
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