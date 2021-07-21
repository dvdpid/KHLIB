<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>`
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<link rel="stylesheet" href="resources/css/board/boardDetail.css" type="text/css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- 헤더부분 -->
	<c:import url="../common/menubar.jsp"/>
	
<!-- 사이드 부분 -->
		<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">자유게시판</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='board.bo';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				자유게시판
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='noticeList.nt';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/icon7.png"/>
				공지사항
			</h3>
		</div>
	</div>

<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p>공지사항</p>
		</div>
		
		<br>
		 
	<div class="outer">
		<div class="tableArea">
		<input type="hidden" name="nNo" value=" ${nList[0].nNo } ">
		<table>
			<tr>
				<th>제목</th>
				<td colspan="5">${ nList[0].nTitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${ nList[0].nWriter }</td>
				<th>조회수</th>
				<td>${ nList[0].nCount }</td>
				<th>작성일</th>
				<td>${ nList[0].nDate }</td>
			</tr>
			<tr>
				<th colspan="6">내용</th>
			</tr>
			<tr>
				<td colspan="6">
					<% pageContext.setAttribute("newLineChar", "\r\n"); %> 
					${ fn:replace( nList[0].nContent, newLineChar, "<br>") }
				</td>
			</tr>
			<c:url var="nList" value="noticeList.nt">
				<c:param name="page" value="${ page }"/>
			</c:url>
			
			<tr>
				<td colspan="6" align="center">
					<button id="listBtn" onclick="location.href='${contextPath}/noticeList.nt?page='+${page}">목록으로</button>
				</td>
			</tr>
			
			</table>
		</div>

	
</body>
</html>