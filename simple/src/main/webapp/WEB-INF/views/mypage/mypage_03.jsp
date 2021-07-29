<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.lang.String.*"%>
<%@ page import="com.project.simple.member.vo.MemberVO"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

<script type="text/javascript">
<!--폼 입력 유효성 검사-->
	function Check_Join() {
		var form = document.Checkmodify;

		if (form.memName.value == "") {
			alert("이름을 입력하지 않았습니다.")
			form.memName.focus();
			return false;
		}

		if (form.memName.value.length < 2) {
			alert("이름을 2자 이상 입력해주십시오.")
			document.form.memName.focus();
			return false;
		}

		//아이디 입력여부 검사
		if (form.memId.value == "") {
			alert("아이디를 입력해주세요!")
			form.memId.focus();
			return false;
		}
		//아이디 유효성 검사 (영문소문자, 숫자만 허용)
		for (var i = 0; i < form.memId.value.length; i++) {
			ch = form.memId.value.charAt(i)
			if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')
					&& !(ch >= 'A' && ch <= 'Z')) {
				alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
				form.memId.focus();
				form.memId.select();
				return false;
			}
		}

		//아이디에 공백 사용하지 않기
		if (form.memId.value.indexOf(" ") >= 0) {
			alert("아이디에 공백을 사용할 수 없습니다.")
			form.memId.focus();
			form.memId.select();
			return false;
		}
		//아이디 길이 체크 (4~12자)
		if (form.memId.value.length<4 || form.memId.value.length>12) {
			alert("아이디를 4~12자까지 입력해주세요.")
			form.memId.focus();
			form.memId.select();
			return false;
		}

		//비밀번호 입력여부 체크
		if (form.memPwd.value == "") {
			alert("비밀번호를 입력하지 않았습니다.")
			form.memPwd.focus();
			return false;

		}
		if (form.memPwd.value == form.memId.value) {
			alert("아이디와 비밀번호가 같습니다.")
			form.memPwd.focus();
			return false;
		}
		//비밀번호 길이 체크(10자이상 허용)
		if (form.memPwd.value.length < 9) {
			alert("비밀번호를 10자이상 입력해주세요.")
			form.memPwd.focus();
			form.memPwd.select();
			return false;
		}
		//비밀번호 유효성 검사 (영문소문자, 숫자만 허용)
		for (var i = 0; i < form.memPwd.value.length; i++) {
			ch = form.memPwd.value.charAt(i)
			if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')
					&& !(ch >= 'A' && ch <= 'Z')) {
				alert("비밀번호는 영문 대소문자, 숫자만 입력가능합니다.")
				form.memPwd.focus();
				form.memPwd.select();
				return false;
			}
		}
		//비밀번호와 비밀번호 확인 일치여부 체크
		if (form.memPwd.value != form.memPwd1.value) {
			alert("비밀번호가 일치하지 않습니다")
			form.memPwd1.value = ""
			form.memPwd1.focus();
			return false;
		}
		if (form.memEmail.value == "") {
			alert("이메일을 입력하지 않았습니다.")
			form.memEmail.focus();
			return false;
		}

		for (var i = 0; i < form.memEmail.value.length; i++) {
			chm = form.memEmail.value.charAt(i)
			if (!(chm >= '0' && chm <= '9') && !(chm >= 'a' && chm <= 'z')
					&& !(chm >= 'A' && chm <= 'Z')) {
				alert("이메일은 영문 대소문자, 숫자만 입력가능합니다.")
				form.memEmail.focus();
				form.memEmail.select();
				return false;
			}
		}
		if (form.memPhoneNum.value == "") {
			alert("핸드폰번호를 입력하지 않았습니다..")
			form.memPhoneNum.focus();
			return false;
		}

		if (form.memPhoneNum1.value == "") {
			alert("핸드폰번호를 입력하지 않았습니다.")
			form.memPhoneNum1.focus();
			return false;
		}

		for (var i = 0; i < form.memPhoneNum1.value.length; i++) {
			ch = form.memPhoneNum1.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("핸드폰번호는 숫자만 입력가능합니다.")
				form.memPhoneNum1.focus();
				form.memPhoneNum1.select();
				return false;
			}
		}
		if (form.memPhoneNum2.value == "") {
			alert("핸드폰번호를 입력하지 않았습니다.")
			form.memPhoneNum2.focus();
			return false;
		}
		for (var i = 0; i < form.memPhoneNum2.value.length; i++) {
			ch = form.memPhoneNum2.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("핸드폰번호는 숫자만 입력가능합니다.")
				form.memPhoneNum2.focus();
				form.memPhoneNum2.select();
				return false;
			}
		}
		if (form.memAdr.value == "") {
			alert("주소를 입력하지 않았습니다.")
			form.memAdr.focus();
			return false;
		}
		form.submit();
	}

	

	//핸드폰 인증 팝업창
	function phone_check() {
		window.open("phone_check.jsp", "phonewin", "width=400, height=350");
	}

	//주소검색 팝업창
	function search_address() {
		window.open("", "b", "width-600, height=300,left=200, top=100");
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

#buttonmy {
	width: 80px;
	height: 30px;
	float: left;
	border-radius: 2px;
	padding-top: 1.8px;
	background-color: #212529;
	border-radius: 2px;
	color: white;
}
</style>
</head>
<title>주문결제창</title>
<body>


	<%
	MemberVO member = (MemberVO) session.getAttribute("member");
	String FullmemPhoneNum = member.getmemPhoneNum();
	String FullmemEmail = member.getmemEmail();
	String FullmemAdr = member.getmemAdr();

	String a1 = "-";
	String e1 = "@";
	String p1 = "-";

	String[] memAdr = FullmemAdr.split(a1);
	String[] memEmail = FullmemEmail.split(e1);
	String[] memPhoneNum = FullmemPhoneNum.split(p1);

	for (int i = 0; i < memAdr.length; i++) {
	}
	for (int i = 0; i < memEmail.length; i++) {
	}
	for (int i = 0; i < memPhoneNum.length; i++) {
	}
	%>



	<!-- 마이페이지 상단메뉴 -->
	<section class="ftco-section"
		style="padding-top: 50px; margin-bottom: 50px; padding-bottom: 0px; height: 700px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section	 ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">마이페이지</h2>
				</div>
			</div>
			<!-- 마이페이지 상단메뉴 끝 -->
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
			<!-- 최근 본 상품 끝 -->


			<!-- Left Menu -->
			<jsp:include page="/WEB-INF/views/common/mypage_sidemenu.jsp"
				flush="false" />
			<!-- left Menu 끝-->
			<!-- 내용 -->
			<div class="container02"
				style="padding-left: 200px; padding-top: 25px; margin-bottom: .30px;">
				<h5 style="font-size: 18px;">회원정보 수정</h5>
				<form name="Checkmodify" action="${contextPath}/modMember.do"
					method="post">

					<table
						style="width: 1000px; height: 400px; border: 1px solid black;">
						<tr>
							<td
								style="background-color: #212529; border-bottom: 1px solid white;"
								class="user_name" width="250">
								<div align="center" style="color: white;">
									<a style="color: red; padding-right: 5px;">*</a>이름
								</div>
							</td>
							<td colspan="3" class="user_name" style="padding-left: 10px;">
								<input type="text" name="memName" readonly size="25"
								value="${member.memName}">
							</td>
						</tr>
						<tr>
							<td
								style="background-color: #212529; border-bottom: 1px solid white;"
								class="user_id" width="250">
								<div align="center" style="color: white;">
									<a style="color: red; padding-right: 5px;">*</a>아이디
								</div>
							</td>
							<td colspan="3" class="user_id" style="padding-left: 10px;">
								<input type="text" name="memId" readonly size="25"
								value="${member.memId}">
							</td>
						</tr>
						<tr>
							<td
								style="background-color: #212529; border-bottom: 1px solid white;"
								class="user_password1">
								<div align="center" style="color: white;">
									<a style="color: red; padding-right: 5px;">*</a>비밀번호
								</div>
							</td>
							<td colspan="3" class="user_password1"
								style="padding-left: 10px;"><input type="password"
								placeholder="비밀번호를 입력해주세요." name="memPwd" size="25" value=""></td>
						</tr>
						<tr>
							<td
								style="background-color: #212529; border-bottom: 1px solid white;"
								class="user_password2">
								<div align="center" style="color: white;">
									<a style="color: red; padding-right: 5px;">*</a>비밀번호 재확인
								</div>
							</td>
							<td colspan="3" class="user_password2"
								style="padding-left: 10px;"><input type="password"
								placeholder="비밀번호를 입력해주세요." name="memPwd1" size="25" value=""></td>
						</tr>
						<tr>
							<td
								style="background-color: #212529; border-bottom: 1px solid white;"
								class="email">
								<div align="center" style="color: white;">
									<a style="color: red; padding-right: 5px;">*</a>이메일
								</div>
							</td>
							<td colspan="3" class="email" style="padding-left: 10px;"><input
								type="text" name="memEmail" placeholder=""
								value=<%=memEmail[0]%> size="20"> @ <select
								name="memEmail1" id="selcet1"
								style="height: 35px; width: 200px;">
									<option value=<%=memEmail[1]%>><%=memEmail[1]%></option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hanmail.net">hanmail.net</option>
							</select></td>
						</tr>
						<tr>
							<td
								style="background-color: #212529; border-bottom: 1px solid white;"
								class="phone">
								<div align="center" style="color: white;">
									<a style="color: red; padding-right: 5px;">*</a>핸드폰
								</div>
							</td>
							<td colspan="3" class="phone" style="padding-left: 10px;"><select
								name="memPhoneNum" id="selcet1"
								style="height: 35px; width: 80px;">
									<option value=<%=memPhoneNum[0]%>><%=memPhoneNum[0]%></option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
									<option value="010">010</option>
							</select>- <input type="text" name="memPhoneNum1"
								value=<%=memPhoneNum[1]%> size="5">- <input type="text"
								name="memPhoneNum2" value=<%=memPhoneNum[2]%> size="5">
								<input type="button" name="phone_certification" value="핸드폰인증"></td>
						</tr>
						<tr>
							<td
								style="background-color: #212529; border-bottom: 1px solid white;"
								class="addr1">
								<div align="center" style="color: white;">
									<a style="color: red; padding-right: 5px;">*</a>주소
								</div>
							</td>
							<td colspan="3" class="addr" style="padding-left: 10px;"><input
								type="text" value="<%=memAdr[0]%>" name="memAdr"
								id="sample6_postcode" readonly size="15"> <input
								type="button" value="우편번호 찾기"
								onclick="sample6_execDaumPostcode()"></td>
						</tr>
						<tr>
							<td
								style="background-color: #212529; border-bottom: 1px solid white;"
								class="addr2" height=100px;>
								<div align="center" style="color: white;">상세주소</div>
							</td>
							<td colspan="3" class="addr1" style="padding-left: 10px;"><input
								type="text" name="memAdr1" id="sample6_address" size="40"
								value="<%=memAdr[1]%>">
								<div style="padding-top: 10px;">
									<input type="text" id="sample6_address2" name="memAdr2"
										size="40" value="<%=memAdr[2]%>">
								</div></td>

						</tr>

					</table>


				

				<div align="center" id="btn_modify_reset"
					style="margin-top: 30px; margin-left: 500px;">
					<input type="button" name="modify" value="수 정 " id="buttonmy"
						onclick="Check_Join()"
						style="margin-right: 20px; cursor: pointer;"> <input
						type="button" value="취   소" id="buttonmy"
						onclick="location.href='/mypage_01'" style="cursor: pointer;">
				</div>
				</form>
			</div>

			<!-- 내용 -->

		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>