<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>


<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:500);

.snip1284 {
	font-family: 'Raleway', Arial, sans-serif;
	text-align: center;
	text-transform: uppercase;
	font-weight: 500;
	letter-spacing: 1px;
}

.snip1284 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

.snip1284 li {
	display: inline-block;
	list-style: outside none none;
	margin: 0.5em 1.2em;
	padding: 0;
}

.snip1284 a {
	padding: 0 0.6em;
	color: rgba(255, 255, 255, 0.5);
	position: relative;
	text-decoration: none;
}

.snip1284 a:before, .snip1284 a:after {
	width: 3px;
	height: 0;
	position: absolute;
	content: '';
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
	background-color: #7e9c8c;
}

.snip1284 a:before {
	top: 0;
	right: 0;
}

.snip1284 a:after {
	bottom: 0;
	left: 0;
}

.snip1284 a:hover, .snip1284 .current a {
	color: #ffffff;
}

.snip1284 a:hover:before, .snip1284 .current a:before, .snip1284 a:hover:after,
	.snip1284 .current a:after {
	height: 100%;
}

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
	width: 600px;
	height: 500px;
	border: 1px solid #eeeeee;
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

	
	if (form.memEmail.value == "") {
		alert("이메일을 입력하지 않았습니다.")
		form.memEmail.focus();
		return false;
	}

	
	if (form.memPhoneNum.value == "") {
		alert("핸드폰번호를 입력하지 않았습니다..")
		form.memPhoneNum.focus();
		return false;
	}
	if (form.memAdr.value == "") {
		alert("주소를 입력하지 않았습니다.")
		form.memAdr.focus();
		return false;
	} 
	 if (confirm("회원정보를 수정하시겠습니까?")){ //확인
    	 form.submit();
    } else { //취소
     	return false;
    }

  
}
</script>


</head>
<title>회원수정창</title>
<body>

	<section class="ftco-section testimony-section"
		style="padding-top: 100px;">
		<div class="container">

			<ul class="snip1284" style="padding-left: 0px; margin-bottom: 30px;">
				<li><a
					onclick="location.href='${contextPath}/product/admin_listProduct.do'"
					data-hover="상품관리"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; margin-left: 20px; padding-bottom: 0px;">상품관리</a></li>


				<li><a
					onclick="location.href='${contextPath}/product/add_product.do'"
					data-hover="상품등록"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; padding-bottom: 0px;">상품등록</a></li>


				<li class="current"><a
					onclick="location.href='${contextPath}/admin_listmember.do'"
					data-hover="회원관리"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; padding-bottom: 0px;">회원관리</a></li>


				<li><a
					onclick="location.href='location.href='${contextPath}/board/listNotice.do'"
					data-hover="게시판관리"
					style="font-size: 20px; border: none; color: #5a5a5a; background-color: white; cursor: pointer; padding-bottom: 0px;">게시판관리</a></li>
			</ul>

			<hr style="margin-top: -10px;">
           
			<section class="ftco-section testimony-section"
				style="padding-top: 100px;">
				<form name="Checkmodify" action="${contextPath}/admin/modMember.do" method="post">
				<div class="container">
				
					<section class="Easy-sgin-in-wrap4">
						<div id="LeftBox" style="font-size: 14px;">
							
								<table style="margin-top:30px; margin-left:35px;">
									<tr style="border-top: 1px solid #7e9c8c;  height:60px; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
										<td style="width: 200px; text-align:center; background-color:#7e9c8c; color:white;">아이디</td>
										<td><input type="text" name="memId"
											value="${member.memId}"
											style="font-size: 14px; margin-left:10px; border: 1px solid #dcdcdc; width: 316px; height: 36px;">
									</tr>
									<tr style="border-bottom: 1px solid #eeeeee; ">
										<td style=" height:60px; text-align:center; background-color:#7e9c8c; color:white;">이름</td>
										<td><input type="text" name="memName"
											value="${member.memName}"
											style="font-size: 14px; margin-left: 10px; border: 1px solid #dcdcdc; width: 316px; height: 36px;">
									</tr>
									<tr style="border-bottom: 1px solid #eeeeee; ">
										<td style=" height:60px; width: 200px; text-align:center; background-color:#7e9c8c; color:white;">이메일</td>
										<td><input type="text" name="memEmail"
											value="${member.memEmail}"
											style="font-size: 14px; margin-left: 10px; border: 1px solid #dcdcdc; width: 316px; height: 36px;">
									</tr>
									<tr style="border-bottom: 1px solid #eeeeee; ">
										<td style="height:60px;  width: 200px; text-align:center; background-color:#7e9c8c; color:white;">전화번호</td>
										<td><input type="text" name="memPhoneNum"
											value="${member.memPhoneNum}"
											style="font-size: 14px; margin-left: 10px; border: 1px solid #dcdcdc; width: 316px; height: 36px;">
									</tr>
									<tr  style="border-bottom: 1px solid #eeeeee;">
										<td style="height:60px; width: 200px; text-align:center; background-color:#7e9c8c; color:white;">주소</td>
										<td><input type="text" name="memAdr"
											value="${member.memAdr}"
											style="font-size: 14px; margin-left: 10px; border: 1px solid #dcdcdc; width: 316px; height: 36px;">
									</tr>
									<tr  style="border-bottom: 1px solid #eeeeee; ">
										<td style="height:60px; width: 200px; text-align:center; background-color:#7e9c8c; color:white;">회원유형</td>
										<td><input type="text" name="logintype"
											value="${member.logintype}"
											style="font-size: 14px; margin-left: 10px; border: 1px solid #dcdcdc; width: 316px; height: 36px;">
									</tr>
									<tr  style="border-bottom: 1px solid #7e9c8c; ">
										<td style="height:60px; width: 200px; text-align:center; background-color:#7e9c8c; color:white;">가입일</td>
										<td><input type="text" name="memRegdate"
											value="${member.memRegdate}"
											style="font-size: 14px; margin-left: 10px; border: 1px solid #dcdcdc; width: 316px; height: 36px;">
									</tr>
								</table>

							


						</div>
					</section>
				</div>
				<div class="container">
					<section class="Easy-sgin-in-wrap4">
						<ul class="sign-button-list4">
							<li style="margin-left: 50px;">
							<button  onclick="Check_Join()"
									style="background-color: white; font-size:14px; color: gray; border: 1px solid #7e9c8c; border-radius:2px; width:400px; float:left;">
									<i class="btn-Non Order Inquiry"></i><span>수정</span>
								</button>
									
							</li>
					
							<li style="margin-left: 50px;">
								<button  onclick="location.href='${contextPath}/admin_listmember.do'"
									style="background-color: white; font-size:14px; color: gray; border: 1px solid #7e9c8c; border-radius:2px; width:400px; float:left;">
									<i class="btn-Non Order Inquiry"></i><span>취소</span>
								</button>
							</li>

						</ul>
					</section>
				</div>
				</form>
			</section>
			
		</div>
	</section>


</body>
</html>








