<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 현황</title>
<link rel="stylesheet" href="resources/css/roomMain.css?ver=1.0" type="text/css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:import url="../common/menubar.jsp"></c:import>
	
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
			<p><img id="titleImg1" src="resources/images/laptop-solid.svg"/>
			열람실 현황</p>
		</div>
		<div class="level">
			<div id="level1">KH 열람실</div>
			<div class="seat">
				<div id="seat1">
					<div id="fullSeat"></div>
					<p>사용중</p>
				</div>
				<div id="seat2">
					<div id="emptySeat"></div>
					<p>사용 가능</p>
				</div>
			</div>
		</div>
		<div id="outstanding">예약석(${ listCount }/${ allListCount })</div>
		<div id="seatView">
			<div id="seatView1">
				<c:forEach var="r" items="${ rlist }" begin="0" end="23">
					<c:if test="${ r.rStatus == 'N' }">
						<c:if test="${ check == 0 }">
							<div class="empty" onclick="window.open('rSign.ro?rNo='+${ r.rNo }, 'roomSignPage', 'width=800, height=500, top=100, left=300,location=no');">
							${ r.rNo }</div>
						</c:if>
						<c:if test="${ check > 0 }">
							<div class="empty" onclick="alert('중복 예약이 불가능합니다.');">
							${ r.rNo }</div>
						</c:if>
					</c:if>
					<c:if test="${ r.rStatus == 'Y' }">
						<div class="full" onclick="alert('예약된 좌석입니다. 다른 좌석을 예약해주시기 바랍니다.');">${ r.rNo }</div>
					</c:if>
				</c:forEach>
			</div>
			<div id="seatView2">
				<c:forEach var="r" items="${ rlist }" begin="24" end="47">
					<c:if test="${ r.rStatus == 'N' }">
						<c:if test="${ check == 0 }">
							<div class="empty" onclick="window.open('rSign.ro?rNo='+${ r.rNo }, 'roomSignPage', 'width=800, height=500, top=100, left=300,location=no');">
							${ r.rNo }</div>
						</c:if>
						<c:if test="${ check > 0 }">
							<div class="empty" onclick="alert('중복 예약이 불가능합니다.');">
							${ r.rNo }</div>
						</c:if>
					</c:if>
					<c:if test="${ r.rStatus == 'Y' }">
						<div class="full" onclick="alert('예약된 좌석입니다. 다른 좌석을 예약해주시기 바랍니다.');">${ r.rNo }</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
	
	<c:if test="${ empty loginUser }">
		<script type="text/javascript">
			$(document).ready(function(){
				$('#seatView div').removeAttr('onclick');
				$("#seatView").click(function(){
					alert("로그인 후 이용 가능합니다.");
					document.location.href="loginForm.me";
				});
			});
		</script>
	</c:if>
</body>
</html>