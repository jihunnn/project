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

#login { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	width: 1300px;
	height: 100px;
	align-items: center;
	padding-top: 10px;
	font-size: 20px;
}

#LeftBox {
	width: 500px;
	height: 450px;
	border: 1px solid #a9aaac;
	margin: 10 10 10 10;
}

#login_text {
	padding: 20px;
	margin: 10 10 10 10;
	font-size: 20px;
}

.id_pwd_text {
	padding-top: 60px;
	padding-left: 55px;
	padding-bottom: 10px;
}

.id_save_find {
	padding-left: 35px;
	padding-bottom: 10px;
}

#chk_save_id {
	padding-bottom: 10px;
	width: 20px;
	height: 20px;
}

#id_pwd_save {
	font-size: 15px;
}

#find_id_pwd {
	padding-left: 23px;
}

.btn_member_id_pwd {
	font-size: 15px;
}

#btn_submit_login {
	padding-left: 40px;
}

#submit_login {
	align-items: center;
	width: 350px;
	height: 40px;
	padding-bottom: 10px;
}

.Easy-sgin-in-wrap {
	display: flex;
	flex-direction: column; /*column으로 정렬 */
}

.Easy-sgin-in-wrap .sign-button-list {
	list-style: none;
	width: 350px;
	display: flex;
	flex-direction: column;
	padding-top: 10px;
}

.Easy-sgin-in-wrap .sign-button-list li {
	padding-bottom: 10px;
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

.Easy-sgin-in-wrap4 {
	display: flex;
	flex-direction: column; /*column으로 정렬 */
	align-items: center;
}

.Easy-sgin-in-wrap4 .sign-button-list4 {
	padding-top: 50px;
	list-style: none;
	width: 600px;
	display: flex;
	flex-direction: column;
}

.Easy-sgin-in-wrap4 .sign-button-list4 li {
	padding-bottom: 10px;
	padding-left: 10px;
}

.Easy-sgin-in-wrap4 .sign-button-list4 li button {
	width: 500px;
	height: 56px;
	border: 1px solid rgb(0, 0, 0);
	text-align: center;
	background: rgb(255, 255, 255);
}

.Easy-sgin-in-wrap4 .sign-button-list4 li button i {
	font-size: 25px;
}

</style>
<script type="text/javascript">
   //상품등록
   function new_Product(){
	   var form = document.newProduct;
	   
	   if(form.productNum.value==""){
		   alert("상품번호을 입력하지 않았습니다.")
		   form.productNum.focus();
		   return false;
	   }
	   
	   if(form.productName.value==""){
		   alert("상품이름을 입력하지 않았습니다.")
		   form.productName.focus();
		   return false;
	   }
	   if(form.productPrice.value==""){
		   alert("상품가격을 입력하지 않았습니다.")
		   form.productPrice.focus();
		   return false;
	   }
	 
	   if(form.category.value==""){
		   alert("상품카테고리를 입력하지 않았습니다.")
		   form.category.focus();
		   return false;
	   }
	   if(form.subcategory.value==""){
		   alert("상품하위카테고리를 입력하지 않았습니다.")
		   form.subcategory.focus();
		   return false;
	   }
	   if(form.productImage.value==""){
		   alert("상품이미지를 입력하지 않았습니다.")
		   form.productImage.focus();
		   return false;
	   }
	   if(form.productManufacturer.value==""){
		   alert("상품제조사를 입력하지 않았습니다.")
		   form.productManufacturer.focus();
		   return false;
	   }
	   if(form.productOrigin.value==""){
		   alert("상품원산지를 입력하지 않았습니다.")
		   form.productOrigin.focus();
		   return false;
	   }
	  
	   if (confirm("상품을 등록하시겠습니까?")){ //확인
	    	
	    } else { //취소
	     	return false;
	    }

	   form.submit();
   }
 
</script>
<script type="text/javascript">
$('document').ready(function() {
	 var area0 = ["카테고리 선택","침대","소파","화장대/옷장/수납","식탁/의자","테이블/책상/책장"];
	  var area1 = ["싱글","킹","이층침대","패밀리","퀸"];
	   var area2 = ["코너형","1인/웜체어","패브릭","리클라이너","4/6인 일자형"];
	   var area3 = ["거실장","장식장","화장대/콘솔","옷장","서랍장"];
	   var area4 = ["2인 이상","4인 이상","8인 이상", "식탁의자","테이블의자"];
	   var area5 = ["소파 테이블","좌식 테이블","원목 테이블", "다용도 테이블","책상/책장"];
	   // 카테고리 선택 박스 초기화
	 //하위카테고리 선택 박스 초기화

	   $("select[name^=category]").each(function() {
	    $selcategory = $(this);
	    $.each(eval(area0), function() {
	     $selcategory.append("<option value='"+this+"'>"+this+"</option>");
	    });
	    $selcategory.next().append("<option value=''>하위 카테고리 선택</option>");
	   });



	   // 카테고리 선택시 하위카테고리 설정

	   $("select[name^=category]").change(function() {
	    var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 Array
	    var $subcategory = $(this).next(); // 선택영역 객체
	    $("option",$subcategory).remove(); // 하위카테고리 초기화

	    if(area == "area0")
	     $subcategory.append("<option value=''>하위 카테고리 선택</option>");
	    else {
	     $.each(eval(area), function() {
	      $subcategory.append("<option value='"+this+"'>"+this+"</option>");
	     });
	    }
	   });


	   });

</script>

</head>
<title>관리자상품</title>
<body>
<img src="${contextPath}/resources/images/product-01.jpg" width=100%
		height=350px>


	<section class="ftco-section testimony-section"
		style="padding-top: 50px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 20px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">상품 관리</h2>
				</div>
			</div>

				<div class="btn-group btn-group-justified" role="group"
				aria-label="..." style="margin-bottom: 30px; margin-top: 10px;">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick="location.href='${contextPath}/product/admin_listProduct.do'"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white; margin-left: 10px;">상품조회</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick="location.href='${contextPath}/product/add_product.do'"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white; font-weight: bold;">*상품등록</button>
				</div>
			
			</div>
			
			<hr style="margin-top: -10px;">

			<section class="ftco-section testimony-section"
				style="padding-top: 40px;">
				<div class="container">
					<section class="Easy-sgin-in-wrap4">
						<div id="LeftBox" style="height:580px">
							<h3 id="login_text">상품등록</h3>
							<form name="newProduct" action="${contextPath}/product/addProduct.do?productNum=${product.productNum}" method="post" enctype="multipart/form-data">
								<div style="padding-left: 107px;"> 
                                     <label><a style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품번호</label>
                                          <input type="text" name="productNum" value="">
                               </div>
                               <div style="padding-left: 107px;"> 
                                     <label><a style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품이름</label>
                                         <input type="text" name="productName" value="">
                               </div>
                               <div style="padding-left: 107px;"> 
                                    <label><a style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품가격</label>
                                         <input type="text" name="productPrice" value="">
                               </div>
                               <div style="padding-left: 80px;"> 
                                       <div style="padding-left: 107px;"> 
                                       <select style="width:190px; height:35px;" name="category" id="category"></select>                   
                                       <select style="width:190px; height:35px;" name="subcategory" id="subcategory"></select> 
                                       </div>                     
                               </div>     
                               <div style="padding-left: 90px; padding-top: 6px;"> 
                                   <label><a style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품이미지</label>
                                        <input type="file" name="productImage" size=40 value="">
                               </div>
                               <div style="padding-left: 90px;"> 
                                   <label><a style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품제조사</label>
                                        <input type="text" name="productManufacturer" value="">
                               </div>
                               <div style="padding-left: 90px;"> 
                                   <label><a style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품원산지</label>
                                        <input type="text" name="productOrigin" value="">
                               </div>
                               <div style="padding-left: 58px;"> 
                                   <label><a style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품상세이미지</label>
                                        <input type="file" name="productContentImage" value="">
                               </div>
                               <div style="padding-left: 109px;"> 
                                   <label>상품옵션2</label>
                                        <input type="text" name="option1" value="">
                               </div>
                               <div style="padding-left: 109px;"> 
                                   <label>상품옵션2</label>
                                        <input type="text" name="option2" value="">
                               </div>
							</form>
							
							
						</div>
					</section>
				</div>
				<div class="container">
					<section class="Easy-sgin-in-wrap4">
						<ul class="sign-button-list4">
							<li><button onclick="new_Product()"
									style="background-color: #212529; color: white;">
									<i class="sgin-up"></i><span>등록</span>
								</button></li>
							<li><button  onclick="location.href='${contextPath}/product/admin_listProduct.do'"
									style="background-color: #212529; color: white;">
									<i class="btn-Non Order Inquiry"></i><span>취소</span>
								</button></li>
							
						</ul>
					</section>
				</div>
			</section>
		</div>
	</section>


</body>
</html>








