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
	width: 430px;
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
	//로그인
	function Login() {

		var form = document.checkLogin;
		//아이디 검사 ---------------------------------------------------------------------------
		if (form.adminId.value == "") {
			alert("아이디를 입력해주세요!");
			form.adminId.focus();//포커스를 id박스로 이동.

		} else if (form.adminPwd.value == "")//패스워드 검사 -------------------------------------------------------------------------
		{
			alert("비밀번호를 입력해주세요!");
			form.adminPwd.focus();//포커스를 Password박스로 이동.
		} else {

			form.submit();

		}
	}
</script>
</head>
<title>관리자로그인창</title>
<body>

	<section class="ftco-section testimony-section"
		style="padding-top: 50px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">관리자 로그인</h2>
				</div>
			</div>
			

			<section class="ftco-section testimony-section"
				style="padding-top: 40px;">
				<div class="container">
					<section class="Easy-sgin-in-wrap4">
						<div id="LeftBox">
							<h3 id="login_text">회원 로그인</h3>
							<form name="checkLogin" action="${contextPath}/admin/login.do" method="post">
								<div class="id_pwd_text"
									style="padding-top: 30px; margin-bottom: 5px;">
									<div>
										<img src="${contextPath}/resources/images/login/login-id.jpg"
											width="30"><input type="text" name="adminId" size="30"
											placeholder="아이디를 입력하세요">
									</div>
									<div>
										<img src="${contextPath}/resources/images/login/login-pwd.jpg"
											width="30"><input type="password" name="adminPwd" size="30"
											placeholder="비밀번호를 입력하세요">
									</div>
								</div>
							</form>
							<div class="id_save_find">
								<input type="checkbox" name="save_id" id="chk_save_id"
									value="on"> <label id="id_pwd_save" for="saveIdPwd"
									class="on">아이디/비밀번호 저장</label> <span id="find_id_pwd">
									<button onclick="location.href='Login-03.jsp'"
										style="border: 1px solid grey; color: black; margin-right: 1px;"
										class="btn_member_id_pwd">아이디/비밀번호찾기</button>
								</span>
							</div>
							<span id="btn_submit_login"> <input type="button"
								id="submit_login" value="로그인" onclick="Login()"
								style="background-color: #212529; color: white; margin-left: -2px; margin-bottom: 10px;">
							</span>
						
						</div>
					</section>
				</div>
		
			</section>
		</div>
	</section>


</body>
</html>














