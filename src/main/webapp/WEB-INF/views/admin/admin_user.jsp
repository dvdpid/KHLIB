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
			<p><img id="titleImg1" src="resources/images/icon1.png"/>
			회원 관리</p>
		</div>
		<div class="empty" style="height:50px;"></div>
		<h3 align="left">회원 목록</h3><br>
		<div>
			<table class="type1">
				<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>생일</th>
					<th>성별</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>주소</th>
					<th>체크</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>25</td>
					<td class="subject"><a href="#a">user01</a></td>
					<td><a href="#a">남나눔</a></td>
					<td>아무개</td>
					<td>2011.08.22</td>
					<td>남</td>
					<td>010-1111-2222</td>
					<td>de@dd.dd</td>
					<td>서울시 역삼동</td>
					<td><input type="checkbox"></td>
					
				</tr>
				<tr>
					<td>25</td>
					<td class="subject"><a href="#a">user02</a></td>
					<td><a href="#a">도대담</a></td>
					<td>아무개</td>
					<td>2011.08.22</td>
					<td>남</td>
					<td>010-2222-3333</td>
					<td>dd@dd.dd</td>
					<td>경기도 군포시</td>
					<td><input type="checkbox"></td>
				</tr>
				</tbody>
			</table>
<!-- 			    <ol class="paging"> -->
<!-- 				    <li class="first"><a href="#a">첫페이지</a></li> -->
<!-- 				    <li class="prev"><a href="#a">이전페이지</a></li> -->
<!-- 				    <li class="on"><a href="#a">1</a></li> -->
<!-- 				    <li><a href="#a">2</a></li> -->
<!-- 				    <li><a href="#a">3</a></li> -->
<!-- 				    <li class="next"><a href="#a">다음페이지</a></li> -->
<!-- 				    <li class="last"><a href="#a">마지막페이지</a></li> -->
<!-- 			    </ol> -->
		</div>
	</div>
</body>
</html>