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
			<div id="title"><h1>열람실 예약</h1></div>
			<form action="rupdate.ro" method="post">
				<div class="form">
					<table class="formTable">
						<colgroup>
						<col style="width: 111px">
						<col>
						</colgroup>
						<tbody>
							<tr>
								<td style="font-weight: 600; text-align: left;">신청 좌석</td>
								<td style="text-align: right;">
									${ rNo }번
									<input type="hidden" id="rNo" name="rNo" value="${ rNo }">
								</td>
								<td rowspan="2">
									<div class="seatArea">${ rNo }</div>
								</td>
							</tr>
							<tr>
								<td style="font-weight: 600; text-align: left;">신청자 이름</td>
								<td style="text-align: right;">
									${ loginUser.nickname }님
									<input type="hidden" name="nickName" value="${ nickname }">
								</td>
							</tr>
						</tbody>
					</table>
					<div class="agree">
						<p></p>
					</div>
					<div id="btnArea">
						<input type="submit" class="btnArea" value="좌석 예약">
						<input type="button" class="btnArea" onclick="window.close()" value="예약 취소">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>