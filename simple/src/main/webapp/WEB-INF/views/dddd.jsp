<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<c:set var="inquiryList" value="${inquirySearchMap.inquirySearchList}" />

<!DOCTYPE html>
<html lang="en">
<head>
<!-- 날짜위젯 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 조회기간 선택 자바스크립트 -->
<script>
	$(function() {
		//input을 datepicker로 선언
		$("#datepicker1, #datepicker2")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd' //달력 날짜 형태
							,
							showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
							,
							showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서
							,
							changeYear : true //option값 년 선택 가능
							,
							changeMonth : true //option값  월 선택 가능                
							,
							showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
							,
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
							,
							buttonImageOnly : true //버튼 이미지만 깔끔하게 보이게함
							,
							buttonText : "선택" //버튼 호버 텍스트              
							,
							yearSuffix : "년" //달력의 년도 부분 뒤 텍스트
							,
							monthNamesShort : [ '1월', '2월', '3월', '4월', '5월',
									'6월', '7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트
							,
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip
							,
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 텍스트
							,
							dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
									'금요일', '토요일' ] //달력의 요일 Tooltip
							,
							minDate : "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
							,
							maxDate : "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
						});

		//초기값을 오늘 날짜로 설정해줘야 합니다.
		$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	});
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

#recentlyProduct {
	
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
	<section class="ftco-section" style="padding-top: 50px;">
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
			<form name="inquirySearch" action="${contextPath}/board/inquirySearch.do" method="post"  >
			<div style="display: inline !important;">
				<p style="float: left; width: 80px; margin-top: 10px;">작성기간</p>

				<input type="text" id="datepicker1" name="search1"
					style="width: 120px; margin-right: 50px; margin-top: 10px; height: 30px; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

				<span class="glyphicon glyphicon-calendar" aria-hidden="true"
					style="margin-left: -35px;"> </span> ~ <input type="text" name="search2"
					id="datepicker2"
					style="width: 120px; margin-right: 50px; height: 30px; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

				<span class="glyphicon glyphicon-calendar" aria-hidden="true"
					style="margin-left: -35px;"> </span>

				<button type="submit" class="btn btn-default"
					style="background-color: #dcdcdc; fmargin-left: 380px; margin-top: 0px; width: 80px; height: 28px; display: inline !important; background-color: #212529; color: white; border-radius: 2px; height: 30px; margin-right: 500px; padding-top: 3px;">조회</button>
			</div>
			</form>
			<table class="table" style="height: 30px;">
				<thead class="table-dark" align=center>
					<tr align="center">
						<td scope="col" width="100">번호</td>
						<td scope="col" width="150">문의유형</td>
						<td scope="col" width="500"><p style="margin-bottom: 0px;">제목</p></td>
						<td scope="col" width="150">작성일</td>
					</tr>

					<c:set var="num" value="${pageMaker.totalCount - ((pageNum-1) * 10) }"/>

					<c:forEach var="inquiry" items="${inquiryList}"
						varStatus="inquiryNum">
						<tr
							style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">
							<td scope="col" width="50">${num}</td>
							<td scope="col" width="150">${inquiry.inquiryType}</td>
							<td align="left" scope="col" width="500"><a
								href="${contextPath}/board/viewInquiry.do?inquiryNum=${inquiry.inquiryNum}"
								style="color: black; padding-left: 30px; margin-bottom: 0px;">${inquiry.inquiryTitle}</a></td>
							<td scope="col" width="150"><fmt:formatDate
									value="${inquiry.inquiryDate}" /></td>
						</tr>
						  <c:set var="num" value="${num-1}"></c:set>

					</c:forEach>
				</thead>
			</table>
			<a id="buttonmy" class="btn btn-dark"
				href="${contextPath}/board/inquiryForm.do"
				style="float: left; margin-left: 1190px; margin-top: 25px; border-radius: 2px;">글쓰기</a>
		</div>
		<!-- 내용 끝 -->
		<!-- 페이징 글번호 -->
				<div class="page_wrap" style="margin-left: 80px; margin-top: 60px; width:1300px;" >
	<div class="page_nation" >
			
    <c:if test="${pageMaker.prev}">

        <a class="arrow prev" href='<c:url value="/board/inquirySearch.do?search1=${inquirySearchMap.search1}&search2=${inquirySearchMap.search2}&page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
  
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
   
        <a href='<c:url value="/board/inquirySearch.do?search1=${inquirySearchMap.search1}&search2=${inquirySearchMap.search2}&page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
    
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
 
        <a class="arrow next" href='<c:url value="/board/inquirySearch.do?search1=${inquirySearchMap.search1}&search2=${inquirySearchMap.search2}&page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
 
    </c:if>
 
    </div>
    </div>

	</section>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
