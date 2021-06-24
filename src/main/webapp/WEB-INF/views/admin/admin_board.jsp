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
<c:import url="common/admin_header.jsp"></c:import>
	
<!-- 사이드 부분 -->
<c:import url="common/admin_side.jsp"></c:import>
<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/icon2.png"/>
			게시글/댓글 관리</p>
		</div>
		<div class="empty" style="height:50px;"></div>
		<h3 align="left">게시글 목록</h3><br>
		<div>
			<table class="type1">
<!-- 				<colgroup> -->
<!-- 				<col width="50px"> -->
<!-- 				<col width="72px"> -->
<!-- 				<col width="52px"> -->
<!-- 				<col width="76px"> -->
<!-- 				<col width="52px"> -->
<!-- 				<col width="52px"> -->
<!-- 				</colgroup> -->
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
					<td class="subject"><a href="#a">자유로운 글 첫번째</a></td>
					<td><a href="#a">남나눔</a></td>
					<td>2021-06-15</td>
					<td><input type="checkbox"></td>
					
				</tr>
				<tr>
					<td>25</td>
					<td class="subject"><a href="#a">자유로운 글 두번째</a></td>
					<td><a href="#a">도대담</a></td>
					<td>2021-06-16</td>
					<td><input type="checkbox"></td>
				</tr>
				</tbody>
			</table>
			<br>
			<input type="button" class="btn1" value="게시글 삭제" style="float:right; margin-right: 75px;">
			<br><br>
			
			
			
			<h3 align="left">댓글 목록</h3><br>
			<table class="type1">
				<thead>
				<tr>
					<th>번호</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일</th>
					<th><input type="checkbox"></th>

				</tr>
				</thead>
				<tbody>
				<tr>
					<td>25</td>
					<td class="subject"><a href="#a">댓글 첫번째</a></td>
					<td><a href="#a">남나눔</a></td>
					<td>2021-06-15</td>
					<td><input type="checkbox"></td>
					
				</tr>
				<tr>
					<td>25</td>
					<td class="subject"><a href="#a">댓글 두번째</a></td>
					<td><a href="#a">도대담</a></td>
					<td>2021-06-16</td>
					<td><input type="checkbox"></td>
				</tr>
				</tbody>
			</table>
			<br>
			<input type="button" class="btn2" value="댓글 삭제"  style="float: right; margin-right: 75px;">
			<br>
		</div>
	</div>
</body>
</html>