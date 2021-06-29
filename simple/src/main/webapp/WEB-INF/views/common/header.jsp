<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
 
 <!-------------header------------------------------------------------------------------------------------------------------------------------>   
	  	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container" style=" height: 150px;">
	      <a class="navbar-brand" href="${contextPath}/main.do">SIMPLE</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        	<c:choose>
	        	<c:when test="${isLogOn == true && member != null}">
	        	<h6>환영합니다.${member.memName}님!</h6>
	        	<li class="nav-item active"><a href="${contextPath}/logout.do" class="nav-link"  style="margin-bottom:100px;">LOGOUT</a></li>
	        	</c:when>
	        	<c:otherwise>
	        	<li class="nav-item active"><a href="${contextPath}/login_01.do" class="nav-link"  style="margin-bottom:100px;">LOGIN</a></li>
	        	</c:otherwise>
	        	</c:choose>
	        	<li class="nav-item"><a href="${contextPath}/join_01.do" class="nav-link">JOIN</a></li>
	        	<c:choose>
	        	<c:when test="${isLogOn == true && member != null}">
	        	<li class="nav-item"><a href="${contextPath}/mypage_01.do?action=mypage&id=${member.memId}" class="nav-link">MYPAGE</a></li>
	        	</c:when>
	        	<c:otherwise>
	        	<li class="nav-item"><a href="${contextPath}/login_01.do" class="nav-link">MYPAGE</a></li>
	        	</c:otherwise>
	        	</c:choose>
	        	<li class="nav-item"><a href="" class="nav-link">매장안내</a></li>
	        	<li class="nav-item"><a href="" class="nav-link" style="margin-right:20px;">고객센터</a></li>

	        </ul>

	     <div class="dropdown">
  			<button  type="button" id="dropdownMenu1"  onclick = "location.href = '${contextPath}/product/listProduct.do'" data-toggle="dropdown" aria-expanded="true" class="category" style="margin-left:-1030px; margin-bottom:0px; cursor:pointer;">
    			침대
  			</button>
  			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="margin-left:-1085px; text-align:center;">
   			 	<li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="color:#000000;">싱글</a></li>
    			<li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="color:#000000;">킹</a></li>
   				 <li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="color:#000000;">이층침대</a></li>
    			<li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="color:#000000;">패밀리</a></li>
    			<li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="color:#000000;">퀸</a></li>
 			</ul>
		</div>
		
		<div class="dropdown">
  			<button  type="button" id="dropdownMenu1"  onclick = "location.href = ''" data-toggle="dropdown" aria-expanded="true" class="category" style="margin-left:-926px; cursor:pointer; font-size:19px;">
    			소파
  			</button>
  			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="margin-left:-980px; text-align:center;">
   			 	<li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="color:#000000;">코너형</a></li>
    			<li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="color:#000000;">1인/웜체어</a></li>
   				 <li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="color:#000000;">패브릭</a></li>
    			<li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="color:#000000;">리클라이너</a></li>
    			<li role="presentation"style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile"style="color:#000000;">4/6인 일자형</a></li>
 			 </ul>
		</div>
		
		<div class="dropdown">
  			<button  type="button" id="dropdownMenu1"  onclick = "location.href = ''" data-toggle="dropdown" aria-expanded="true" class="category" style="margin-left:-810px; cursor:pointer;font-size:19px;">
    			화장대/옷장/수납
  			</button>
  			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="margin-left:-813px; text-align:center;">
   				 <li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile"  style="color:#000000;">거실장</a></li>
    			<li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile"  style="color:#000000;">장식장</a></li>
   				 <li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile"  style="color:#000000;">화장대/콘솔</a></li>
    			<li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile"  style="color:#000000;">옷장</a></li>
    			<li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="color:#000000;">서랍장</a></li>
 			 </ul>
		</div>
		<div class="dropdown">
  			<button  type="button" id="dropdownMenu1" onclick = "location.href = ''" data-toggle="dropdown" aria-expanded="true" class="category" style="margin-left:-620px; cursor:pointer;font-size:19px;">
    			식탁/의자
  			</button>
  			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="margin-left:-655px; text-align:center;">
   				 <li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="color:#000000;">2인 이상</a></li>
    			<li role="presentation"style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="color:#000000;">4인 이상</a></li>
   				 <li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href="" id="categorydetile" style="color:#000000;">8인 이상</a></li>
    			<li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href="" id="categorydetile"  style="color:#000000;">식탁 의자</a></li>
    			<li role="presentation"style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href="" id="categorydetile"  style="color:#000000;">테이블의자</a></li>
 			 </ul>
		</div>
		
		<div class="dropdown">
  			<button  type="button" id="dropdownMenu1" onclick = "location.href = ''" data-toggle="dropdown" aria-expanded="true" class="category" style="margin-left:-480px; cursor:pointer;font-size:19px;">
    			테이블/책상/책장
  			</button>
  			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="margin-left:-480px; text-align:center;">
   				 <li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile"style="color:#000000;">소파 테이블</a></li>
    			<li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href=""  id="categorydetile"style="color:#000000;">좌식 테이블</a></li>
   				 <li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href="" id="categorydetile"style="color:#000000;">원목 테이블</a></li>
   				 <li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href="" id="categorydetile"style="color:#000000;">다용도 테이블</a></li>
    			<li role="presentation" style=" margin-top:11px;"><a role="menuitem" tabindex="-1" href="" id="categorydetile" style="color:#000000;">책상/책장</a></li>
 			</ul>
		</div>
		
		
		 	
    		<input type="text"  placeholder="Search for..."  style="margin-top:60px; margin-left:-300px;">
    		<button type="submit" style="background-image:url(${contextPath}/resources/images/header-01.png); cusor:pointer;  background-size:25px; width:35px; height:35px; border:1px solid #828282; background-repeat:no-repeat; border-radius:2px; margin-top:60px; margin-left:1px; background-position:center; cursor:pointer;"></button>
    	 	
       	<div class="dropdown">
       		
  			<button style="background-image:url(${contextPath}/resources/images/header-02.png); cusor:pointer;  border:none; background-size:50px 55px; width:40px; height:40px; background-repeat:no-repeat; border-radius:2px; margin-top:69px;  background-position:center; background-color: transparent !important; cursor:pointer;"></button>
    			
 
  		
  			
  
  		
  		
  	<!-- 사이트맵 -->
  		<ul class="dropdown-menu submenu" role="menu" aria-labelledby="dropdownMenu1" style="margin-left:-1200px; padding-left:1300px; margin-bottom:600px;">
   		   
   		 	  <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; font-weight:bold; background-color:lightgrey; width:180px; margin-top:20px; color:#000000;">침대</a></li>
  			  <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; font-weight:bold; background-color:lightgrey; width:180px; margin-top:20px;  color:#000000;">소파</a></li>
  		      <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px;	font-weight:bold; background-color:lightgrey; width:180px; margin-top:20px;  color:#000000;" >화장대/옷장/수납</a></li>
   		   	  <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-530px; font-weight:bold; background-color:lightgrey; width:180px; margin-top:20px;  color:#000000;">식탁/의자</a></li>
   		   	  <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-300px; font-weight:bold; background-color:lightgrey; width:180px; margin-top:20px;  color:#000000;">테이블/책상/책장</a></li>   
   			  <li role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; width:180px; text-align:center; padding-top:60px;color:#000000;">싱글</a></li>
   			  <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; width:180px; text-align:center; padding-top:60px; color:#000000;">코너형</a></li>
   			  <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px; width:180px; text-align:center; padding-top:60px; color:#000000;" >거실장</a></li>
   		 	  <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-530px; width:180px; text-align:center; padding-top:60px; color:#000000;">2인이상</a></li>
  	 	      <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-300px; width:180px; text-align:center; padding-top:60px; color:#000000;">소파 테이블</a></li>
   			   
   			 <li role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; width:180px; text-align:center;color:#000000;padding-top:95px;">킹</a></li>
   			 <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; width:180px; text-align:center;color:#000000;padding-top:95px; ">1인/웜체어</a></li>
   			 <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px; width:180px; text-align:center;color:#000000; padding-top:95px;" >장식장</a></li>
   			 <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-530px; width:180px; text-align:center;color:#000000;padding-top:95px;">4인 이상</a></li>
   			 <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-300px; width:180px; text-align:center;color:#000000;padding-top:95px;">좌식 테이블</a></li>
   			   
   	  		 <li role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; width:180px; text-align:center;color:#000000;padding-top:125px;">이층 침대</a></li>
   		 	 <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; width:180px; text-align:center;padding-top:125px;color:#000000;">패브릭</a></li>
   			 <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px; width:180px; text-align:center;color:#000000; padding-top:125px;" >화장대/콘솔</a></li>
   		     <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-530px; width:180px; text-align:center;color:#000000; padding-top:125px;">원목테이블</a></li>
   			 <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-300px; width:180px; text-align:center;color:#000000; padding-top:125px;">책상/책장</a></li>
   				
   			<li role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; width:180px; text-align:center;color:#000000;padding-top:155px;">패밀리</a></li>
   		 	 <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; width:180px; text-align:center;color:#000000;padding-top:155px;">리클라이너</a></li>
   			  <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px; width:180px; text-align:center;color:#000000;padding-top:155px;" >옷장</a></li>
   				<li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-530px; width:180px; text-align:center;color:#000000;padding-top:155px;">식탁 의자</a></li>
   				<li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-300px; width:180px; text-align:center;color:#000000;padding-top:155px;">다용도 테이블</a></li>
   				
   				<li role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; width:180px; text-align:center;color:#000000;padding-top:185px;color:#000000;">퀸</a></li>
   		 	 <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; width:180px; text-align:center;padding-top:185px;color:#000000;">4/6인 일자형</a></li>
   			  <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px; width:180px; text-align:center;padding-top:185px;color:#000000;" >서랍장</a></li>
   				<li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-530px; width:180px; text-align:center;padding-top:185px;color:#000000;">테이블의자</a></li>
   				<li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-300px; width:180px; text-align:center;padding-top:185px;color:#000000;">책상/책장</a></li>
   			   
			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; font-weight:bold; background-color:lightgrey; width:180px; margin-top:20px; margin-top:230px;color:#000000;">매장 안내</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; font-weight:bold; background-color:lightgrey; width:180px; margin-top:20px; margin-top:230px;color:#000000;">마이 페이지</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px;	font-weight:bold; background-color:lightgrey; width:180px; margin-top:20px; margin-top:230px;color:#000000;" >고객센터</a></li>

   			   
   			   <li role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; width:180px; text-align:center; padding-top:270px;color:#000000;">회사 소개</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; width:180px; text-align:center; padding-top:270px;color:#000000;">주문/배송조회</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px; width:180px; text-align:center; padding-top:270px;color:#000000;" >공지사항</a></li>
   			   
   			   <li role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; width:180px; text-align:center;color:#000000; padding-top:300px;">매장안내</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; width:180px; text-align:center;color:#000000;padding-top:300px;">취소/반품내역</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px; width:180px; text-align:center;color:#000000;padding-top:300px;" >자주 묻는 질문</a></li>
   			   
   			   <li role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; width:180px; text-align:center;color:#000000;padding-top:330px;">ㅤ</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; width:180px; text-align:center;color:#000000;padding-top:330px;">장바구니</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px; width:180px; text-align:center;color:#000000;padding-top:330px;" >1:1 문의</a></li>
   			   
   			   <li role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; width:180px; text-align:center;color:#000000;padding-top:360px;">ㅤ</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; width:180px; text-align:center;color:#000000;padding-top:360px;">관심상품</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px; width:180px; text-align:center;color:#000000;padding-top:360px;" >A/S 접수 센터</a></li>
   			   
   			   <li role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; width:180px; text-align:center;color:#000000;padding-top:390px;">ㅤ</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; width:180px; text-align:center;color:#000000;padding-top:390px;">적립금</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px; width:180px; text-align:center;color:#000000;padding-top:390px;" >ㅤ</a></li>
   			   
   			   <li role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; width:180px; text-align:center;color:#000000;padding-top:420px;">ㅤ</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; width:180px; text-align:center;color:#000000;padding-top:420px;">쿠폰</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px; width:180px; text-align:center;color:#000000;padding-top:420px;" >ㅤ</a></li>
   			   
   			   <li role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; width:180px; text-align:center;color:#000000;padding-top:450px;">ㅤ</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; width:180px; text-align:center;color:#000000;padding-top:450px;">회원 등급 안내</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px; width:180px; text-align:center;color:#000000;padding-top:450px;" >ㅤ</a></li>

			   <li role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-1200px; width:180px; text-align:center;color:#000000;padding-top:480px;">ㅤ</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-980px; width:180px; text-align:center;color:#000000;padding-top:480px;">상품 리뷰</a></li>
   			   <li id=sitemap role="presentation"><a role="menuitem" tabindex="-1" href=""  id="categorydetile" style="float:left; margin-left:-755px; width:180px; text-align:center;color:#000000;padding-top:480px;" >ㅤ</a></li>
   			   

    		
 			</ul>
 		</div>
 	</div>
 	</div>	
		
  	</nav>
  	<hr style="margin-top:-100px; color:red; margin-bottom:100px; width:52%; margin-left:595px;"/>
  <!-------------header 끝------------------------------------------------------------------------------------------------------------------------>	    
