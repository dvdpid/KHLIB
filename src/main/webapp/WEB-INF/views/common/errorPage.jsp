<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align:center">
	<h1>Error</h1>
	<h2 style="color:red">1. ${ msg } </h2>
	<h2 style="color:red">2. ${ requestScope['javax.servlet.error.message']  }</h2>
	<a href="home.do">������������ ���ư���</a>
	</div>
</body>
</html>