<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화마당 관리</title>
<link rel="stylesheet" href="resources/css/roomSign.css?ver=1.0" type="text/css">
<link rel="stylesheet" href="resources/css/roomMain.css" type="text/css">
</head>
<body>

 <c:import url="../common/menubar.jsp"></c:import>

	<div class="mainArea">
		<div class="popup">
			<div id="title"><h1>문화 관리</h1></div>
			<div class="form">
				<table class="formTable">
					<tbody>
						<tr>
							<td style="font-size: 20px; font-weight: 600; text-align:center;">문화삭제  완료</td>
						</tr>
					</tbody>
				</table>
				<div class="agree">
					<!-- <input type="checkbox" id="check"><span>[필수]</span>좌석을 예약하시겠습니까?</label> -->
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