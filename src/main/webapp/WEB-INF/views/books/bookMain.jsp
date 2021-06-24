<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 상세설명</title>
<link rel="stylesheet" href="${contextPath}/resources/css/bookMain.css" type="text/css">
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
		<div id="toggleBooks">
                <div id="toggle-newarrival" class="toggle-size toggle-active">신착도서</div>
                <span class="line"></span>
                <div id="toggle-recommend" class="toggle-size">추천도서</div>
            </div>
		<div id="bookList">
                    <div class="bookItem">
                        <img src="../../../../resources/images/10대와통하는법과재판이야기.jpg" class="bookImage">
                    </div>
                    <div class="bookItem">
                        <img src="../../../../resources/images/어쩌면스무번.jpg" class="bookImage">
                    </div>
                    <div class="bookItem">
                        <img src="../../../../resources/images/더이상한수학책.jpg" class="bookImage">
                    </div>
                    <div class="bookItem">
                        <img src="../../../../resources/images/무기가되는토론의기술.jpg" class="bookImage">
                    </div>
                    <div class="bookItem">
                        <img src="../../../../resources/images/뮤직숍.jpg" class="bookImage">
                    </div>
                    <div class="bookItem">
                        <img src="../../../../resources/images/서점탐정유동인.jpg" class="bookImage">
                    </div>
                    <div class="bookItem">
                        <img src="../../../../resources/images/신성함의상징.jpg" class="bookImage">
                    </div>
                    <div class="bookItem">
                        <img src="../../../../resources/images/화학의기초.jpg" class="bookImage">
                    </div>
            </div>
            <div id="searchArea">
                <select name="searchType">
                    <option value="title">도서명</option>
                    <option value="author">저자</option>
                    <option value="publisher">출판사</option>
                </select>
                <input type="text" name="searchText" />
                <img src="../../../resources/images/돋보기.png" style="width:20px;;" alt="돋보기">
            </div>
	</div>
</body>
</html>