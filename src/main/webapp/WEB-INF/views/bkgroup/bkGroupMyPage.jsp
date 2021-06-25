<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bkGroupMyPage.css" type="text/css">
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">독서 모임</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='bkgroup.bg';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				독서 모임
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='bkgroupInsertForm.bg';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
				독서 모임 등록
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='bkgroupMyPage.bg';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/clipboard-list-solid.svg"/>
				신청 내역
			</h3>
		</div>
	</div>
	
	<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p>
				<img id="titleImg1" src="resources/images/clipboard-list-solid.svg"/>
				독서모임 신청내역
			</p>
		</div>
		
		<br>
		
		<table id="bkMyPageTable" border="1">
			<tr>
				<th width="200">독서 모임명</th>
				<th width="200">장소 및 시간</th>
				<th width="200">신청 현황</th>
				<th width="200">취소</th>
			</tr>
			
			<tr>
				<td>A</td>
				<td>노원 / 2021.03.08 / 1:30</td>
				<td>4 / 15 (모집중)</td>
				<td><button id="cancleBtn">신청 취소</button></td>
			</tr>
		
		</table>
	</div>
	
</body>
</html>