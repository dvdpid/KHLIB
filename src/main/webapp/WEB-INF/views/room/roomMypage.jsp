<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 내 자리</title>
<link rel="stylesheet" href="resources/css/roomMypage.css?ver=1.0" type="text/css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">열람실</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='room.ro';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				열람실 현황
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='roomMypage.ro';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
				내 자리
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='roomInfo.ro';">
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
			</div>
			<table id="mpTable">
				<tr>
					<th width="30%">좌석 예약</th>
					<th width="70%">${ loginUser.nickname }님</th>
				</tr>
				<c:if test="${ empty loginUser }">
					<tr>
						<td colspan="2">로그인 후 이용 가능합니다.</td>
					</tr>
				</c:if>
				<c:if test="${ empty rsList && !empty loginUser }">
					<tr>
						<td colspan="2">현재 예약된 좌석이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ !empty rsList }">
					<c:forEach var="rs" items="${ rsList }">
						<tr>
							<td>열람실</td>
							<td>제 1 열람실</td>
						</tr>
						<tr>
							<td>좌   석</td>
							<td>${ rs.rNo }번 좌석
							<input type="hidden" id="rNo" value="${ rs.rNo }">
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<table id="beforeTable">
				<tr>
					<th width="30%">이전 좌석</th>
					<th width="70%">${ loginUser.nickname }님</th>
				</tr>
				<c:if test="${ empty loginUser }">
					<tr>
						<td colspan="2">로그인 후 이용 가능합니다.</td>
					</tr>
				</c:if>
				<c:if test="${ empty rsBeforeList && !empty loginUser }">
					<tr>
						<td colspan="2">이전 예약된 내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ !empty rsBeforeList }">
					<c:forEach var="rsbf" items="${ rsBeforeList }">
						<tr>
							<td>열람실</td>
							<td>제 1 열람실</td>
						</tr>
						<tr>
							<td>좌   석</td>
							<td>${ rsbf.rNo }번 좌석</td>
						</tr>
						<tr>
							<td>입실 시간</td>
							<td>
								<fmt:setLocale value="en_US" scope="session"/>
								<fmt:parseDate value="${ rsbf.inTime }" var="inT" pattern="EEE MMM dd HH:mm:ss z yyyy" />
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ inT }"/>
							</td>
						</tr>
						<tr>
							<td>퇴실 시간</td>
							<td>
								<fmt:setLocale value="en_US" scope="session"/>
								<fmt:parseDate value="${ rsbf.outTime }" var="outT" pattern="EEE MMM dd HH:mm:ss z yyyy"/>
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ outT }"/>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		<br>
		
		
		
		
		
		<br>
	</div>
	<c:import url="../common/footer.jsp"/>
	<c:if test="${ empty loginUser }">
		<script type="text/javascript">
			$(document).ready(function(){
				alert("로그인 후 이용 가능합니다.");
				document.location.href="loginForm.me";
			});
		</script>
	</c:if>
	
	<script type="text/javascript">
		$(document).ready(function(){
			if(${loginUser.no} == 0){
				alert(${msg});
				document.location.href="loginForm.me";
			}
		});
		$(document).on('click', '#checkoutBtn', function(e){
			var uNo = ${ loginUser.no };
			var rNo = $('#rNo').val();
			console.log(rNo);
			if(rNo == 0){
				alert('예약된 좌석이 없습니다. 좌석 예약 후 반납이 가능합니다.');
				location.href="room.ro";
			} else{
				$.ajax({
					url: 'cancelRoom.ro',
					data: {uNo:uNo, rNo: rNo},
					success: function(data){
						alert('좌석이 반납되었습니다.');
						location.href="room.ro";
					}
				});
			}
		});
	</script>
</body>
</html>