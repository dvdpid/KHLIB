<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 신청</title>
<link rel="stylesheet" href="resources/css/programSign.css" type="text/css">
<link rel="stylesheet" href="resources/css/cultureList.css" type="text/css">
</head>
<body>

 <c:import url="../common/menubar.jsp"></c:import>

	<div class="mainArea">
		<div class="popup">
			<div id="title"><h1>프로그램 신청</h1></div>
			<form action="cupdate.cu" method="post">
				<div class="form">
					<table class="formTable">
						<colgroup>
						<col style="width: 150px">
						<col>
						</colgroup>
						<tbody>
							<tr>
								<td style="font-weight: 600; text-align: left;">신청 프로그램</td>
								<td style="text-align: right;">
									${ culture.cTitle }
									<input type="hidden" id="cNo" name="cNo" value="${ culture.cNo }">
								</td>
								<td rowspan="2">
									<div class="seatArea">${ approvalCount }/${ culture.cTotal }</div>
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
						<input type="submit" class="btnArea" value="프로그램 신청">
						<input type="button" class="btnArea" onclick="window.close()" value="신청 취소">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>