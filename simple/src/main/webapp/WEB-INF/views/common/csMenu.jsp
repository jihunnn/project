<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script>
    function InquiryList() {
        if (${isLogOn != true && member == null}) {
            alert("로그인이 필요합니다.");
            location.href = '${contextPath}/login_01.do';
        } else {
        	location.href='${contextPath}/board/listInquiry.do'
        }
    }
</script>
</head>
<body>
			<div class="btn-group btn-group-justified" role="group"
				aria-label="..." style="margin-bottom: 30px; margin-top: 10px;">
				<div class="btn-group" role="group">
					<button type="button" onclick="location.href='${contextPath}/board/listNotice.do'"
						class="btn btn-default"
						style="font-size: 28px; font-weight: bold; border: none; color: #5a5a5a; padding-right: 210px; background-color: white; margin-left: 28px;">*공지사항</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" onclick="location.href='${contextPath}/board/listQuestion.do'"
						class="btn btn-default"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white;">*자주
						묻는 질문</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" onclick="InquiryList()"
						class="btn btn-default"
						style="font-size: 25px; border: none; color: #5a5a5a; padding-right: 210px; background-color: white;">*1:1문의</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button"  onclick="location.href='${contextPath}/board/listAsCenter.do'"
						class="btn btn-default"
						style="font-size: 25px; border: none; color: #5a5a5a; background-color: white;">*A/S센터</button>
				</div>

			</div>
</body>
</html>