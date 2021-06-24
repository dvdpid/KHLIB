<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 내 자리</title>
<link rel="stylesheet" href="resources/css/roomMypage.css" type="text/css">
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">열람실</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				열람실 현황
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
				내 자리
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/clipboard-list-solid.svg"/>
				이용 안내
			</h3>
		</div>
	</div>
	
<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/user-check-solid.svg"/>
			내 자리</p>
		</div>
		<div class="empty" style="height:140px;"></div>
		<div class="infoSpace">
			<div class="btn">
				<button id="checkoutBtn">좌석 반납</button>
				<button id="cancelBtn">예약 취소</button>
			</div>
			<table id="mpTable">
				<tr>
					<th width="30%">좌석 예약</th>
					<th width="70%"></th>
				</tr>
				
				<%-- <c:if test="${ empty loginUser }">
					<td colspan="4" style="font-size:15px;">로그인 후 이용 가능합니다.</td>
				</c:if>
				<c:if test="${ !empty loginUser }">
					<c:forEach var="b" items="${ list }">
						<tr>
							<td align="center">${ b.bId }</td>
							<td align="left">
								<c:url var="bdetail" value="bdetail.bo">
									<c:param name="bId" value="${ b.bId }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
									<a href="${ bdetail }">${ b.bTitle }</a>
							</td>
							<td align="center">${ b.bWriter }</td>
							<td align="center">${ b.bCreateDate }</td>
							<td align="center">${ b.bCount }</td>
							<td align="center">
								<c:if test="${ ! empty b.originalFileName }">
									◎
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if> --%>
					<tr>
						<td>열람실</td>
						<td>제 1 열람실</td>
					</tr>
					<tr>
						<td>좌   석</td>
						<td>8번</td>
					</tr>
			</table>
			<table id="beforeTable">
				<tr>
					<th width="30%">이전 좌석</th>
					<th width="70%"></th>
				</tr>
				
				<%-- <c:if test="${ empty loginUser }">
					<td colspan="4" style="font-size:15px;">로그인 후 이용 가능합니다.</td>
				</c:if>
				<c:if test="${ !empty loginUser }">
					<c:forEach var="b" items="${ list }">
						<tr>
							<td align="center">${ b.bId }</td>
							<td align="left">
								<c:url var="bdetail" value="bdetail.bo">
									<c:param name="bId" value="${ b.bId }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
									<a href="${ bdetail }">${ b.bTitle }</a>
							</td>
							<td align="center">${ b.bWriter }</td>
							<td align="center">${ b.bCreateDate }</td>
							<td align="center">${ b.bCount }</td>
							<td align="center">
								<c:if test="${ ! empty b.originalFileName }">
									◎
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if> --%>
					<tr>
						<td>열람실</td>
						<td>제 1 열람실</td>
					</tr>
					<tr>
						<td>좌   석</td>
						<td>17번</td>
					</tr>
			</table>
		</div>
	</div>
</body>
</html>