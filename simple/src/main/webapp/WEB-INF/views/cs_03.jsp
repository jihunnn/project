<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test="${questionSearchMap !=null}">
<c:set var="questionList" value="${questionSearchMap.questionSearchList}" />
</c:if>
<!DOCTYPE html>
<html lang="en">

<head>
<script>
	$(document).on('click', '#btnSearch', function(object) {

		object.preventDefault();
		var url = "${contextPath}/board/questionSearch.do";
		url = url + "?search=" + $('#search').val();
		location.href = url;
		console.log(url);

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
<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);
.snip1226 {
  font-family: 'Raleway', Arial, sans-serif;
  text-align: center;
  text-transform: uppercase;
  font-weight: 500;
}
.snip1226 * {
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
.snip1226 li {
  display: inline-block;
  list-style: outside none none;
  margin: 0 1.5em;
  overflow: hidden;
}
.snip1226 a {
  padding: 0.3em 0;
  color: red;
  position: relative;
  display: inline-block;
  letter-spacing: 1px;
  margin: 0;
  text-decoration: none;
}
.snip1226 a:before,
.snip1226 a:after {
  position: absolute;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
.snip1226 a:before {
  bottom: 100%;
  display: block;
  height: 2px;
  width: 100%;
  content: "";
  background-color: #ffcdcd;
}
.snip1226 a:after {
  padding: 0.3em 0;
  position: absolute;
  bottom: 100%;
  left: 0;
  content: attr(data-hover);
  color: black;
  white-space: nowrap;
}
.snip1226 li:hover a,
.snip1226 .current a {
  transform: translateY(100%);
}

</style>



</head>
<body>
	<!-- 타이틀 -->
	<!--  -->
	<section class="ftco-section" style="padding-top: 50px;">
		<div class="container">
					
				<ul class="snip1226" >
					<li><a  onclick="location.href='${contextPath}/board/listNotice.do'"
						data-hover="공지사항"
						style="font-size: 20px;border: none; color: #5a5a5a; margin-right: 150px; background-color: white; margin-left: 100px;">공지사항</a></li>
				
			
					<li class="current" ><a onclick="location.href='${contextPath}/board/listQuestion.do'"
						 data-hover="자주 묻는 질문" 
						style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; background-color: white;">자주
						묻는 질문</a></li>
			
				
					<li><a  onclick="InquiryList()"
						 data-hover="1:1문의"
						style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; background-color: white;">1:1문의</a></li>
				
				
					<li><a onclick="location.href='${contextPath}/board/listAsCenter.do'"
						 data-hover="A/S센터"
						style="font-size: 20px; border: none; color: #5a5a5a; background-color: white;">A/S센터</a></li>
				</ul>

			<div class="row justify-content-center mb-5"
				style="background-color:none; margin-top: 30px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 30px; margin-top: 15px;">고객센터</h2>
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
			<!--  최근 본 상품 끝 -->

			<!-- 내용 -->

		</div>

			<input type="text" class="form-control"
				style="margin-top: 10px; margin-left: 1330px;" name="search"
				id="search">
			<button type="button" class="btn btn-default" id="btnSearch"
				style="margin-top: -62px; margin-left: 1535px; padding-top: 4px; background-color: #dcdcdc; border-radius: 2px; height: 34px;">검색</button>

		<div>

			<table class="table" 
				style="margin-bottom: 50px; width: 1275px; margin-left: 320px; height:25px; font-size:14px;">
				<thead class="table-dark" align=center>
					<tr align="center" style="background-color: #212529;">
						<td scope="col" width="100">번호</td>
						<td scope="col" width="500">내용</td>

					</tr>
					<c:set var="num" value="${pageMaker.totalCount - ((pageNum-1) * 10) }"/>
					<c:forEach var="question" items="${questionList}"
						varStatus="questionNum">
						<tr
							style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black; border-bottom: 1px solid #32383e;">
							
							<td scope="col" width="50" style="padding-top: 12px;">${num}</td>
							<td align="left" scope="col" width="500"
								style="padding-top: 15px; padding-bottom: 0px;">
								<div>
									<div id="section1b" class="label">
										<p
											style="color: black; text-align: left; cursor: pointer; font-size: 15px; font-weight: normal;">
											<span style="color: red">Q</span>. ${question.questionTitle }
										</p>
									</div>
									<div id="section1b" class="elements">
										<hr style="margin-bottom: 20px; margin-top: 0px;">
										<p
											style="color: black; text-align: left; cursor: pointer; font-size: 15px;">
											<span style="color: green;">A</span>.
											${question.questionContent }
										</p>
									</div>
								</div>
							</td>
						</tr>
						<c:set var="num" value="${num-1}"></c:set>
					</c:forEach>
				</thead>
			</table>
			<!-- -아코디언메뉴 -->
			<script type="text/javascript">
				var elements = document.getElementsByTagName("div");

				// 모든 영역 접기
				for (var i = 0; i < elements.length; i++) {
					if (elements[i].className == "elements") {
						elements[i].style.display = "none";
					} else if (elements[i].className == "label") {
						elements[i].onclick = switchDisplay;
					}
				}

				// 상태에 따라 접거나 펼치기
				function switchDisplay() {

					var parent = this.parentNode;
					var target = parent.getElementsByTagName("div")[1];

					if (target.style.display == "none") {
						target.style.display = "block";
					} else {
						target.style.display = "none";
					}
					return false;
				}
			</script>
		</div>
		<!-- 내용 끝 -->
		<!-- 페이징 글번호 -->
		<c:choose>
		<c:when test="${questionSearchMap ==null}">
		<div class="page_wrap" style="margin-left: 80px; margin-top: 60px;">
			<div class="page_nation">

				<c:if test="${pageMaker.prev}">

					<a class="arrow prev"
						href='<c:url value="/board/listQuestion?page=${pageMaker.startPage-1 }"/>'><i
						class="fa fa-chevron-left"></i></a>

				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">

					<a href='<c:url value="/board/listQuestion.do?page=${pageNum }"/>'><i
						class="fa">${pageNum }</i></a>

				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

					<a class="arrow next"
						href='<c:url value="/board/listQuestion?page=${pageMaker.endPage+1 }"/>'><i
						class="fa fa-chevron-right"></i></a>

				</c:if>

			</div>
		</div>
		</c:when>
		<c:when test="${questionSearchMap !=null}">
		<div class="page_wrap" style="margin-left: 80px; margin-top: 60px;">
			<div class="page_nation">

				<c:if test="${pageMaker.prev}">

					<a class="arrow prev"
						href='<c:url value="/board/questionSearch.do?search=${questionSearchMap.search}&page=${pageMaker.startPage-1 }"/>'><i
						class="fa fa-chevron-left"></i></a>

				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">

					<a href='<c:url value="/board/questionSearch.do?search=${questionSearchMap.search}&page=${pageNum }"/>'><i
						class="fa">${pageNum }</i></a>

				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

					<a class="arrow next"
						href='<c:url value="/board/questionSearch.do?search=${questionSearchMap.search}&page=${pageMaker.endPage+1 }"/>'><i
						class="fa fa-chevron-right"></i></a>

				</c:if>

			</div>
		</div>
		</c:when>
		</c:choose>
	</section>
</body>
</html>

