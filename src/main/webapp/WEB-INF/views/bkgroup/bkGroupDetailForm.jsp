<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bkGroupDetail.css" type="text/css"> 
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
	
	<br>
	
<!-- 메인 부분 -->	
	<div id="bkDetailDiv">
		<h2>모임명</h2>	
		<div id="count">신청현황 : n / nn명</div>
		
		<hr> 
		
		<h4 style="margin-bottom: 5px;">모임 소개</h4>
		<br>
		<textarea rows="8" style="resize: none; width: 99%;" readonly>모임 소개 글</textarea>
		
		<br>
		
		<input type="hidden">
		<h4>장소 | 날짜(요일) 시간</h4>
		
		<hr>
		<br>
		
		<table style="width: 99%;">   
			<tr>
			 	<td rowspan="3" width="280"><img id="bookImage1" width="268" height="360"></td>
			 	<td width="30"></td>
			 	<td>책 제목</td>
			</tr>
			<tr>
				<td></td>
				<td rowspan="2">
					<textarea rows="5" style="resize: none; width: 100%; height: 300;" readonly>
						책 줄거리
					</textarea>
				</td>
			</tr>
		</table>
		
		<br>
		<hr>
		<h4>진행 방식</h4>
		<textarea rows="20" style="width: 100%; height: 250;" readonly></textarea>
	
		<br><br>

		<div id="applyDiv">
			<button id="applyBtn">독서 모임 신청</button>
		</div>
		<div id="etcDiv">
			<button id="updateBtn" >수정</button>
			<button id="deleteBtn">삭제</button>
		</div>
		
		<br><br><br>
	</div>	
	
	
	
	
	
	
</body>
</html>