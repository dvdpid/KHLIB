<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 회원 </title>
<link href="<c:url value="/resources/css/admin/admin.css?ver=4.0"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/admin/style.css?ver=3.0"/>" rel='stylesheet' />
<script src="resources/js/admin.js" defer></script>
<style>
	.loginArea{margin-top: 3%; width: 500px; margin-left: auto; margin-right: auto;}
	#loginBtn {
		width: 99%; height: 70%; font-size: 15px; border: 0; 
		background: rgb(212, 129, 91); color: white; font-weight: bold; padding: 5px; margin:5px;
	}
	td {height: 50px;}
	input { width:300px; height: 70%;}
	a {text-decoration: none; font-size: 15px; color: black;}
</style>
</head>
<body>
<!-- 헤더부분 -->
<c:import url="../common/admin_header.jsp"></c:import>
	
	
	<div align="center" class="loginArea">
		<h1><span  style="color:rgb(212, 129, 91);">KH</span> 도서관</h1>
		<form action="login.ad" method="post">
			<table id="loginTable" style="text-align:center;">
				<tr>
					<th width="100px">아이디</th>
					<td colspan="2"><input type="text" name="id" placeholder="아이디"></td>
				</tr>			
				<tr>
					<th>비밀번호</th>
					<td colspan="2"><input type="password" name="pwd" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td colspan="3"><button id="loginBtn">로그인</button></td>
				</tr>
				<tr>
					<td colspan="3">
						<a href="memberFind.me">아이디 / 비밀번호 찾기</a>  |  
						<a href="signupForm.ad">회원가입</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<br>
		<c:import url="../common/footer.jsp"/>
</body>
</html>