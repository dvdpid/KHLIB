<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>`
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<link rel="stylesheet" href="resources/css/board/boardDetail.css?ver=5.0" type="text/css">
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
			<p>${nList[0].nTitle }</p>
		</div>
		
		<br>
		 
		<div class="tableArea">
		<input type="hidden" name="bNo" value="${nList[0].nNo }">
		<table id="dtable" >
			<tr>
				<th width="100" height="30">제목</th>
				<td colspan="5" align="center">${nList[0].nTitle }</td>
			</tr>
			<tr>
				<th height="30">작성자</th>
				<td align="center">${ nList[0].nWriter }</td>
				<th>조회수</th>
				<td align="center">${ nList[0].nCount }</td>
				<th>작성일</th>
				<td align="center">${ nList[0].nDate }</td>
			</tr>
			<tr>
				<th colspan="6">내용</th>
			</tr>
			<tr>
				<td colspan="6" height="300" align="center">
					<% pageContext.setAttribute("newLineChar", "\r\n"); %> 
					${ fn:replace( nList[0].nContent, newLineChar, "<br>") }
				</td>
			</tr>
		</table>
		<div class="empty" style="height:80px;"></div>
		</div>
	</div>
</body>
</html>