<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>묻고답하기</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/customerFAQ.css" type="text/css" />
<script src="resources/js/roomInfo.js" defer></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
</head>
<style>
.clickme {
	text-align: left;
	padding: 1em 0em;
}

.answer {
	text-align: left;
}

.qHead {
	width: 40px;
	height: 40px;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	color: white;
	border-radius: 50%;
	background-color: rgb(212, 129, 91);
	line-height: 40px;
}

form {
	padding: 0px 1em;
}


/* main part styling start */
table {
	width: 80%;
	border-spacing: 0;
	font-size: inherit;
	border-collapse: collapse;
	margin: 0px 10em;
}



td {
	display: table-cell;
	vertical-align: inherit;
}

.board-view th {
	text-align: left;
	font-weight: normal;
	background-color: #f4f5f8;
}

.board-view th, .board-view td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #d9d9d9;
	border-left: 1px solid #d9d9d9;
}

.buttons {
	background-color: rgb(212, 129, 91);
	border: none;
	color: #fff;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin-top: 20px;
	cursor: pointer;
	border-radius: 5px;
	align: center;
}
</style>

<body>
	<!-- 헤더부분 -->
	<c:import url="../common/menubar.jsp"></c:import>

	<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">고객센터</h2>
			<h4 id="sideSubTitle" style="color: lightgray">Kh Library</h4>
		</div>
		<div class="sideButton"
			onclick="location.href='${contextPath}/customer.cm';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg" /> 자주하는
				질문
			</h3>
		</div>
		<div class="sideButton"
			onclick="location.href='${contextPath}/qna.cm';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg" />
				묻고답하기
			</h3>
		</div>
	</div>

	<!-- 메인 부분 -->
	<div class="main">
		<div id="contents" class="contentArea">
			<div class="title">질문</div>
			<table class="board-view">
				<tr>
					<th id="title">제목</th>
					<td id="title-content">${ q.qTitle }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${ q.writer }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${ q.qDate }</td>
				</tr>
				<tr>
					<td colspan="2">${ q.qContent }</td>
				</tr>
			</table>
			<div class="title">답변</div>
			<form action="update.cm" method="post">
			<input type="hidden" name="qNo" value="${a.qNo}">
			<input type="hidden" name="aNo" value="${a.aNo}">
			<table class="board-view">
				<tr>
					<th>제목</th>
					<td><input type="text" name="aTitle" value="${a.aTitle}"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" id="writer" name="writer" value="${ loginUser.nickname }" readonly></td>
				</tr>
				<tr>
					<td colspan="2"><textarea cols="80" rows="20" id="aContent" name="aContent">${ a.aContent }</textarea></td>
				</tr>
			</table>
			<div style="text-align: center;">
				<input type="submit" class="buttons" value="등록" id="aSubmit"> <input type="reset" class="buttons" value="초기화">
			</div>
			</form>
		</div>
	</div>
</body>
</html>
