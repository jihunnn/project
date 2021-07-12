<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>

<script type="text/javascript">
<!--글쓰기 유효성 검사-->
	function CS_write() {
		var form = document.asCenterForm;

		if (form.asCenterTitle.value == "") {
			alert("제목을 입력해주세요")
			form.asCenterTitle.focus();
			return false;
		}

		if (form.asCenterContent.value == "") {
			alert("글 내용을 입력해주세요")
			document.form.asCenterContent.focus();
			return false;
		}

		if (form.asCenterPwd.value == "") {
			alert("비밀번호를 입력해주세요")
			form.asCenterPwd.focus();
			return false;
		}
		
		form.submit();

	}

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	function modAsCenter(obj) {
		var form = document.asCenterForm;

		if (form.asCenterTitle.value == "") {
			alert("제목을 입력해주세요")
			form.asCenterTitle.focus();
			return false;
		}

		if (form.asCenterContent.value == "") {
			alert("글 내용을 입력해주세요")
			document.form.asCenterContent.focus();
			return false;
		}

		if (form.asCenterPwd.value == "") {
			alert("비밀번호를 입력해주세요")
			form.asCenterPwd.focus();
			return false;
		}
		obj.action = "${contextPath}/board/modNewAsCenter.do?asCenterNum=${asCenter.asCenterNum}";
		obj.submit();

	}
</script>

<style>
.page_wrap {
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .pprev {
	background: #f8f8f8
		url('${contextPath}/resources/images/page_pprev.png') no-repeat center
		center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8 url('${contextPath}/resources/images/page_prev.png')
		no-repeat center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8 url('${contextPath}/resources/images/page_next.png')
		no-repeat center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8
		url('${contextPath}/resources/images/page_nnext.png') no-repeat center
		center;
	margin-right: 0;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}

#buttonmy {
	width: 80px;
	height: 30px;
	float: left;
	border-radius: 2px;
	padding-top: 1.8px;
}
</style>


</head>
<body>
	<!-- 타이틀 -->
	<section class="ftco-section"
		style="padding-top: 50px; margin-bottom: 50px; padding-bottom: 0px; margin-bottom: 150px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">고객센터</h2>
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
			<!-- 최근 본 상품 끝 -->
			<jsp:include page="/WEB-INF/views/common/csMenu.jsp" flush="false" />
			<!-- 내용 -->

			<form name="asCenterForm"
				action="${contextPath}/board/addNewAsCenter.do" method="post"
				enctype="multipart/form-data">
				<table class=table style="padding-top: 50px; border-top: #212529;">
					<c:choose>
						<c:when test="${!empty asCenterNum}">
							<tr style="background-color: #212529; margin-top: 20px;"
								align="center">
								<td colspan="6" style="color: white;">글쓰기</td>
							</tr>
							<tr style="border-top: 1px solid #212529;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-right: 100px; padding-top: 20px;">작성자</td>
								<td style="padding-top: 25px; background-color: white;"><input
									type=text name="memName" value="${asCenter.memName}" size=60
									disabled
									style="height: 28px; border: 1px solid #aaaaaa; border-radius: 3px; width: 150px;"></td>
							</tr>
							<tr>
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 25px;">제목</td>
								<td style="padding-top: 25px; background-color: white;"><input
									type=text name="asCenterTitle"
									value="${asCenter.asCenterTitle}" size=60
									style="height: 28px; border: 1px solid #aaaaaa; border-radius: 3px;"></td>
							</tr>
							<tr>
								<td
									style="padding-left: 95px; font-weight: bold; vertical-align: middle;">내용</td>
								<td style="padding-top: 25px; background-color: white;"><input
									type="text" name="asCenterContent"
									value="${asCenter.asCenterContent}"
									style="width: 510px; height: 300px"
									style="padding-top:25px; border-color:	#aaaaaa;"></td>
							</tr>
							<tr>
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 20px;">비밀번호</td>
								<td style="padding-top: 25px; background-color: white;"><input
									type="password" name="asCenterPwd" size=60
									style="height: 28px; border: 1px solid #aaaaaa; border-radius: 3px; width: 150px;"></td>
							</tr>
							<tr>
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 30px;">파일첨부</td>
								<td style="background-color: white;">기존파일: ${asCenter.asCenterFile}<input type="hidden" name="OrignAsCenterFile" value="${asCenter.asCenterFile}" /><br><input type="file"
									onchange="readURL(this);" name="asCenterFile"
									style="padding-top: 25px;"></td>
								<td><img id="preview"
									src="${contextPath}/download_asCenter.do?asCenterNum=${asCenter.asCenterNum}&asCenterFile=${asCenter.asCenterFile}"
									width="150" height="150" /></td>
							</tr>
						</c:when>
						<c:when test="${empty asCenterNum}">
							<tr style="background-color: #212529; margin-top: 20px;"
								align="center">
								<td colspan="6" style="color: white;">글쓰기</td>
							</tr>
							<tr style="border-top: 1px solid #212529;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-right: 100px; padding-top: 20px;">작성자</td>
								<td style="padding-top: 25px; background-color: white;"><input
									type=text name="memName" value="${memName}" size=60
									disabled
									style="height: 28px; border: 1px solid #aaaaaa; border-radius: 3px; width: 150px;"></td>
							</tr>
							<tr>
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 25px;">제목</td>
								<td style="padding-top: 25px; background-color: white;"><input
									type=text name="asCenterTitle" value="" size=60
									style="height: 28px; border: 1px solid #aaaaaa; border-radius: 3px;"></td>
							</tr>
							<tr>
								<td
									style="padding-left: 95px; font-weight: bold; vertical-align: middle;">내용</td>
								<td style="padding-top: 25px; background-color: white;"><input
									type="text" name="asCenterContent" value=""
									style="width: 510px; height: 300px"
									style="padding-top:25px; border-color:	#aaaaaa;"></td>
							</tr>
							<tr>
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 20px;">비밀번호</td>
								<td style="padding-top: 25px; background-color: white;"><input
									type="password" name="asCenterPwd" size=60
									style="height: 28px; border: 1px solid #aaaaaa; border-radius: 3px; width: 150px;"></td>
							</tr>
							<tr>
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 30px;">파일첨부</td>
								<td style="background-color: white;"><input type="file"
									onchange="readURL(this);" name="asCenterFile"
									style="padding-top: 25px;"></td>
								<td><img id="preview"
									src="${contextPath}/resources/images/simpleLogo.jpg"
									width="150" height="150" /></td>
							</tr>
						</c:when>
					</c:choose>
				</table>
				<hr style="border-color: #212529;; width: 100%;">
				<c:choose>
					<c:when test="${!empty asCenterNum}">
						<div>
							<button type="button" onClick="modAsCenter(this.form)"
								class="btn btn-dark " id="buttonmy"
								style="margin-left: 630px; margin-top: 30px;">수정</button>
							<button type="button" class="btn btn-dark " id="buttonmy"
								onClick="location.href='${contextPath}/board/listAsCenter.do'"
								style="margin-left: 730px; margin-top: -30px;">목록</button>
						</div>
					</c:when>
					<c:when test="${empty asCenterNum}">
						<div>
							<button type="button" onclick="CS_write()" class="btn btn-dark "
								id="buttonmy" style="margin-left: 630px; margin-top: 30px;">등록</button>
							<button type="button" class="btn btn-dark " id="buttonmy"
								onClick="location.href='${contextPath}/board/listAsCenter.do'"
								style="margin-left: 730px; margin-top: -30px;">목록</button>
						</div>
					</c:when>
				</c:choose>
			</form>

		</div>
	</section>
	<!-- 내용 끝 -->
</body>
</html>