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
	obj.action="${contextPath}/board/removeInquiry.do?inquiryNum=${inquiry.inquiryNum}";
	} else {
		return false;
	}
	obj.submit();
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

		<form name="frmInquiry" method="post"  action="${contextPath}/board/modInquiry.do?inquiryNum=${inquiry.inquiryNum}"  enctype="multipart/form-data">
			<table class="table" style="margin-top: 20px; text-align: center;">
				<thead class="table-dark" align=center>
					<tr style="border-bottom: 1px solid grey; height: 30px;">
						<td><a>${inquiry.inquiryTitle}</a></td>
					</tr>	

					
				<c:choose>		
				<c:when test="${not empty inquiry.inquiryFile && inquiry.inquiryFile != 'null'}">
				<tr
						style="border-bottom: 0.5px solid grey; height: 300px; text-align: left; background-color: white;">
				<td style="padding-bottom: 250px; color: black;"><a>${inquiry.inquiryContent}<br>
				<input type="hidden" name="OrignInquiryFile" value="${inquiry.inquiryFile}" />
				<img  src="${contextPath}/download.do?inquiryNum=${inquiry.inquiryNum}&inquiryFile=${inquiry.inquiryFile}" id="preview" /><br>
	
				</a>
	
				</td>
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
	<c:when test= "${!empty search1}">
							<button type="button" class="btn btn-dark" id="buttonmy"
				style="float: left; margin-left: 590px; margin-top: 30px;" onclick="location.href='${contextPath}/board/inquirySearch.do?search1=${search1}&search2=${search2}&page=${pageNum}'">목록</button>
			</c:when>
			<c:otherwise>
			<button type="button" class="btn btn-dark" id="buttonmy"
				style="float: left; margin-left: 590px; margin-top: 30px;" onclick="location.href='${contextPath}/board/listInquiry.do'">목록</button>
			</c:otherwise>	
			</c:choose>	
				<button type="submit" class="btn btn-dark" id="buttonmy" 
					style="float: left; margin-left: 1100px; margin-top: -30px; " >수정</button>
				<button type="button" class="btn btn-dark" id="buttonmy" 
					style="float: left; margin-left: 1190px; margin-top: -30px;" onclick="removeInquiry(this.form)">삭제</button>	
			</form>	
		</div>
	</section>
	<!-- 내용 끝 -->
</body>
</html>