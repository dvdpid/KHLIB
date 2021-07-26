<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 회원 </title>
<link href="<c:url value="/resources/css/admin/admin.css?ver=4.0"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/admin/style.css?ver=3.0"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/admin/admin_room.css"/>" rel='stylesheet' />
<link rel="stylesheet" href="resources/css/roomMain.css?ver=1.0" type="text/css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="resources/js/admin.js" defer></script>
</head>
<body>
<!-- 헤더부분 -->
<c:import url="../common/admin_header.jsp"></c:import>
	
	
<!-- 사이드 부분 -->
<c:import url="../common/admin_side.jsp"></c:import>
	
<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/laptop-solid.svg"/>
			열람실 현황</p>
		</div>
		<div class="level">
			<div id="level1">제 1 열람실</div>
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
							<div class="empty" onclick="alert('입실중인 좌석이 아닙니다.');">${ r.rNo }</div>
						</c:if>
					<c:if test="${ r.rStatus == 'Y' }">
						<div class="full" onclick="window.open('rSign.ad?rNo='+${ r.rNo }, 'roomSignPage', 'width=800, height=500, top=100, left=300,location=no');">
							${ r.rNo }</div>
					</c:if>
				</c:forEach>
			</div>
			<div id="seatView2">
				<c:forEach var="r" items="${ rlist }" begin="24" end="47">
					<c:if test="${ r.rStatus == 'N' }">
							<div class="empty" onclick="alert('입실중인 좌석이 아닙니다.');">${ r.rNo }</div>
					</c:if>
					<c:if test="${ r.rStatus == 'Y' }">
						<div class="full" onclick="window.open('rSign.ad?rNo='+${ r.rNo }, 'roomSignPage', 'width=800, height=500, top=100, left=300,location=no');">
							${ r.rNo }</div>
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