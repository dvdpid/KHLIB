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
			<div id="title"><h1>공지사항 관리</h1></div>
			<div class="form">
				<table class="formTable">
					<tbody>
						<tr>
							<td style="font-size: 20px; font-weight: 600; text-align:center;">공지사항 삭제 완료</td>
						</tr>
					</tbody>
				</table>
				<div class="agree">
					<p></p>
				</div>
				<div id="btnArea">
					<input type="button" class="btnArea" onclick="window.close()" value="창 닫기">
				</div>
			</div>
		</div>
	</div>
		<script>
	opener.parent.parent.location.reload();
	</script>
</body>
</html>