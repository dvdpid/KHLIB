<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서상세</title>
<link rel="stylesheet" href="${contextPath}/resources/css/bookDetail.css?ver=1.0" type="text/css">
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
		<div class="sideButton" onclick="location.href='${contextPath}/bookSearch.bk';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				도서검색
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='${contextPath}/book.bk';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
				신착도서
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='${contextPath}/recommend.bk';">
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
				<img style="width: 250px;" src="${contextPath}/resources/bkuploadFiles/${book.renameFileName}" />
			</div>
			<div class="infoArea">
			<div class="titleArea">
				<div class="formArea">
				<div id="bookCategory">도서</div>
				<c:if test="${ book.bRecommend eq 'Y' }">
				<div class="recommend">추천도서</div>
				</c:if>
				</div>
				<div id="bookTitle">${ book.bTitle }</div>
				
			</div>
			<div>
				<table>
					<tr>
						<td>출판사</td>
						<td>${ book.bCompany }</td>
					</tr>
					<tr>
						<td>발행년도</td>
						<td>${ book.bDate }</td>
					</tr>
					<tr>
						<td>형태사항</td>
						<td>${ book.bForm }</td>
					</tr>
					<tr>
						<td>표준번호</td>
						<td>${ book.bStandardNo }</td>
					</tr>
					<tr>
						<td>분류기호</td>
						<td>${ book.bCallNo }</td>
					</tr>
					<tr>
						<td>도서관</td>
						<td>KHLIB</td>
					</tr>
				</table>
			</div>
			</div>
			<div class="detailWrapper">
				<div id="bookDetailTitle">상세정보</div>
				<div id="bookDetail">
				${ book.bContent }
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>