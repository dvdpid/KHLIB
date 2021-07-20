<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서 모임 삭제</title>
<link rel="stylesheet" href="resources/css/roomSign.css?ver=1.0" type="text/css">
<link rel="stylesheet" href="resources/css/roomMain.css" type="text/css">
</head>
<body>

 <c:import url="../common/menubar.jsp"></c:import>

	<div class="mainArea">
		<div class="popup">
			<div id="title"><h1>독서 모임 삭제</h1></div>
			<form action="bgDelete.ad" method="post">
			<input type="hidden" name="gNo" value="${gList[0].gNo }">
				<div class="form">
					<table class="formTable">
						<colgroup>
						<col style="width: 111px">
						<col>
						</colgroup>
						<tbody>
							<tr>
								<td style="font-weight: 600; text-align: left;">문화 번호</td>
								<td style="text-align: right;">	${gList[0].gNo }</td>
							</tr>
							<tr>
								<td style="font-weight: 600; text-align: left;">문화 제목</td>
								<td style="text-align: right;">	${gList[0].gName }</td>
							</tr>
							<tr>
								<td style="font-weight: 600; text-align: left;">작성자</td>
								<td style="text-align: right;">	${gList[0].gWriter }</td>
							</tr>
							<tr>
								<td style="font-weight: 600; text-align: left;">책 제목</td>
								<td style="text-align: right;">	${gList[0].gbTitle }</td>
							</tr>
							<tr>
								<td style="font-weight: 600; text-align: left;">모임 날짜</td>
								<td style="text-align: right;">	${gList[0].gDate }</td>
							</tr>
						</tbody>
					</table>
					<div class="agree">
						<p></p>
					</div>
					<div id="btnArea">
						<input type="submit" class="btnArea" value="문화 삭제">
						<input type="button" class="btnArea" onclick="window.close()" value="취소">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>