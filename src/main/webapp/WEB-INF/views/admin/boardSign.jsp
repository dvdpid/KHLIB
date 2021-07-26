<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/roomSign.css?ver=1.0" type="text/css">
<link rel="stylesheet" href="resources/css/roomMain.css" type="text/css">
</head>
<body>

 <c:import url="../common/menubar.jsp"></c:import>

	<div class="mainArea">
		<div class="popup">
			<div id="title"><h1>게시글 관리</h1></div>
			<form action="boardDelete.ad" method="post">
			<input type="hidden" name="bNo" value="${board.bNo }">
				<div class="form">
					<table class="formTable">
						<colgroup>
						<col style="width: 111px">
						<col>
						</colgroup>
						<tbody>
							<tr>
								<td style="font-weight: 600; text-align: left;">게시글 번호</td>
								<td style="text-align: right;">	${ board.bNo }</td>
							</tr>
							<tr>
								<td style="font-weight: 600; text-align: left;">제목</td>
								<td style="text-align: right;">	${ board.bTitle }</td>
							</tr>
							<tr>
								<td style="font-weight: 600; text-align: left;">작성자</td>
								<td style="text-align: right;">	${ board.bWriter }</td>
							</tr>
							<tr>
								<td style="font-weight: 600; text-align: left;">작성일</td>
								<td style="text-align: right;">	${ board.bDate }</td>
							</tr>
						</tbody>
					</table>
					<div class="agree">
						<p></p>
					</div>
					<div id="btnArea">
						<input type="submit" class="btnArea" value="게시글 삭제">
						<input type="button" class="btnArea" onclick="window.close()" value="취소">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>