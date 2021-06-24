<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서검색</title>
<link rel="stylesheet" href="${contextPath}/resources/css/bookSearch.css" type="text/css">
<script src="resources/js/roomInfo.js" defer></script>
</head>
<body>
<!-- 헤더부분 -->
<c:import url="../common/menubar.jsp"/>
	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">도서게시판</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				도서검색
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
				신착도서
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/clipboard-list-solid.svg"/>
				추천도서
			</h3>
		</div>
	</div>
	
<!-- 메인 부분 -->	
	<div class="main">
		<div id="mainTitle">도서 검색</div>
		<div class="line"></div>
		<div id="searchArea">
			<select>
				<option>도서명</option>
				<option>저자</option>
				<option>출판사</option>
			</select>
			<input type="text">
			<button>검색</button>
		</div>
		<div id="searchResult">
			<img class="bookThumnail" style="width: 90px;" src="../../../../resources/images/오늘엄마가공부하는이유.jpg" alt="" />
			<div id="bookInfo">
				<div class="bookCategory">도서</div>
				<div>1. 엉덩이 탐정. 6, 뿡뿡 엉덩이 탐정이 두사람이라고!?</div>
				<div>저자 : 트롤; 옮긴이 전경아</div>
				<div>출판사: 문학수첩리틀 북</div>
				<div>발행년도: 2020</div>
				<div>청구기호: 아 833.8-트295 o - 6</div>
			</div>
		</div>
		<div id="pagination">
			<div class="arrow pageButton">&lt;</div><div class="pageNumber activeNumber  pageButton">1</div><div class="pageNumber  pageButton">2</div><div class="pageNumber  pageButton">3</div><div class="arrow  pageButton">&gt;</div>		
		</div>
	</div>
</body>
</html>