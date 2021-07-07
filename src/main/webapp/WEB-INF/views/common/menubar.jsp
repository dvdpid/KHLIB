
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 상세설명</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script> 
<link rel="stylesheet" href="resources/css/common/menubar.css?ver=1.0" type="text/css">
<script src="resources/js/menubar.js" defer></script>
</head>
<body>

	<!-- 메뉴바는 어느 페이지든 포함하고 있을 테니 여기서 contextPath 변수 값 만들기 -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
<!-- 헤더부분 -->
	
	<section id="header">	
		<div class="wrapper">
		<div></div>
		<c:if test="${ empty sessionScope.loginUser }">
			<ul class="lists">
				<li><a href="home.do">홈</a></li>
				<li><a href="loginForm.me">로그인</a></li>
				<li><a href="enrollView.me">회원가입</a></li>
			</ul>
		</c:if>	
		<c:if test="${ !empty sessionScope.loginUser }">
			<ul class="lists">
			<c:if test="${ sessionScope.loginUser.admin == 'Y' }">
				<li><a href="user.ad">관리자 페이지</a></li>
			</c:if>
				<c:out value="${ loginUser.name }님 환영합니다."/> 
				<li><a href="logout.me">로그아웃</a></li>
				<li><a href="mypageForm.me">내 정보보기</a></li>						
			</ul>					
		</c:if>
		</div>
	

	</section>
	<section id="top">
		<div class="wrapper" id="topWrapper">
			<div class="logo"><b style="color:rgb(212, 129, 91);">KH</b>도서관 </div>
			<button type="button" class="toggleBtn">
				<img src="resources/images/bars-solid.svg" style="width: 20px; height: 20px"/>
			</button>
			<ul class="topLists">
				<li><a href="info.in">도서관 소개</a></li>
				<li><a href="book.bk">도서 게시판</a></li>
				<li><a href="board.bo">자유 게시판</a></li>
				<li><a href="bkgroup.bg">독서 모임</a></li>
				<li><a href="culture.cu">문화 마당</a></li>
				<li><a href="room.ro">열람실</a></li>
				<li><a href="customer.cm">고객센터</a></li>
				</ul>
		</div>
	</section>

</body>
</html>

