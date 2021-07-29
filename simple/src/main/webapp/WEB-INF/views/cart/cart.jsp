<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.simple.cart.vo.CartVO"%>



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

	//회원장바구니 선택삭제
	function deleteValue01() {
		var url = "delete.do"
		var valueArr = new Array();
		var list = $("input[name='chk']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { //선택되어 있으면 배열에 값을 저장한다.
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 상품이 없습니다.");
		} else {
			if (confirm('선택한 상품을 삭제하시겠습니까?')) {
				$.ajax({
					url : url, //전송 URL
					type : 'POST', //POST방식
					traditional : true,
					data : {
						valueArr : valueArr
					//보내고자 하는 data 변수 설정
					},
					success : function(jdata) {
						if (jdata = 1) {
							alert("상품이 삭제 되었습니다.");
							location.replace("memcart.do") //list 로 페이지 새로고침
						} else {
							alert("오류 발생");
						}
					}
				});
			} else {
				return false;
			}
		}
	}

	//비회원 장바구니 선택삭제
	function deleteValue02() {
		var url = "delete.do"
		var valueArr = new Array();
		var list = $("input[name='chk']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { //선택되어 있으면 배열에 값을 저장한다.
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 상품이 없습니다.");
		} else {
			if (confirm('선택한 상품을 삭제하시겠습니까?')) {
				$.ajax({
					url : url, //전송 URL
					type : 'POST', //POST방식
					traditional : true,
					data : {
						valueArr : valueArr
					//보내고자 하는 data 변수 설정
					},
					success : function(jdata) {
						if (jdata = 1) {
							alert("상품이 삭제 되었습니다.");
							location.replace("nonmemcart.do") //list 로 페이지 새로고침
						} else {
							alert("오류 발생");
						}
					}
				});
			} else {
				return false;
			}
		}
	}

	//회원구매
	function memberbuy() {
		var url = "order.do"
		var totalPrice = $("#totalPrice").val();
		var valueArr = new Array();
		var list = $("input[name='chk']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { //선택되어 있으면 배열에 값을 저장한다.
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 상품이 없습니다.");
		} else {
			if (confirm('주문 하시겠습니까?')) {
				$.ajax({
					url : url, //전송 URL
					type : 'POST', //POST방식
					traditional : true,
					data : {
						valueArr : valueArr, totalPrice : totalPrice
					//보내고자 하는 data 변수 설정
					},
					success : function(jdata) {
						if (jdata = 1) {
							location.replace("order_01.do") //list 로 페이지 새로고침
						} else {
							alert("오류 발생");
						}
					}
				});
			} else {
				return false;
			}
		}
	}

	//비회원구매
	function nonmemberbuy() {
		var url = "order.do"
		var totalPrice = $("#totalPrice").val();
		var valueArr = new Array();
		var list = $("input[name='chk']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { //선택되어 있으면 배열에 값을 저장한다.
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 상품이 없습니다.");
		} else {
			if (confirm('주문 하시겠습니까?')) {
				$.ajax({
					url : url, //전송 URL
					type : 'POST', //POST방식
					traditional : true,
					data : {
						valueArr : valueArr, totalPrice : totalPrice
					//보내고자 하는 data 변수 설정
					},
					success : function(jdata) {
						if (jdata = 1) {
							location.replace("nonorder_01.do") //list 로 페이지 새로고침
						} else {
							alert("오류 발생");
						}
					}

				});
			} else {
				return false;
			}
		}
	}
</script>



</head>
<title>주문결제창</title>
<body>





	<!-- 장바구니 타이틀 -->
	<section class="ftco-section" style="padding-top: 100px;">
		<div class="container">

			<c:choose>
				<c:when test="${isLogOn == true && member != null}">
					<div
						style="font-size: 25px; font-weight: bold; margin-bottom: 20px;">
						<a style="color: #7e9c8c;">장바구니</a>
						<button type="button" onclick="deleteValue01();"
							style="float: right; border-radius: 2px; margin-bottom: 3px; margin-top: 15px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;"
							class="btn-secondary btn-xs">선택삭제</button>
						<button type="button" onclick="checkAll()"
							class="btn-secondary btn-xs"
							style="float: right; border-radius: 2px; margin-bottom: 3px; margin-top: 15px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">전체선택</button>

					</div>
				</c:when>
				<c:otherwise>
					<div
						style="font-size: 25px; font-weight: bold; margin-bottom: 20px;">
						<a style="color: #7e9c8c;">장바구니</a>
						<button type="button" onclick="deleteValue02();"
							style="float: right; border-radius: 2px; margin-bottom: 3px; margin-top: 15px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;"
							class="btn-secondary btn-xs">선택삭제</button>
						<button type="button" onclick="checkAll()"
							class="btn-secondary btn-xs"
							style="float: right; border-radius: 2px; margin-bottom: 3px; margin-top: 15px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">전체선택</button>

					</div>

				</c:otherwise>
			</c:choose>



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


				<c:choose>
					<c:when test="${isLogOn == true && member != null}">
						<table class="table" style="margin-top: 0px; font-size: 14px;">
							<thead class="table-dark" align=center>
								<tr align="center"
									style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #c6c8ca; font-size: 15px; color: black;">
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

									<tr class="tr1" align="center"
									style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
										<th scope="col"style="vertical-align: middle; align:center;"><input
											type="checkbox" name="chk" value="${cartlist.memCartId}"></th>
										<td scope="col"><img
											src="${contextPath}/resources/images/bed.jpg" width=80
											height=80></td>
										<td scope="col" align=left style="padding-top: 25px;">${cartlist.productName}<br>${cartlist.option1name}
											: ${cartlist.option1value} <br>${cartlist.option2name} :
											${cartlist.option2value}
										</td>
										<td scope="col" align=center> <select
											name="number"
											style="height: 25px; border: 1px solid #dcdcdc;">
												<option value="1개">1개</option>
												<option value="2개">2개</option>
												<option value="3개">3개</option>
												<option value="4개">4개</option>
												<option value="5개">5개</option>
										</select></td>
										<td scope="col" align=center>${cartlist.deliverycharge}</td>
										<td scope="col" align=center>${cartlist.productPrice}</td>
									</tr>

								</tbody>
							</c:forEach>
							<tfoot>
								<tr>

									<td></td>
									<td></td>
									<td></td>
									<td colspan="3" align=right
										style="font-size: 18px; color: #7e9c8c; font-weight: bold;">총
										금액 : <input type="hidden" value="3000000" id="totalPrice"/>3,000,000원</td>
								</tr>
							</tfoot>
						</table>
						<div></div>
						<br>
						<br>
						<br>
						<div class="container" style="padding-left: 450px;">
							<button type="button" onclick="memberbuy()" class="btn btn-dark "
								id="buttonmy"
								style="padding-left: 10px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px; font-size: 14px; margin-left: 40px;">선택상품주문</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" onclick="buyall()" id="buttonmy"
								class="btn btn-dark"
								style="width: 75px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; margin-left: 20px; width: 130px; height: 45px; font-size: 14px;">전체상품주문</button>
						</div>
					</c:when>



					<c:otherwise>

						<table class="table">
							<thead class="table-dark" align=center>
								<tr align="center"
									style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
									<td scope="col" width="100">선택</td>
									<td scope="col" width="150"></td>
									<td scope="col" width="500" align=left>상품명</td>
									<td scope="col" width="80">수량</td>
									<td scope="col" width="80">배송비</td>
									<td scope="col" width="80">가격</td>
								</tr>
							</thead>
							<c:forEach items="${cartlist}" var="cartlist" varStatus="status">
								<tbody>
									<tr style="font-size: 14px; border-bottom: 1px solid #c6c8ca;">
										<td scope="col" height="100" align=center><br> <br>
											<input type="checkbox" name="chk" value="${status.index}"></td>
										<td scope="col"><img
											src="${contextPath}/resources/images/bed.jpg" width=80
											height=80></td>
										<td scope="col" align=left style="padding-top: 25px;">${cartlist.productName}<br>${cartlist.option1name}
											: ${cartlist.option1value} <br>${cartlist.option2name} :
											${cartlist.option2value}
										</td>
										<td scope="col" align=center><br> <br> <select
											name="number"
											style="height: 25px; border: 1px solid #dcdcdc;">
												<option value="1개">1개</option>
												<option value="2개">2개</option>
												<option value="3개">3개</option>
												<option value="4개">4개</option>
												<option value="5개">5개</option>
										</select></td>
										<td scope="col" align=center><br> <br>${cartlist.deliverycharge}</td>
										<td scope="col" align=center><br> <br>${cartlist.productPrice}</td>
									</tr>
								</tbody>
							</c:forEach>
							<tfoot>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td colspan="3" align=right
										style="font-size: 18px; color: #7e9c8c; font-weight: bold;"><input type="hidden" value="3000000" id="totalPrice"/>3,000,000원</td>
								</tr>
							</tfoot>
						</table>





						<br>
						<br>
						<br>
						<div class="container" style="padding-left: 450px;">
							<button type="button" onclick="nonmemberbuy()"
								class="btn btn-dark " id="buttonmy"
								style="padding-left: 10px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px; font-size: 14px; margin-left: 40px;">선택상품주문</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" onclick="nextt()" id="buttonmy"
								class="btn btn-dark"
								style="width: 75px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; margin-left: 20px; width: 130px; height: 45px; font-size: 14px;">전체상품주문</button>
						</div>
					</c:otherwise>
				</c:choose>



			</div>
		</div>
	</section>
</body>
</html>














