<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test="${!empty memberSearchMap.search}">
	<c:set var="memberSearchList"
		value="${memberSearchMap.memberSearchList}" />
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>


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
</style>
<script> src="http://code.jquery.com/jquery-1.6.4.min.js"</script>
<script type="text/javascript">
    
	function listMemberSearch() {
		var form = document.memberSearch;

		if (form.search.value == "") {
			alert("?????? ????????? ??????????????????")
			form.search.focus();
			return false;
		}else{
			form.submit();
		}


	}
	$(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for(var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length==rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	function deleteValue(){
		var url="${contextPath}/admin_selectremoveMember.do"; //Controller??? ???????????? ?????? url
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for(var i = 0; i < list.length; i++){
			if(list[i].checked){//???????????? ????????? ????????? ?????? ??????
					valueArr.push(list[i].value);
				}
			}
			if(valueArr.length == 0){
				alert("????????? ????????? ????????????.");
			}else{
				if(confirm("?????? ?????????????????????????")){
				$.ajax({
					url : "${contextPath}/admin_selectremoveMember.do", //?????? URL
					type: 'POST',
					traditional : true,
					data : {
						valueArr : valueArr   //???????????? ?????? data ?????? ??????
					},
					success: function(jdata){
						if(jdata = 1){
							alert("????????? ?????????????????????.");
							location.href = '${contextPath}/admin_listmember.do'; //admin_listmember??? ????????? ????????????
						}else{
							alert("??????????????? ?????????????????????.");
						}	
					}

				});
				}else{
					return false;
				}
			}
	}
	
	
</script>
  <script type="text/javascript">
		function listMemberdelete() {
			var memId=$("#memId").val();
			if(confirm("?????? ?????????????????????????")){
				$.ajax({
				url : "${contextPath}/admin_removeMember.do",
				type : "POST",
				data : {
						memId : memId
					},
				success : function(result) {
				    alert("????????? ?????????????????????");
					location.replace("${contextPath}/admin_listmember.do"); //admin_listmember??? ????????? ????????????
					},
				});
			}else{
					 return false;
				  }
		  }
		
		function listMemberdelete1() {
			var memId=$("#memId1").val();
			if(confirm("?????? ?????????????????????????")){
				$.ajax({
				url : "${contextPath}/admin_removeMember.do",
				type : "POST",
				data : {
						memId : memId
					},
				success : function(result) {
				    alert("????????? ?????????????????????");
				    location.href = '${contextPath}/admin_listmember.do'; //admin_listmember??? ????????? ????????????
					},
				});
			}else{
					 return false;
				  }
		  }
		
			  
 </script>
</head>
<title>???????????????</title>
<body>

	<section class="ftco-section testimony-section"
		style="padding-top: 100px;">

		<div class="container">
			<jsp:include page="/WEB-INF/views/common/admin_topmenu.jsp"
				flush="false" />


			<form name="memberSearch"
				action="${contextPath}/admin_listmember/memberSearch.do"
				method="post">
				<div style="margin-bottom: 10px;">
					<button type="button" id="buttonmy" class="btn btn-dark" onclick="listMemberSearch()"
						style="margin-top: 21px; float: right; padding-top: 4px; height: 34px; font-size: 14px; padding-top: 4px; background-color: #7e9c8c; border: none;">??????</button>
					<input type="text"
						style="margin-top: 21px; float: right; height: 34px; border: 1px solid #dcdcdc; font-size: 14px; margin-right: 5px;"
						name="search"> <select name="searchType"
						style="font-size: 14px; margin-bottom: 10px; margin-right: 5px; float: right; width: 80px; height: 34px; border: 1px solid #dcdcdc; margin-top: 21px;">
						<option value="memId">?????????</option>
						<option value="memName">??????</option>
						<option value="memEmail">?????????</option>
						<option value="memPhoneNum">????????????</option>
						<option value="memAdr">??????</option>
						<option value="logintype">????????????</option>
					</select>
					<div
						style="font-size: 25px; font-weight: bold; margin-left: 18px; padding-top: 13px; float: left;">
						<a style="color: #7e9c8c;">????????????</a>
					</div>
					<button type="button" 
						style="float: left; border-radius: 2px; margin-bottom: 3px; margin-right:5px; margin-left:5px; margin-top: 22px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;"
						class="btn-secondary btn-xs" onclick="deleteValue();">????????????</button>

				</div>
			</form>


			<table class="table" style="font-size: 14px;">
				<thead class="table-dark" align=center>
					<tr align="center"
						style="background-color: #eeeeee; color: black; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
						<td scope="col" style="width: 80px;">??????</td>
						<td scope="col" style="width: 100px;">?????????</td>
						<td scope="col" style="width: 100px;">??????</td>
						<td scope="col">?????????</td>
						<td scope="col" style="width: 150px;">????????????</td>
						<td scope="col">??????</td>
						<td scope="col" style="width: 100px;">????????????</td>
						<td scope="col">?????????</td>
						<td scope="col">??????</td>
					</tr>
					<c:choose>
						<c:when test="${!empty memberSearchMap.search}">
							<c:choose>
								<c:when test="${empty memberSearchMap.memberSearchList}">
									<tr height="200">
										<td colspan="10"
											style="background-color: white; padding-top: 100px;">
											<p align="center">
												<b><span style="color: black;">????????? ????????? ????????????.</span></b>
											</p>
										</td>
									</tr>
								</c:when>
								<c:otherwise>

									<c:forEach var="memberSearch" items="${memberSearchList}">
										<tr
											style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">
											<td scope="col" style="height: 70px; display: table-cell; vertical-align: middle;">
											<input type="checkbox" name="RowCheck" id="memId1" value="${memberSearch.memId}"></td>
											<td scope="col" style="height: 70px; display: table-cell; vertical-align: middle;">${memberSearch.memId}</td>
											<td scope="col" style="height: 70px; display: table-cell; vertical-align: middle;">${memberSearch.memName }</td>
											<td scope="col" style="height: 70px; display: table-cell; vertical-align: middle;">${memberSearch.memEmail}</td>
											<td scope="col" style="height: 70px; display: table-cell; vertical-align: middle;">${memberSearch.memPhoneNum}</td>
											<td scope="col" style="height: 70px; display: table-cell; vertical-align: middle;">${memberSearch.memAdr }</td>
											<td scope="col" style="height: 70px; display: table-cell; vertical-align: middle;">${memberSearch.logintype }</td>
											<td scope="col" style="height: 70px; display: table-cell; vertical-align: middle;">${memberSearch.memRegdate}</td>
											<td scope="col" style="height: 70px; display: table-cell; vertical-align: middle;">
											<input
												type="hidden" value="${memberSearch.memId}" name="memId" />
												<button type="button" class="btn btn-dark"
													onclick="location.href='${contextPath}/admin/viewMember.do?memId=${memberSearch.memId }'"
													style="border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">??????</button>
												<br>
												<button type="button"
													onclick="listMemberdelete1()"
													class="btn btn-dark"
													style="border-radius: 2px; margin-bottom: 3px; margin-top: 5px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">??????</button></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${empty memberSearchMap.search}">
							<c:choose>
								<c:when test="${empty membersList}">
									<tr height="200">
										<td colspan="5"
											style="background-color: white; padding-top: 100px;">
											<p align="center">
												<b><span style="color: black;">????????? ????????? ????????????.</span></b>
											</p>
										</td>
									</tr>
								</c:when>
								<c:otherwise>

									<c:forEach var="member" items="${membersList}">

										<tr
											style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;"><input
												type="checkbox" name="RowCheck" id="memId" value="${member.memId}"></td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.memId}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.memName }</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.memEmail}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.memPhoneNum}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.memAdr }</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.logintype }</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${member.memRegdate}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">
												<button type="button" class="btn btn-dark"
													onclick="location.href='${contextPath}/admin/viewMember.do?memId=${member.memId }'"
													style="border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">??????</button>
												<br>
												<button type="button"
													onclick="listMemberdelete()"
													class="btn btn-dark"
													style="border-radius: 2px; margin-bottom: 3px; margin-top: 5px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">??????</button>
											
											</td>
										</tr>

									</c:forEach>

								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>

				</thead>
			</table>
		</div>
		<!-- ?????? ??? -->

		<!-- ????????? ????????? -->
		<div class="page_wrap" style="margin-left: 80px; margin-top: 60px;">
			<div class="page_nation" style="text-align: center;">

				<c:if test="${pageMaker.prev}">

					<a class="arrow prev"
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/admin_listmember.do?page=${pageMaker.startPage-1 }"/>'><i
						class="fa fa-chevron-left"></i></a>

				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">

					<a
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/admin_listmember.do?page=${pageNum }"/>'><i
						class="fa">${pageNum }</i></a>

				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

					<a class="arrow next"
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/admin_listmember.do?page=${pageMaker.endPage+1 }"/>'><i
						class="fa fa-chevron-right"></i></a>

				</c:if>

			</div>
		</div>




	</section>


</body>
</html>








