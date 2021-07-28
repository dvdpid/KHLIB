<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="<c:url value="/resources/css/admin/admin.css"/>" rel='stylesheet' />
<link rel="stylesheet" href="resources/css/bkGroupInsert.css?ver=3.0" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
			<p><img id="titleImg1" src="resources/images/icon3.png"/>
			공지사항 등록</p>
		</div>
		<div class="empty" style="height:50px;"></div>
		
		<div>
		<form action="noticeInsert.ad" method="post">
			<table style="width: 80%; border-spacing: 5px 30px;">
				<tr>
					<td style="font-size: 20px;"><b>공지사항 제목</b></td>
					<td><input type="text" name="nTitle" size="90" required style="height:25px;"></td>
				</tr>
				<tr>
					<td style="font-size: 20px;"><b>내용</b></td>
					<td><textarea name="nContent" rows="15" cols="90"></textarea></td>
				</tr>
			</table>
			<div class="empty" style="height:50px;"></div>
				<div style="margin: 0px 60px;">
					<input type="submit" id="inBtn" value="공지사항 등록" class="btn"> &nbsp;
					<input type="reset" id="inBtn" value="새로 입력" onclick="resetInsertData()">
			</div>
		</form>
		
		</div>
	</div>
</body>
</html>