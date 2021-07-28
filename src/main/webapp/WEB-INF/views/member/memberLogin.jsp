<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	.loginArea{margin-top: 8%;}
	#loginBtn {
width: 99%; height: 70%; font-size: 15px; border: 0; 
		background: rgb(212, 129, 91); color: white; font-weight: bold; padding: 5px; margin:2px;
=======
	}
	td {height: 50px;}
	input { width:300px; height: 70%;}
	#loginTable a {text-decoration: none; font-size: 15px; color: black;}
	/* footer{ position: absolute; bottom:0; width: 100%;} */
	footer{ position: fixed; bottom: 0;}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div align="center" class="loginArea">
		<a style="color: black;font-size:28px;font-weight:bold;"><b style="color:rgb(212, 129, 91); font-size:28px;">KH</b>도서관 </a>
		<hr align="center" style="background: black; width: 19.5%;">
		<form action="login.me" method="post">
			<table id="loginTable" style="text-align:center;">
				<tr>
					
					<td colspan="2"><input type="text" name="id" placeholder="아이디"></td>
				</tr>			
				<tr>
					
					<td colspan="2"><input type="password" name="pwd" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td colspan="3"><button id="loginBtn">로그인</button></td>
				</tr>
				<tr>
					<td colspan="3">
						<a href="memberFind.me">아이디 / 비밀번호 찾기</a>  |  
						<a href="enrollView.me">회원가입</a>
					</td>
				</tr>
			</table>
		</form>
	<br>
	</div>
	
	
	<footer>
	<c:import url="../common/footer.jsp"/>
	</footer>
</body>
</html>