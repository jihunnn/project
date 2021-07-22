<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

<script type="text/javascript">
<!--글쓰기 유효형 검사-->
	function inquiry_write() {
		var form = document.inquiryForm;

		if (form.inquiryType.value == "") {
			alert("문의유형을 선택해주세요")
			form.inquiryType.focus();
			return false;
		}

		if (form.inquiryTitle.value == "") {
			alert("글 제목을 입력해주세요")
			document.form.inquiryTitle.focus();
			return false;
		}

		if (form.inquiryContent.value == "") {
			alert("글 내용을 입력해주세요")
			document.form.inquiryContent.focus();
			return false;
		}


		form.submit();
	}
	
		function modInquiry(obj) {
				obj.action="${contextPath}/board/modNewInquiry.do?inquiryNum=${inquiryNum.inquiryNum}";
				obj.submit();
				
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

			<jsp:include page="/WEB-INF/views/common/csMenu.jsp" flush="false" />

			<!-- 내용 -->

			<form name="inquiryForm"
				action="${contextPath}/board/addNewInquiry.do" method="post"
				enctype="multipart/form-data">
				<table class=table style="padding-top: 50px; border-top: #212529;">
					<c:choose>
						<c:when test="${!empty inquiryNum}">
							<tr style="background-color: #212529; margin-top: 20px;"
								align="center">
								<td colspan="6" style="color: white;">글쓰기</td>
							</tr>
							<tr style="border-top: 1px solid #212529;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-right: 100px;">문의유형</td>
								<td style="background-color: white;"><select
									name="inquiryType" style="height: 28px;">
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
									type=text name="inquiryTitle" size=60
									value="${inquiryNum.inquiryTitle}"
									style="height: 28px; border: 1px solid #aaaaaa; border-radius: 3px;"></td>
							</tr>
							<tr>
								<td style="padding-left: 95px; font-weight: bold;">내용</td>
								<td
									style="padding-top: 25px; background-color: white; height: 300px;"><input
									type="text" name="inquiryContent"
									value="${inquiryNum.inquiryContent}"
									style="width: 510px; height: 300px; padding-top: 25px; border-color: #aaaaaa;"></td>
							</tr>
							<tr>
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 30px;">파일첨부</td>
								<td style="background-color: white;">기존파일:
									${inquiryNum.inquiryFile}<input type="hidden"
									name="OrignInquiryFile" value="${inquiryNum.inquiryFile}" /><br>
									<input type="file" style="padding-top: 25px;"
									name="inquiryFile" onchange="readURL(this);">
								</td>
								<td><img id="preview"
									src="${contextPath}/download.do?inquiryNum=${inquiryNum.inquiryNum}&inquiryFile=${inquiryNum.inquiryFile}"
									width="150" height="150" /></td>

							</tr>
						</c:when>
						<c:when test="${empty inquiryNum}">

							<tr style="background-color: #212529; margin-top: 20px;"
								align="center">
								<td colspan="6" style="color: white;">글쓰기</td>
							</tr>
							<tr style="border-top: 1px solid #212529;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-right: 100px;">문의유형</td>
								<td style="background-color: white;"><select
									name="inquiryType" style="height: 28px;">
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
									type=text name="inquiryTitle" size=60 value=""
									style="height: 28px; border: 1px solid #aaaaaa; border-radius: 3px;"></td>
							</tr>
							<tr>
								<td style="padding-left: 95px; font-weight: bold;">내용</td>
								<td
									style="padding-top: 25px; background-color: white; height: 300px;"><input
									type="text" name="inquiryContent" value=""
									style="width: 510px; height: 300px; padding-top: 25px; border-color: #aaaaaa;"></td>
							</tr>
							<tr>
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 30px;">파일첨부</td>
								<td style="background-color: white;"><input type="file"
									style="padding-top: 25px;" name="inquiryFile"
									onchange="readURL(this);"></td>
								<td><img id="preview"
									src="${contextPath}/resources/images/simpleLogo.jpg"
									width="150" height="150" /></td>
							</tr>
						</c:when>
					</c:choose>
				</table>
				<hr style="border-color: #212529;; width: 100%;">
				<c:choose>
					<c:when test="${!empty inquiryNum}">
						<button type="button" onClick="modInquiry(this.form)"
							class="btn btn-dark " id="buttonmy"
							style="margin-left: 630px; margin-top: 30px;">수정하기</button>
						<input type=button value="목록"
							onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">

					</c:when>
					<c:when test="${empty inquiryNum}">
						<div>
							<button type="button" onclick="inquiry_write()"
								class="btn btn-dark " id="buttonmy"
								style="margin-left: 630px; margin-top: 30px;">등록</button>

							<button type="button"
								onclick="location.href='${contextPath}/board/listInquiry.do'"
								class="btn btn-dark " id="buttonmy"
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