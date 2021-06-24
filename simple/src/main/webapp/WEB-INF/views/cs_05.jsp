<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

<script type="text/javascript">
<!--글쓰기 유효형 검사-->
	function CS_write() {
		var form = document.Checkwrite;

		if (form.category.value == "") {
			alert("문의유형을 선택해주세요")
			form.category.focus();
			return false;
		}

		if (form.title.value == "") {
			alert("글 제목을 입력해주세요")
			document.form.title.focus();
			return false;
		}

		if (form.content.value == "") {
			alert("글 내용을 입력해주세요")
			document.form.content.focus();
			return false;
		}
		form.submit();
	}
</script>
<style>
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
		style="padding-top: 50px; margin-bottom: 50px;">
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



			<div class="btn-group btn-group-justified" role="group"
				aria-label="..." style="margin-bottom: 30px; margin-top: 10px;">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white; margin-left: 28px;">*공지사항</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white;">*자주
						묻는 질문</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default"
						style="font-size: 28px; font-weight: bold; border: none; color: #5a5a5a; padding-right: 210px; background-color: white;">*1:1문의</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default"
						style="font-size: 25px; border: none; color: #5a5a5a; background-color: white;">*A/S센터</button>
				</div>
			</div>

			<!-- 내용 -->
			<form name="Checkwrite" action="" method="post">
				<table class=table style="padding-top: 50px; border-top: #212529;">

					<tr style="background-color: #212529; margin-top: 20px;"
						align="center">
						<td colspan="6" style="color: white;">글쓰기</td>
					</tr>
					<tr style="border-top: 1px solid #212529;">
						<td
							style="padding-left: 95px; font-weight: bold; padding-right: 100px;">문의유형</td>
						<td style="background-color: white;"><select name="category"
							style="height: 28px;">
								<option value="">선택</option>
								<option value="배송문의">배송문의</option>
								<option value="상품문의">상품문의</option>
								<option value="반품문의">반품문의</option>
						</select></td>
					</tr>
					<tr>
						<td
							style="padding-left: 95px; font-weight: bold; padding-top: 25px;">제목</td>
						<td style="padding-top: 25px; background-color: white;"><input
							type=text name="title" size=60 value=""
							style="height: 28px; border: 1px solid #aaaaaa; border-radius: 3px;"></td>
					</tr>
					<tr>
						<td style="padding-left: 95px; font-weight: bold;">내용</td>
						<td style="padding-top: 25px; background-color: white;"><input
							type="text" name="content" value=""
							style="width: 510px; height: 300px"
							style="padding-top:25px; border-color:	#aaaaaa;"></td>
					</tr>
					<tr>
						<td
							style="padding-left: 95px; font-weight: bold; padding-top: 30px;">파일첨부</td>
						<td style="background-color: white;"><input type="file"
							onchange="readURL(this);" style="padding-top: 25px;"></td>
					</tr>
				</table>
				<hr style="border-color: #212529;; width: 100%;">
				<div>
					<button type="button" onclick="CS_write();" class="btn btn-dark "
						id="buttonmy" style="margin-left: 630px; margin-top: 30px;">등록</button>

					<button type="button" onclick="location.href=''"
						class="btn btn-dark " id="buttonmy"
						style="margin-left: 730px; margin-top: -30px;">목록</button>
				</div>
			</form>
		</div>
	</section>
	<!-- 내용 끝 -->

</body>
</html>