<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 상세설명</title>
<link rel="stylesheet" href="resources/css/roomInfo.css" type="text/css">
</head>
<body>
	<c:import url="../common/menubar.jsp"></c:import>
	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">열람실</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='room.ro';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				열람실 현황
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='roomMypage.ro';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
				내 자리
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='roomInfo.ro';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/clipboard-list-solid.svg"/>
				이용 안내
			</h3>
		</div>
	</div>
	
<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/clipboard-list-solid.svg"/>
			이용 안내</p>
		</div>
		<div class="empty" style="height:140px;"></div>
		<div class="infoSpace">
			<table id="infoTable">
				<tr>
					<td>좌석은 동시 예약이 불가능합니다.</td>
				</tr>
				<tr>
					<td>좌석 예약 시 [예약이 확정되었습니다]라는 팝업 메시지를 확인하세요.</td>
				</tr>
				<tr>
					<td>사이트 사용이 어려운 경우 좌석 발권은 도서관 내 설치된 좌석발권기에서 좌석 발권이 가능합니다.</td>
				</tr>
				<tr>
					<td>퇴실 시 "내 자리" 메뉴에서 좌석 반납은 필수입니다.</td>
				</tr>
			</table>
			<br>
			<img id="infoImg1" src="resources/images/libraryImg1.jpg"/>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>