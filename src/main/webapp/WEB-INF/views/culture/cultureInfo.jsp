<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화마당 이용안내</title>
<link rel="stylesheet" href="resources/css/cultureInfo.css" type="text/css">
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<!-- 테스트용 주석 수정 -->
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">문화마당</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='culture.cu';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				프로그램
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='cultureMypage.cu';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
				신청 내역
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='cultureInfo.cu';">
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
					<td>취소는 '신청 내역' 탭에서 가능합니다.</td>
				</tr>
				<tr>
					<td>접수시간 이전에 접속한 경우 접수시간에 화면을 다시 접속하거나, F5키(새로고침)를 눌러야 프로그램 신청 버튼이 활성화됩니다.</td>
				</tr>
				<tr>
					<td>시간이 겹치는 프로그램을 신청할 경우, 신청한 프로그램이 전부 취소됩니다.</td>
				</tr>
				<tr>
					<td>사이트 사용이 어려운 경우 프로그램 신청은 고객센터(☎.02-123-1234)에 문의 부탁드립니다.</td>
				</tr>
			</table>
			<br>
			<img id="infoImg1" src="resources/images/culture/cultureInfo.jpg"/>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>