<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script>
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



	function checkAll() {

		if ($("input:checkbox[name='chk']").is(":checked") == false) {
			//chk 체크박스가 체크되어습니다.
			$("input[name='chk']").prop('checked', true); //전체선택
		} else {
			//chk 체크박스가 체크되어 있지 않습니다.
			$("input:checkbox[name='chk']").prop("checked", false) //체크해제
		}
	}
	
	function deleteValue(){
	
	var url = "delete.do"
	var valueArr = new Array();
	var list = $("input[name='chk']");
	for(var i = 0; i<list.length; i++){
		if(list[i].checked){ //선택되어 있으면 배열에 값을 저장한다.
			valueArr.push(list[i].value);
		}
	}
	
		if(valueArr.length == 0){
			alert("선택된 글이 없습니다.");
		}
		else{
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url : url,		//전송 URL
				type : 'POST',	//POST방식
				traditional : true,
				data : {
					valueArr : valueArr  //보내고자 하는 data 변수 설정
				},
				success:function(jdata){
					if(jdata = 1) {
						alert("삭제성공");
						location.replace("memcart.do") //list 로 페이지 새로고침
					}
					else{
						alert("삭제 실패");
					}
				}
			});
		}	
	}
</script>


</head>
<title>주문결제창</title>
<body>


	<!-- 장바구니 타이틀 -->
	<section class="ftco-section" style="padding-top: 60px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<c:choose>
						<c:when test="${isLogOn == true && member != null}">
							<h2 class="mb-4" style="font-size: 35px; padding-top: 14px;">회원
								장바구니</h2>
						</c:when>
						<c:otherwise>
							<h2 class="mb-4" style="font-size: 35px; padding-top: 14px;">비회원
								장바구니</h2>
						</c:otherwise>
					</c:choose>
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
					<button type="button" onclick="checkAll()"
						class="btn-secondary btn-xs">전체선택</button>
				</div>
				<br>
				
				
			
				<c:choose>
					<c:when test="${isLogOn == true && member != null}">
						<table class="table">
							<thead class="table-dark" align=center>
								<tr align="center">
									<td scope="col" width="100">선택</td>
									<td scope="col" width="150"></td>
									<td scope="col" width="500" align=left>상품명</td>
									<td scope="col" width="80">수량</td>
									<td scope="col" width="80">배송비</td>
									<td scope="col" width="80">가격</td>
								</tr>
							</thead>
						
							<tbody>
							<c:forEach items="${cartlist}" var="cartlist">
								<tr>
									<td scope="col" height="100" align=center><br> <br>
										<input type="checkbox" name="chk" value="${cartlist.memCartId}"></td>
									<td scope="col"><img
										src="${contextPath}/resources/images/sofa01.jpg" width=130
										height=130></td>
									<td scope="col" align=left>${cartlist.productName}<br>${cartlist.option1name} : ${cartlist.option1value} <br>${cartlist.option2name} : ${cartlist.option2value} </td>
									<td scope="col" align=center><br> <br> <select
										name="number" style="height: 25px;">
											<option value="1개">1개</option>
											<option value="2개">2개</option>
											<option value="3개">3개</option>
											<option value="4개">4개</option>
											<option value="5개">5개</option>
									</select></td>
									<td scope="col" align=center><br> <br>${cartlist.deliverycharge}</td>
									<td scope="col" align=center><br> <br>${cartlist.totalPrice}</td>
								</tr>
							</c:forEach>
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
					</c:when>


					
					
					
					<c:otherwise>		
						<table class="table">
							<thead class="table-dark" align=center>
								<tr align="center">
									<td scope="col" width="100">선택</td>
									<td scope="col" width="150"></td>
									<td scope="col" width="500" align=left>상품명</td>
									<td scope="col" width="80">수량</td>
									<td scope="col" width="80">배송비</td>
									<td scope="col" width="80">가격</td>
								</tr>
							</thead>
							<c:forEach items="${cartlist}" var="cartlist">
							<tbody>
								<tr>
									<td scope="col" height="100" align=center><br> <br>
										<input type="checkbox" name="chk" value="1" style="zoom: 2.0;"></td>
									<td scope="col"><img
										src="${contextPath}/resources/images/sofa01.jpg" width=130
										height=130></td>
									<td scope="col" align=left>${cartlist.productName}<br>${cartlist.option1name} : ${cartlist.option1value} <br>${cartlist.option2name} : ${cartlist.option2value} </td>
									<td scope="col" align=center><br> <br> <select
										name="number" style="height: 25px;">
											<option value="1개">1개</option>
											<option value="2개">2개</option>
											<option value="3개">3개</option>
											<option value="4개">4개</option>
											<option value="5개">5개</option>
									</select></td>
									<td scope="col" align=center><br> <br>${cartlist.deliverycharge}</td>
									<td scope="col" align=center><br> <br>${cartlist.totalPrice}</td>
								</tr>
							</tbody>
							</c:forEach>
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

					</c:otherwise>
				</c:choose>


				<div>
					<div class="container"
						style="padding-left: 1000px; paddig-right: 0px !important; float: left; width: 1180px; margin-left: 85px;">
						<button type="button" onclick="deleteValue();" class="btn-secondary btn-xs">선택삭제</button>

					</div>
				</div>
				<br> <br> <br>
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














