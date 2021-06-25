<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 회원 </title>
<link href="<c:url value="/resources/css/admin/admin.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/admin/style.css"/>" rel='stylesheet' />
<script src="resources/js/admin.js" defer></script>
</head>
<body>
<!-- 헤더부분 -->
<c:import url="../common/admin_header.jsp"></c:import>
	
	
<!-- 사이드 부분 -->
<c:import url="../common/admin_side.jsp"></c:import>
	
<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/icon6.png"/>
			독서모임 관리</p>
		</div>
		<div class="empty" style="height:50px;"></div>
		<h3 align="left">독서 모임</h3><br>
		<div>
			<table class="type1">
				<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th><input type="checkbox"></th>

				</tr>
				</thead>
				<tbody>
				<tr>
					<td>25</td>
					<td class="subject"><a href="#a">자유로운 모임 글</a></td>
					<td><a href="#a">남나눔</a></td>
					<td>2021-06-15</td>
					<td><input type="checkbox"></td>
					
				</tr>
				<tr>
					<td>25</td>
					<td class="subject"><a href="#a">자유로운 모임 글 2</a></td>
					<td><a href="#a">도대담</a></td>
					<td>2021-06-16</td>
					<td><input type="checkbox"></td>
				</tr>
				</tbody>
			</table>
			<br>
			<input type="button" class="btn1" value="모임 삭제" style="float:right; margin-right: 75px;">
			<input type="button" class="btn1" value="모임 수정" style="float:right; margin-right: 75px;">
		</div>
	</div>
</body>
</html>