<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<<<<<<< HEAD
<script>
	src = "http://code.jquery.com/jquery-1.6.4.min.js"
</script>
=======
<script> src="http://code.jquery.com/jquery-1.6.4.min.js"</script>
>>>>>>> branch 'master' of https://github.com/jihunnn/project.git
<script type="text/javascript">
<<<<<<< HEAD
	$(function() {
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
=======
>>>>>>> branch 'master' of https://github.com/jihunnn/project.git

<<<<<<< HEAD
		$("input[name='allCheck']").click(function() {
			var chk_listArr = $("input[name='RowCheck']");
			for (var i = 0; i < chk_listArr.length; i++) {
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function() {
			if ($("input[name='RowCheck']:checked").length == rowCnt) {
				$("input[name='allCheck']")[0].checked = true;
			} else {
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	function deleteValue() {
		var url = "removeFavoriteProduct.do"; //Controller로 보내고자 하는 url
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) {//선택되어 있으면 배열에 값을 저장
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 상품이 없습니다.");
		} else {
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url : "removeFavoriteProduct.do", //전송 URL
				type : 'POST',
				traditional : true,
				data : {
					valueArr : valueArr
				//보내고자 하는 data 변수 설정
				},
				success : function(jdata) {
					if (jdata = 1) {
						alert("상품을 삭제하셨습니다.");
						location.replace("mypage_08.do"); //mypage_08로 페이지 새로고침
					} else {
						alert("상품삭제에 실패하셨습니다.");
					}
				}

			});
		}
	}
=======
	$(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for(var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length==rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	function deleteValue(){
		var url="removeFavoriteProduct.do"; //Controller로 보내고자 하는 url
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for(var i = 0; i < list.length; i++){
			if(list[i].checked){//선택되어 있으면 배열에 값을 저장
					valueArr.push(list[i].value);
				}
			}
			if(valueArr.length == 0){
				alert("선택된 상품이 없습니다.");
			}else{
				var chk = confirm("정말 삭제하시겠습니까?");
				$.ajax({
					url : "removeFavoriteProduct.do", //전송 URL
					type: 'POST',
					traditional : true,
					data : {
						valueArr : valueArr   //보내고자 하는 data 변수 설정
					},
					success: function(jdata){
						if(jdata = 1){
							alert("상품을 삭제하셨습니다.");
							location.replace("mypage_08.do"); //mypage_08로 페이지 새로고침
						}else{
							alert("상품삭제에 실패하셨습니다.");
						}	
					}

				});
			}
	}
		
		
	
	
	
>>>>>>> branch 'master' of https://github.com/jihunnn/project.git
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
	padding-right: 20px;
	font-size: 10px;
}

.my_row {
	flex-direction: row;
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
	padding-top: 50px;
	align-items: center;
	width: 700px;
	height: 100px;
}

#MyPage_top1 {
	padding-top: 50px;
	align-items: center;
	padding-left: 330px;
	width: 700px;
	height: 100px;
}

#MyPage_top2 {
	padding-top: 50px;
	align-items: center;
	padding-left: 200px;
	width: 700px;
	height: 100px;
}

.PASSWORD_confirm_text {
	position: relative;
	left: 15px;
}

#MyPage_top3 {
	align-items: center;
	padding-left: 300px;
	width: 700px;
	height: 100px;
}

.btn_PASSWORD_confirm {
	position: relative;
	font-size: 15px;
	width: 80px;
}

.btn_main_back {
	position: relative;
	left: 14px;
	font-size: 15px;
	width: 80px;
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
<title>관심목록창</title>
<body>

	<!-- 타이틀 -->
	<section class="ftco-section"
		style="padding-top: 50px; margin-bottom: 50px; padding-bottom: 0px;">
		<div class="container">
<<<<<<< HEAD
=======
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">관심목록</h2>
				</div>
			</div>
>>>>>>> branch 'master' of https://github.com/jihunnn/project.git
			<!-- 타이틀 끝 -->
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






			<!-- 내용 -->


			<div class="order_list">
				<div style="font-size: 25px; font-weight: bold; margin-bottom:20px; ">
					<a style="color: #7e9c8c; ">관심상품</a>
				</div>
				<div class="container" style="padding-left: 0px;">
<<<<<<< HEAD
					<input type="checkBox" class="btn-secondary btn-xs " id="allCheck"
						name="allCheck"
						style="width: 17px; height: 17px; vertical-align: middle; margin-right: 2px; margin-bottom:3px;"><a>전체선택</a>
=======
					<input type="checkBox" class="btn-secondary btn-xs " id="allCheck" name="allCheck" style="width: 25px;height: 20px;" ><a>전체선택</a>
>>>>>>> branch 'master' of https://github.com/jihunnn/project.git
				</div>
				<br>
				<table class="table" style="width: 1400px; font-size:14px; ">
					<thead class="table-dark" align=center>
						<tr align="center"
							style="background-color: #eeeeee; border-top:1px solid #7e9c8c; border-bottom: 1px solid #c6c8ca; font-size:15px; color:black;">
							<td scope="col" width="100">선택</td>
							<td scope="col" width="150"></td>
							<td scope="col" width="500" style="padding-right: 200px;">상품</td>
							<td scope="col" width="120">금액</td>

						</tr>
					</thead>
					<tbody>
<<<<<<< HEAD
						<c:choose>
							<c:when test="${empty favoriteMap.myFavoriteList}">
								<tr height="200">
									<td colspan="5"
										style="background-color: white; padding-top: 100px;">
										<p align="center">
											<b><span style="color: black;">관심상품이 없습니다.</sapn></b>
										</p>
									</td>
								</tr>
							</c:when>
							<c:when test="${!empty favoriteMap.myFavoriteList }">
								<c:forEach var="item" items="${favoriteMap.myProductList}">
									<tr style="border-bottom: 1px solid #c6c8ca;">
										<td scope="col" align=center><br> <br> <input
											type="checkbox" name="RowCheck" style="width:17px; height:17px; border:1px solid black; border-radius:1px;"
											value="${item.productNum}"></td>
										<td scope="col"><img class="block-20"
											style="width: 130px; height: 130px;"
											src="${contextPath}/download_product.do?productNum=${item.productNum}&productImage=${item.productImage}"
											id="preview" /></td>
										<td scope="col" >
											<br> <a
											href="${contextPath}/product/viewProduct.do?productNum=${item.productNum}">${item.productName}</a></td>
										<td scope="col" align=center><br> <br> <fmt:formatNumber
												pattern="###,###,###" value="${item.productPrice}" /><br></td>

									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
=======
					<c:choose>
						<c:when test="${empty favoriteMap.myFavoriteList}">
						<tr height="200">
							<td colspan="5" style="background-color:white; padding-top:100px;">
								<p align="center">
									<b><span style="color:black; ">관심상품이 없습니다.</sapn></b>
								</p>
							</td>
						</tr>	
					</c:when>
					<c:when test="${!empty favoriteMap.myFavoriteList }">
					<c:forEach var="item" items="${favoriteMap.myProductList}">
						<tr>
							<td scope="col" align=center><br> <br> 
							<input type="checkbox" name="RowCheck" style="zoom: 2.0;"  value="${item.productNum}"></td>
							<td scope="col"> 
							<img  class="block-20" style="width: 130px; height:130px;"src="${contextPath}/download_product.do?productNum=${item.productNum}&productImage=${item.productImage}" id="preview" /></td>
							<td scope="col" style="padding-left: 230px;"><br>
								<br> <br><a href="${contextPath}/product/viewProduct.do?productNum=${item.productNum}">${item.productName}</a></td>
							<td scope="col" align=center ><br> <br><fmt:formatNumber pattern="###,###,###" value="${item.productPrice}"/><br></td>

						</tr>
                     </c:forEach>
                     </c:when>
                     </c:choose>
>>>>>>> branch 'master' of https://github.com/jihunnn/project.git

					</tbody>
<<<<<<< HEAD

=======
				
>>>>>>> branch 'master' of https://github.com/jihunnn/project.git
				</table>
<<<<<<< HEAD

=======
				
>>>>>>> branch 'master' of https://github.com/jihunnn/project.git
				<div class="container"
					style="padding-left: 1180px; padding-right: 0px; margin-bottom: 150px;">
<<<<<<< HEAD
					<input type="button" style="float: right; margin-top: 25px; border-radius: 2px;  background-color: #7e9c8c; color: white; border:none; border-radius: 2px; width: 120px; height: 40px; padding-top:10px; font-size:14px;"
						onclick="deleteValue();" value="선택삭제">
=======
					 <input type="button" class="btn-secondary btn-xs" onclick="deleteValue();" value="선택삭제">
>>>>>>> branch 'master' of https://github.com/jihunnn/project.git

				</div>
			</div>
		</div>
	</section>
</body>
</html>