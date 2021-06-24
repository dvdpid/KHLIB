<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bkGroupUpdate.css" type="text/css">
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">독서 모임</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				독서 모임
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
				독서 모임 등록
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='';">
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
				독서모임 수정
			</p>
		</div>
		<br>
		<form action="" enctype="Multipart/form-data">
			<table id="bkUpdateTable">
				<tr>
					<th>모임명</th>
					<td colspan="2" style="height: 40px;">
						<input type="text" name="groupName" required style="width: 90%; height:30px;">
					</td>
					<th>모임인원</th>
					<td style="width: 220px;">
						<input type="number" name="groupMember" required style="height:30px;"> 명
					</td>
				</tr>
				<tr>
					<th rowspan="2">모임소개</th>
					<td rowspan="2" colspan="2">
						<textarea rows="5" style="width: 90%;"></textarea>
					</td>
					<th>장소</th>
					<td>
						<input type="text" name="groupPlace" required style="width: 85%; height:50px;">
					</td>
				</tr>
				<tr style="border-bottom: 1px solid black;">
					<th height="40px">날짜</th>
					<td>
						<input type="date" style="width: 80%;">
					</td>
				</tr>
				<tr>
					<th rowspan="3">책 표지</th>
					<td rowspan="3">
						<div id="bookImage">
							<img id="bookImage1" width="268" height="360">
						</div>					
					</td>
					<th height="40px;">책 제목</th>
					<td colspan="2">
						<input type="text" name="BookTitle" required style="width: 85%; height:40px;">
					</td>
				</tr>
				<tr>
					<th rowspan="2">책 줄거리</th>
					<td rowspan="2" colspan="2">
						<textarea rows="5" style="width: 85%; height: 300;"></textarea>
					</td>
				</tr>
				<tr style="border-bottom: 1px solid black;"></tr>
				<tr>
					<th>진행 방식</th>
					<td colspan="4">
						<textarea rows="20" style="width: 90%; height: 250;"></textarea>
					</td>
				</tr>
			</table>
			
			<br>
			
			
			<div align="center;">
				<input type="submit" id="inBtn" value="수정하기"> &nbsp;
				<button onclick="location.href=''">취소하기</button>
			</div>
			
		</form>
		
	</div>	
	
	
	
	
	
	
</body>
</html>