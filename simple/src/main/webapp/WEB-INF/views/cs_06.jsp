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
<script>
	function removeInquiry(obj) {
		if (confirm("삭제하시겠습니까??")) {
			obj.action = "${contextPath}/board/removeInquiry.do?inquiryNum=${inquiry.inquiryNum}";
		} else {
			return false;
		}
		obj.submit();
	}
	
    function InquiryList() {
        if (${isLogOn != true && member == null}) {
            alert("로그인이 필요합니다.");
            location.href = '${contextPath}/login_01.do';
        } else {
        	location.href='${contextPath}/board/listInquiry.do'
        }
    }
</script>
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
	background-color: #d2d2d2;
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
		style="padding-top: 50px; margin-bottom: 50px; margin-top: 30px;">
		<div class="container">
			<ul class="snip1284">
				<li><a
					onclick="location.href='${contextPath}/board/listNotice.do'"
					data-hover="공지사항"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; margin-left: 20px; padding-bottom: 0px;">공지사항</a></li>


				<li><a
					onclick="location.href='${contextPath}/board/listQuestion.do'"
					data-hover="자주 묻는 질문"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; padding-bottom: 0px;">자주
						묻는 질문</a></li>


				<li class="current"><a onclick="InquiryList()"
					data-hover="1:1문의"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; padding-bottom: 0px;">1:1문의</a></li>


				<li><a
					onclick="location.href='${contextPath}/board/listAsCenter.do'"
					data-hover="A/S센터"
					style="font-size: 20px; border: none; color: #5a5a5a; background-color: white; cursor: pointer; padding-bottom: 0px;">A/S센터</a></li>
			</ul>

			<div>
				<h2 style="font-size: 28px; margin-top: 15px; float: left;">1:1문의</h2>
				<h5
					style="color: #828282; float: left; font-size: 18px; margin-left: 20px; margin-top: 25px;">빠르게
					답변해 드리겠습니다.</h5>
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
			<!-- 내용 -->

			<form name="frmInquiry" method="post"
				action="${contextPath}/board/modInquiry.do?inquiryNum=${inquiry.inquiryNum}"
				enctype="multipart/form-data">
				<table class="table"
					style="margin-top: 20px; text-align: center; font-size: 14px;">
					<thead class="table-dark" align=center>
						<tr
							style="border-bottom: 1px solid grey; height: 30px; background-color: #212529;">
							<td><a>${inquiry.inquiryTitle}</a></td>
						</tr>


						<c:choose>
							<c:when
								test="${not empty inquiry.inquiryFile && inquiry.inquiryFile != 'null'}">
								<tr
									style="border-bottom: 0.5px solid grey; height: 300px; text-align: left; background-color: white;">
									<td
										style="padding-bottom: 20px; color: black; padding-left: 0px;"><a>${inquiry.inquiryContent}</a><br>
									<br> <input type="hidden" name="OrignInquiryFile"
										value="${inquiry.inquiryFile}" /> <img width="300"
										height="300"
										src="${contextPath}/download.do?inquiryNum=${inquiry.inquiryNum}&inquiryFile=${inquiry.inquiryFile}"
										id="preview" /><br></td>
								</tr>


							</c:when>
							<c:otherwise>
								<tr
									style="border-bottom: 0.5px solid grey; height: 300px; text-align: left; background-color: white;">
									<td style="padding-bottom: 250px; color: black;">${inquiry.inquiryContent}<br>
								</tr>
							</c:otherwise>
						</c:choose>


					</thead>
				</table>

				<c:choose>
					<c:when test="${!empty search1}">
						<button type="button" class="btn btn-dark" id="buttonmy"
							style="float: left; margin-left: 600px; margin-top: 30px; font-size: 14px;  background-color: #212529; padding-top:4px;"
							onclick="location.href='${contextPath}/board/inquirySearch.do?search1=${search1}&search2=${search2}&page=${pageNum}'">목록</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-dark" id="buttonmy"
							style="float: left; margin-left: 600px; margin-top: 30px; font-size: 14px;  background-color: #212529; padding-top:4px;"
							onclick="location.href='${contextPath}/board/listInquiry.do'">목록</button>
					</c:otherwise>
				</c:choose>
				<button type="submit" class="btn btn-dark" id="buttonmy"
					style="float: left; margin-left: 1100px; margin-top: -30px; font-size: 14px;  background-color: #212529; padding-top:4px;">수정</button>
				<button type="button" class="btn btn-dark" id="buttonmy"
					style="float: left; margin-left: 1190px; margin-top: -30px; font-size: 14px;  background-color: #212529; padding-top:4px;"
					onclick="removeInquiry(this.form)">삭제</button>
			</form>
		</div>
	</section>
	<!-- 내용 끝 -->
</body>
</html>