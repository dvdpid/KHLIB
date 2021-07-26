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
			<div id="title"><h1>도서 관리</h1></div>
			<form action="booksDelete.ad" method="post">
				<div class="form">
					<table class="formTable">
						<colgroup>
						<col style="width: 111px">
						<col>
						</colgroup>
						<tbody>
							<c:forEach var="b" items="${bList }">
								<input type="hidden" name="bNo" value="${b.bNo }">
							<tr>
								<td style="font-weight: 600; text-align: left;">선택 도서</td>
								<td style="text-align: right;">	${ b.bTitle }</td>
							</tr>
							<tr>
								<td style="font-weight: 600; text-align: left;">저자</td>
								<td style="text-align: right;">	${ b.bWriter }</td>
							</tr>
							<tr>
								<td style="font-weight: 600; text-align: left;">출판사</td>
								<td style="text-align: right;">	${ b.bCompany }</td>
							</tr>
							<tr>
								<td style="font-weight: 600; text-align: left;">입고일</td>
								<td style="text-align: right;">	${ b.entryDate }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="agree">
						<p></p>
					</div>
					<div id="btnArea">
						<input type="submit" class="btnArea" value="도서 삭제">
						<input type="button" class="btnArea" onclick="window.close()" value="취소">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>