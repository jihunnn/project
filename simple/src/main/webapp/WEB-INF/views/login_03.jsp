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
	width: 400px;
	height: 350px;
	float: center;
	border: 1px solid #a9aaac;
	margin: 10 10 10 10;
}

#login_text {
	padding: 20px;
	margin: 10 10 10 10;
	font-size: 20px;
}

.id_find_text {
	padding-top: 25px;
	padding-left: 40px;
	padding-bottom: 20px;
}

#id_find_name {
	padding-bottom: 10px;
}

#id_find_phone {
	padding-bottom: 10px;
}

#btn_find_id {
	padding-left: 40px;
}

#find_id {
	align-items: center;
	width: 270px;
	height: 40px;
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

#sect {
	display: flex;
	flex-direction: row;
	padding-bottom: 10px;
}

#RightBox {
	width: 400px;
	height: 350px;
	border: 1px solid #a9aaac;
	margin: 10 10 10 10;
}

#Non_login_text {
	padding: 20px;
	margin-right: 20px;
	font-size: 20px;
}

#pwd_find {
	width: 430px;
	height: 200px;
}

.pwd_find>div {
	float: left;
}

.pwd_find {
	padding-top: 25px;
	padding-left: 40px;
}

#confirm {
	
}

#phone_confirm {
	width: 130px;
	height: 100px;
	padding-left: 10px;
}

#email_confirm {
	width: 130px;
	height: 100px;
}

h3 {
	color: block;
}

.Easy-sgin-in-wrap1 {
	display: flex;
	flex-direction: column; /*column으로 정렬 */
	align-items: center;
}

.Easy-sgin-in-wrap1 .sign-button-list1 {
	list-style: none;
	width: 600px;
	display: flex;
	flex-direction: column;
}

.Easy-sgin-in-wrap1 .sign-button-list1 li {
	padding-bottom: 10px;
}

.Easy-sgin-in-wrap1 .sign-button-list1 li button {
	width: 500px;
	height: 56px;
	border: 1px solid rgb(0, 0, 0);
	text-align: center;
	background: rgb(255, 255, 255);
}

.Easy-sgin-in-wrap1 .sign-button-list1 li button i {
	font-size: 25px;
}
</style>
<script type="text/javascript">
	//아이디 찾기
	function find_user_id() {

		var form = document.find_user_id_password;

		if (form.id_find_name.value == "") {
			alert("이름을 입력해주세요!");
			form.id_find_name.focus();
			return false;

		}
		if (form.id_find_phone.value == "") {
			alert("휴대전화번호 뒤7~8자리를 입력해주세요!");
			form.id_find_phone.focus();
			return false;
		}

		for (var i = 0; i < form.id_find_phone.length; i++) {
			ch = form.id_find_phone.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("핸드폰번호는 숫자만 입력가능합니다.")
				form.id_find_phone.focus();
				form.id_find_phone.select();
				return false;
			}
		}
		form.submit();

	}

	//비밀번호 찾기_핸드폰
	function find_user_password_phone() {
		var form = document.find_user_password;
		if (form.pwd_find_id.value == "") {
			alert("아이디를 입력해주세요!");
			form.id_find_name.focus();

		} else {
			form.submit();
			form.action = "login-05.jsp";
		}
	}
	//비밀번호 찾기_이메일
	function find_user_password_email() {
		var form = document.find_user_password;
		if (form.pwd_find_id.value == "") {
			alert("아이디를 입력해주세요!");
			form.id_find_name.focus();

		} else {
			form.submit();
			form.action = "login-05.jsp";
		}

	}
</script>
</head>
<title>주문결제창</title>
<body>

	<!-- 타이틀 -->
	<section class="ftco-section testimony-section"
		style="padding-top: 50px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">아이디/비밀번호
						찾기</h2>
				</div>
			</div>
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

			<section class="ftco-section testimony-section" id="sect"
				style="padding-top: 40px;">
				<div class="container">
					<section class="Easy-sgin-in-wrap">
						<div id="LeftBox" style="margin-right: 100px;">
							<h3 id="login_text">아이디 찾기</h3>
							<div class="id_find_text">
								<form name="find_user_id_password" action="${contextPath}/login_findid.do"
									method="post">
									<div id="id_find_name">
										<input type="text" name="id_find_name" size="37"
											placeholder="이름을 입력하세요">
									</div>
									<div id="id_find_phone">
										<input type="text" name="id_find_phone" size="37"
											placeholder="휴대전화번호 뒤 7~8자리를 입력하세요">
									</div>
								</form>
							</div>

							<div id="btn_find_id">
								<input type="submit" id="find_id" value="아이디찾기"
									onclick="find_user_id()"
									style="width: 325px; background-color: #212529; color: white; border-radius: 2px;">
							</div>

						</div>
					</section>

				</div>
				<div class="container">
					<div id="RightBox" style="margin-left: 100px;">
						<h3 id="Non_login_text">비밀번호 찾기</h3>

						<div class="pwd_find">
							<form name="find_user_password" method="post">
								<input type="text" name="pwd_find_id" class="pwd_find_id"
									size="37" placeholder="아이디를 입력하세요">

							</form>
							<div id="confirm">
								<input type="submit" id="phone_confirm" value="휴대폰 인증"
									onclick="find_user_password_phone()"
									style="width: 160px !important; background-color: #212529; color: white; border-radius: 2px; margin-top: 10px;">
								<input type="submit" id="email_confirm" value="이메일 인증"
									onclick="find_user_password_email()"
									style="width: 160px !important; background-color: #212529; color: white; border-radius: 2px;">
							</div>
						</div>


					</div>
				</div>
			</section>
		</div>
	</section>

	<div class="container">
		<section class="Easy-sgin-in-wrap1">
			<ul class="sign-button-list1">
				<li><button onclick="location.href='Login-01.jsp'"
						style="background-color: #212529; color: white; border-radius: 2px;">
						<i class="return-login"></i><span>로그인으로 돌아가기</span>
					</button></li>
			</ul>
		</section>

	</div>

	<br>
	<br>
	<br>
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














