<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>







<style type="text/css">
.table-light {
	background: #F7F7F7;
}

.table {
	table-border: 2px;
}

h4 {
	margin-top: 60px;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	//주문자
	function Check_Order() {
		var form = document.CheckOrder;

		if (form.user_name.value == "") {
			alert("주문자정보의 이름을 입력하지 않았습니다.")
			form.user_name.focus();
			return false;
		}

		if (form.address1.value == "") {
			alert("주문자정보의 주소를 입력하지 않았습니다.")
			form.address1.focus();
			return false;
		}
		if (form.phone1.value == "") {
			alert("주문자정보의 연락처를 입력하지 않았습니다.")
			form.phone1.focus();
			return false;
		}


		if (form.phone2.value == "") {
			alert("주문자정보의 연락처를 입력하지 않았습니다.")
			form.phone2.focus();
			return false;
		}

		for (var i = 0; i < form.phone2.value.length; i++) {
			ch = form.phone2.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("주문자정보의 연락처는 숫자만 입력가능합니다.")
				form.phone2.focus();
				form.phone2.select();
				return false;
			}
		}
		if (form.phone3.value == "") {
			alert("주문자정보의 연락처를 입력하지 않았습니다.")
			form.phone3.focus();
			return false;
		}
		for (var i = 0; i < form.phone3.value.length; i++) {
			ch = form.phone3.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("주문자정보의 연락처는 숫자만 입력가능합니다.")
				form.phone3.focus();
				form.phone3.select();
				return false;
			}
		}
		if (form.user_SpName.value == "") {
			alert("배송정보의 이름을 입력하지 않았습니다.")
			form.user_Spname.focus();
			return false;
		}

		if (form.address1_1.value == "") {
			alert("배송정보의 주소를 입력하지 않았습니다.")
			form.addr1.focus();
			return false;
		}
		if (form.phone1_Sp.value == "") {
			alert("배송정보의 연락처1을 입력하지 않았습니다.")
			form.phone1_Sp.focus();
			return false;
		}
		if (form.phone2_Sp.value == "") {
			alert("배송정보의 연락처1을 입력하지 않았습니다.")
			form.phone2_Sp.focus();
			return false;
		}

		for (var i = 0; i < form.phone2_Sp.value.length; i++) {
			ch = form.phone2_Sp.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("배송정보의 연락처1은 숫자만 입력가능합니다.")
				form.phone2_Sp.focus();
				form.phone2_Sp.select();
				return false;
			}
		}
		if (form.phone3_Sp.value == "") {
			alert("배송정보의 연락처1을 입력하지 않았습니다.")
			form.phone3_Sp.focus();
			return false;
		}
		for (var i = 0; i < form.phone3_Sp.value.length; i++) {
			ch = form.phone3_Sp.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("배송정보의 연락처1은 숫자만 입력가능합니다.")
				form.phone3_Sp.focus();
				form.phone3_Sp.select();
				return false;
			}
		}

		
		form.submit();

	}

</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //주문자 우편번호
    function sample6_execDaumPostcode() {
        new daum.Postcode(
                {
                    oncomplete : function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var fullAddr = ''; // 최종 주소 변수
                        var extraAddr = ''; // 조합형 주소 변수
 
                        // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            fullAddr = data.roadAddress;
 
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            fullAddr = data.jibunAddress;
                        }
 
                        // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                        if (data.userSelectedType === 'R') {
                            //법정동명이 있을 경우 추가한다.
                            if (data.bname !== '') {
                                extraAddr += data.bname;
                            }
                            // 건물명이 있을 경우 추가한다.
                            if (data.buildingName !== '') {
                                extraAddr += (extraAddr !== '' ? ', '
                                        + data.buildingName : data.buildingName);
                            }
                            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                            fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                                    + ')' : '');
                        }
 
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                        document.getElementById('sample6_address').value = fullAddr;
 
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById('sample6_address2').focus();
                    }
                }).open();
    }
    //배송지 우편번호
    function sample6_execDaumPostcode1() {
        new daum.Postcode(
                {
                    oncomplete : function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var fullAddr = ''; // 최종 주소 변수
                        var extraAddr = ''; // 조합형 주소 변수
 
                        // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            fullAddr = data.roadAddress;
 
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            fullAddr = data.jibunAddress;
                        }
 
                        // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                        if (data.userSelectedType === 'R') {
                            //법정동명이 있을 경우 추가한다.
                            if (data.bname !== '') {
                                extraAddr += data.bname;
                            }
                            // 건물명이 있을 경우 추가한다.
                            if (data.buildingName !== '') {
                                extraAddr += (extraAddr !== '' ? ', '
                                        + data.buildingName : data.buildingName);
                            }
                            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                            fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                                    + ')' : '');
                        }
 
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample6_postcode1').value = data.zonecode; //5자리 새우편번호 사용
                        document.getElementById('sample6_address_1').value = fullAddr;
 
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById('sample6_address2_1').focus();
                    }
                }).open();
    }
</script>
</head>
<title>주문결제창</title>
<body>

	<!-- 타이틀 -->
	<section class="ftco-section" style="padding-top: 50px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">주문결제</h2>
				</div>
			</div>
			<!-- 타이틀 끝 -->


			
			<h4>주문리스트</h4>



			<!-- 최근 본 상품 -->
			<div id="recentlyProduct"
				style="position: absolute; width: 120px; height: 310px; margin-left: 1370px; border: 1px solid #d2d2d2; margin-top: 0px;">
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


         <form name="CheckOrder" action="order_03.jsp" method="post">
			<div class="order_list text-center">
				<table class="table">

					<thead class="table-dark">
						<tr>
							<th scope="col">제품</th>
							<th scope="col">수량</th>
							<th scope="col">가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="col">커스틴 천연면피 통가죽 4인 카우치형 소파</th>
							<th scope="col">1개</th>
							<th scope="col">3,740,000</th>
						</tr>
						<tr>
							<th scope="col">커스틴 천연면피 통가죽 4인 카우치형 소파</th>
							<th scope="col">1개</th>
							<th scope="col">3,740,000</th>
						</tr>
					</tbody>
				</table>
			</div>


			<h4>주문자정보</h4>
			<div class="order_list">
				<table class="table">
					<colgroup>
						<col width="20%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="col" style="padding-left: 40px"><a style="color: red; padding-right: 5px; write-space:nowrap;">*</a>이름</th>
							<th scope="col"><input type="text" name="user_name"></th>
						</tr>
						<tr>
							<th scope="col" style="padding-left: 40px"><br><a style="color: red; padding-right: 5px; write-space:nowrap;">*</a>주소</th>
							<th scope="col"><input type="text" name="zipcode" id="sample6_postcode" readonly>&nbsp;&nbsp;&nbsp;
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
								<p>
									<br> <input type="text" name="address1" id="sample6_address" readonly style="width: 325px">
									
								</p>
								<p>
									<input type="text" name="address2" id="sample6_address2" style="width: 325px">
									
								</p>
								</th>
						</tr>
						<tr>
							<th scope="col" style="padding-left: 40px"><a style="color: red; padding-right: 5px; write-space:nowrap;">*</a>연락처</th>
							<th scope="col"><select name="phone1" id="txtMobile1" style="width: 80px; height:33px">
									<option value="">선택</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
									<option value="010">010</option>
							</select> - <input type="text" name="phone2" style="width: 80px"> - <input
								type="text" name="phone3" style="width: 80px"></th>
						</tr>
					</tbody>
				</table>
			</div>

			<h4>배송정보</h4>
			<a>주문자 정보와 동일</a><input type="checkbox" value="on">
			<div class="order_list">
				<table class="table">
					<colgroup>
						<col width="20%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="col" style="padding-left: 40px"><a style="color: red; padding-right: 5px; write-space:nowrap;">*</a>이름</th>
							<th scope="col"><input type="text" name="user_SpName" ></th>
						</tr>
						<tr>
							<th scope="col" style="padding-left: 40px"><br><a style="color: red; padding-right: 5px; write-space:nowrap;">*</a>주소</th>
							<th scope="col"><input type="text" name="zipcode1" id="sample6_postcode1" readonly>&nbsp;&nbsp;&nbsp;
							<input type="button" onclick="sample6_execDaumPostcode1()" value="우편번호 찾기">
								<p>
									<br> <input type="text" name="address1_1" id="sample6_address_1" readonly style="width: 325px">
									
								</p>
								<p>
									<input type="text" name="address2_1" id="sample6_address2_1" style="width: 325px">
									
								</p>
							</th>
                        </tr>
						<tr>
							<th scope="col" style="padding-left: 40px"><a style="color: red; padding-right: 5px; write-space:nowrap;">*</a>연락처1</th>
							<th scope="col"><select  name="phone1_Sp" id="txtMobile1" style="width: 80px; height:33px">
									<option value="">선택</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
									<option value="010">010</option>
							</select> - <input type="text" name="phone2_Sp"style="width: 80px"> - <input
								type="text" name="phone3_Sp" style="width: 80px"></th>
						</tr>
						<tr>
							<th scope="col" style="padding-left: 40px">연락처2</th>
							<th scope="col"><select id="txtMobile1" name="phone1_Sp1"style="width: 80px; height:33px">
									<option value="">선택</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
									<option value="010">010</option>
							</select> - <input type="text" name="phone2_Sp1"style="width: 80px"> - <input
								type="text" name="phone3_Sp1" style="width: 80px"></th>
						</tr>
						<tr>
						<th scope="col" style="padding-left: 40px; padding-bottom: 50px;"><br>주문메세지<br>(100자내외)</th>
						<th scope="col"><textarea name="textarea" rows="4" cols="40"></textarea></th>
						</tr>
						<tr>
							<th scope="col">무통장 입금자명</th>
							<th scope="col"><input type="text"> (주문자와 같을 경우 생략 가능)</th>
					    </tr>
					</tbody>
				</table>
			</div>

			<h4>결제정보</h4>
			<div class="order_list">
				<table class="table">
					<colgroup>
						<col width="20%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="col" style="padding-left: 40px"><a style="color: red; padding-right: 5px; write-space:nowrap;">*</a>결제방법</th>
							<th scope="col"><input type="radio" name="chk_info"
								value="HTML">신용/체크카드&nbsp;&nbsp;&nbsp; <input
								type="radio" name="chk_info" value="mutongjang">무통장입금&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_info" value="cellphone">휴대폰결제</th>
						</tr>
						<tr>
							<th scope="col" style="padding-left: 40px">카드선택</th>
							<th scope="col"><select id="month" style="width: 130px; height:33px">
									<option value="현대카드">현대카드</option>
									<option value="kukmin">국민카드</option>
									<option value="nonghyep">농협카드</option>
									<option value="bc">BC카드</option>
									<option value="woori">우리카드</option>
									<option value="shinhan">신한카드</option></th>

						</tr>
						
					</tbody>
				</table>
			</div>
			<br> <br>
		</form>
			<div style="text-align: center">
				<button type="button" class="btn btn-secondary" onclick="Check_Order()">결제하기</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-secondary"onclick="location.href='/cart'">취소하기</button>
			</div>
			<br> <br>
		</div>
	</section>

</body>
</html>









