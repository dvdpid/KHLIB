<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/common/menubar.css" type="text/css">
<script src="resources/js/menubar.js" defer></script>

</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
	<section id="header">
		<div class="wrapper">
		<div></div>
		<c:if test="${ empty sessionScope.loginUser }">
			<ul class="lists">
				<li><a href="loginForm.ad">관리자 로그인</a></li>
				<li><a href="signupForm.ad">관리자회원가입</a></li>
			</ul>
		</c:if>
		<c:if test="${ !empty sessionScope.loginUser }">
			<ul class="lists">
				<li><a><c:out value="${ loginUser.name } 관리자님  환영합니다."/></a>
				<li><a href="logout.ad">로그아웃</a></li>
			</ul>		
		</c:if>
		</div>
	</section>
	<section id="top">
		<div class="wrapper" id="topWrapper">
			<div class="logo"><a href="user.ad" style="color: black;"><b style="color:rgb(212, 129, 91);">KH</b>도서관 </a></div>
			<button type="button" class="toggleBtn">
				<img src="resources/images/bars-solid.svg" style="width: 20px; height: 20px"/>
			</button>
			<ul class="topLists">
				<li><a href="home.do">사용자 화면</a></li>
			</ul>
		</div>
	</section>
	
	
	
</body>
</html>