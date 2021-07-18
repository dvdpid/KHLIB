<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 예약</title>
<link rel="stylesheet" href="resources/css/roomSign.css?ver=1.0" type="text/css">
<link rel="stylesheet" href="resources/css/roomMain.css" type="text/css">
</head>
<body>

 <c:import url="../common/menubar.jsp"></c:import>

	<div class="mainArea">
		<div class="popup">
			<div id="title"><h1>유저 관리</h1></div>
			<form action="userDelete.ad" method="post">
				<div class="form">
					<table class="formTable">
						<colgroup>
						<col style="width: 111px">
						<col>
						</colgroup>
						<tbody>
							<c:forEach var="u" items="${uList }">
								<input type="hidden" name="no" value="${u.no }">
							<tr>
								<td style="font-weight: 600; text-align: left;">유저 번호</td>
								<td style="text-align: right;">	${ u.no }</td>
							</tr>
							<tr>
								<td style="font-weight: 600; text-align: left;">유저 아이디</td>
								<td style="text-align: right;">	${ u.id }</td>
							</tr>
							<tr>
								<td style="font-weight: 600; text-align: left;">닉네임</td>
								<td style="text-align: right;">	${ u.nickname }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="agree">
						<p></p>
					</div>
					<div id="btnArea">
						<input type="submit" class="btnArea" value="유저 탈퇴">
						<input type="button" class="btnArea" onclick="window.close()" value="취소">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>