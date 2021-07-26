<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 상세설명</title>
<link rel="stylesheet" href="resources/css/roomInfo.css" type="text/css">
<script src="resources/js/roomInfo.js" defer></script>
</head>
<body>
<!-- 헤더부분 -->
<c:import url="../common/menubar.jsp"></c:import>
	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">도서관 소개</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='intro.in';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/info/hi.png"/>
				인사말
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='map.in';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/info/maps.png"/>
				오시는 길
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='guide.in';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/info/time.png"/>
				이용 안내
			</h3>
		</div>
	</div>
	<!-- 테스트 주석 -->
<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/info/goodbye.png"/>
			인사말</p>
		</div>
		<div class="empty" style="height:90px;"></div>
		<div class="infoSpace">
			<table id="infoTable">
				  <b>이런 말이 있습니다.<br>
						
						"나는 삶을 변화시키는 아이디어를 항상 책에서 얻었다."<br>
						
						이 처럼 독서는 삶의 질을 향상 시킵니다.<br>

						저희 도서관은  <br>
						도서관의 도서관, 서울시민의 서재,  자료의 메카 역할을 수행합니다.<br>

						지역대표도서관과 공공도서관의 역할을 넘어 서울의 4차산업을 <br>
						
						선도할 복합독서문화공간이 되도록<br>

						최선을 다하겠습니다.<br>


						시민여러분의 많은 관심과 사랑 부탁드립니다.<br><br><br>
						
						도서관장 이규진
						</b>
			</table>
			<br>
			<img id="infoImg1" src="resources/images/info/introimages.jpg"/>
		</div>
	</div>
</body>
</html>