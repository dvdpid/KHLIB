<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2>admin</h2>
			<h1 id="sideMainTitle">관리자 페이지</h1>
			<h3 id="sideSubTitle" style="color:lightgray;">Kh Library</h3>
		</div>
		<div class="sideButton" onclick="location.href='user.ad';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/icon1.png"/>
				회원 관리
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='board.ad';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/icon2.png"/>
				게시글/댓글 관리
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='room.ad';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/icon3.png"/>
				열람실 관리
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='book.ad';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/icon4.png"/>
				도서 관리
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='culture.ad';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/icon5.png"/>
				문화 마당
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='bkgroup.ad';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/icon6.png"/>
				독서 모임
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='notice.ad';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/icon7.png"/>
				공지 사항
			</h3>
		</div>
	</div>
</body>
</html>