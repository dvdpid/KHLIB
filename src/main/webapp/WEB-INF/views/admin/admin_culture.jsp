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
			<p><img id="titleImg1" src="resources/images/icon5.png"/>
			문화마당 관리</p>
		</div>
		<div class="empty" style="height:50px;"></div>
		<h3 align="left">문화마당 목록</h3><br>
		<div>
			<table class="type1">
				<thead>
				<tr>
					<th>번호</th>
					<th>문화 제목</th>
					<th>모집 인원</th>
					<th>접수 기간</th>
					<th>장소</th>
					<th>강사</th>
					<th>대상</th>
					<th><input type="checkbox"></th>

				</tr>
				</thead>
				<tbody>
				<tr>
					<td>25</td>
					<td class="subject"><a href="#a">문화 첫번째</a></td>
					<td><a href="#a">30</a></td>
					<td>2021-06-15</td>
					<td>역삼동</td>
					<td class="subject"><a href="#a">박신우</a></td>
					<td><a href="#a">성인</a></td>
					<td><input type="checkbox"></td>
					
				</tr>
				<tr>
					<td>25</td>
					<td class="subject"><a href="#a">문화 첫번째</a></td>
					<td><a href="#a">30</a></td>
					<td>2021-06-15</td>
					<td>역삼동</td>
					<td class="subject"><a href="#a">박신우</a></td>
					<td><a href="#a">성인</a></td>
					<td><input type="checkbox"></td>
				</tr>
				</tbody>
			</table>
			<br>
			<input type="button" class="btn1" value="문화마당 삭제" style="float:right; margin-right: 75px;">
			<input type="button" class="btn1" value="문화마당 등록" style="float:right; margin-right: 75px;">
			<br><br>
			
		</div>
	</div>
</body>
</html>