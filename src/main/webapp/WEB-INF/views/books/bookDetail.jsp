<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서상세</title>
<link rel="stylesheet" href="${contextPath}/resources/css/bookDetail.css" type="text/css">
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
		<div class="title">도서정보</div>
		<div class="bookSumWrapper">
			<div class="bookImage">
				<img src="../../../../resources/images/10대와통하는법과재판이야기.jpg" />
			</div>
			<div class="infoArea">
			<div class="titleArea">
				<div id="bookCategory">도서</div>
				<div id="bookTitle">(10와 통하는) 법과 재판 이야기</div>
			</div>
			<div>
				<table>
					<tr>
						<td>표제/책임사항</td>
						<td>(10대와 통하는)법과 재판 이야기/ 이지현 지음</td>
					</tr>
					<tr>
						<td>발행사항</td>
						<td>서울: 철수와 영희, 2021</td>
					</tr>
					<tr>
						<td>형태사항</td>
						<td>204p.: 삽화; 22cm</td>
					</tr>
					<tr>
						<td>총서사항</td>
						<td>10대를 위한 책도둑 시리즈; 38</td>
					</tr>
					<tr>
						<td>주기사항</td>
						<td>청소년용</td>
					</tr>
					
				</table>
			</div>
			</div>
			<div class="detailWrapper">
				<div id="bookDetailTitle">상세정보</div>
				<div id="bookDetail">평화를 사랑하고 약자를 보호하는 법 이야기정의의 여신은 왜 눈을 가리고 있을까요? 형법에 처벌 조항이 없으면 범죄가 아닌가요? 국민 참여 재판은 어떻게 할까요? 인공 지능 판사가 더 공정한 재판을 할 수 있을까요? 사형 제도는 유지해야 하나요? 악법도 법이니까 지켜야 할까요? 이 책은 청소년들이 어렵고...
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>