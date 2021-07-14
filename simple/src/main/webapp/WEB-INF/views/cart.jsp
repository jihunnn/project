<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
	function next() {
		if (confirm("선택상품을 주문하시겠습니까?")) {
			location.replace('order_01.jsp');
		} else {

		}
	}

	function nextt() {
		if (confirm("전체상품을 주문하시겠습니까?")) {
			submit.replace('order_01.jsp');
		} else {

		}
	}
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
		var url="removeCartProduct.do"; //Controller로 보내고자 하는 url
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
					url : "removeCartProduct.do", //전송 URL
					type: 'POST',
					traditional : true,
					data : {
						valueArr : valueArr   //보내고자 하는 data 변수 설정
					},
					success: function(jdata){
						if(jdata = 1){
							alert("상품을 삭제하셨습니다.");
							location.replace("myCartList.do"); //myCartList로 페이지 새로고침
						}else{
							alert("상품삭제에 실패하셨습니다.");
						}	
					}

				});
			}
	}
</script>
</head>
<title>장바구니창</title>
<body>

	<!-- 장바구니 타이틀 -->
	<section class="ftco-section" style="padding-top: 60px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; padding-top: 14px;">장바구니</h2>
				</div>
			</div>

			<!-- 장바구니타이틀끝 -->


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
			<!-- 최근본상품끝 -->

			<!-- 내용 -->

			<div class="order_list">
				<div class="container" style="padding-left: 0px;">
					<input type="checkBox" class="btn-secondary btn-xs " id="allCheck" name="allCheck" style="width: 25px;height: 20px;" ><a>전체선택</a>
				</div>
				<br>
				<table class="table">
					<thead class="table-dark" align=center>
						<tr align="center">
							<td scope="col" width="100">선택</td>
							<td scope="col" width="150"></td>
							<td scope="col" width="500" align=left>상품명</td>
							<td scope="col" width="80">수량</td>
							<td scope="col" width="80">배송비</td>
							<td scope="col" width="80">금액</td>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${empty cartMap.myCartList}">
						<tr height="200">
							<td colspan="5" style="background-color:white; padding-top:100px;">
								<p align="center">
									<b><span style="color:black; ">관심상품이 없습니다.</sapn></b>
								</p>
							</td>
						</tr>	
						</c:when>
						<c:when test="${!empty cartMap.myCartList }">
						<c:forEach var="item" items="${cartMap.myProductList}">
						<tr>
							<td scope="col" height="100" align=center><br>
							<br>
							<input type="checkbox" name="RowCheck" style="zoom: 2.0;"  value="${item.productNum}"></td>
							<td scope="col">
							<img  class="block-20" style="width: 130px; height:130px;"src="${contextPath}/download_product.do?productNum=${item.productNum}&productImage=${item.productImage}" id="preview" /></td>
							<td scope="col"><br>
								<br> <br><a href="${contextPath}/product/viewProduct.do?productNum=${item.productNum}">${item.productName}</a></td>
							<td scope="col" align=center><br>
							<br>
							<select name="number" style="height: 25px;">
									<option value="1개">1개</option>
									<option value="2개">2개</option>
									<option value="3개">3개</option>
									<option value="4개">4개</option>
									<option value="5개">5개</option>
							</select></td>
							<td scope="col" align=center><br>
							<br>무료배송</td>
							<td scope="col" align=center ><br> <br><fmt:formatNumber pattern="###,###,###" value="${item.productPrice}"/><br></td>
						</tr>
						</c:forEach>
						</c:when>
						</c:choose>
					</tbody>
					<tfoot>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td colspan="3" align=right style="padding-right: 20px;">총
								금액 : 680,000원</td>
						</tr>
					</tfoot>
				</table>
				<div>
					<div class="container"
						style="padding-left: 1000px; paddig-right: 0px !important; float: left; width: 1180px; margin-left: 85px;">
						<input type="button" class="btn-secondary btn-xs" onclick="deleteValue();" value="선택삭제">
						<button type="button" onclick="" class="btn-secondary btn-xs">전체삭제</button>

					</div>
				</div>
				<br>
				<br>
				<br>
				<div class="container" style="padding-left: 450px;">
					<button type="button" onclick="next()" class="btn btn-dark "
						id="buttonmy" style="margin-left: 90px; width: 120px;">선택상품주문</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="nextt()" id="buttonmy"
						class="btn btn-dark" style="margin-left: 20px; width: 120px;">전체상품주문</button>
				</div>
			</div>
		</div>
	</section>
</body>
</html>














