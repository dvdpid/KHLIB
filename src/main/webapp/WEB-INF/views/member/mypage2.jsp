<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 상세설명</title>
<link rel="stylesheet" href="resources/css/roomInfo.css" type="text/css">
<link rel="stylesheet" href="resources/css/mypage.css" type="text/css">
<script src="resources/js/roomInfo.js" defer></script>
<style>


</style>
</head>
<body>
<!-- 헤더부분 -->

	<c:import url="../common/menubar.jsp"/>


	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">내 정보보기</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='memberCheck.me';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/info/notes.png"/>
				회원정보 수정
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='memberdelete.me';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/info/scissors.png"/>
				회원 탈퇴
			</h3>
		</div>

	</div>
	
<!-- 메인 부분 -->	
	
	
	<div class="centerText">
		<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/info/notes.png"/>
			${ loginUser.id } 님의 정보</p>
		</div>
			<div id="myinfo">
			
			<table id="searchTable" style="margin-left: 70px;">
				<tbody><tr>
				
					<td id="infoname">아이디</td>
					<td class="userinfot">${ loginUser.id }</td>
				</tr>
				<tr>
					<td id="infoname">이메일</td>
					<td class="userinfot">${ loginUser.email }</td>
				</tr>
				<tr>
					<td id="infoname">닉네임</td>
					<td class="userinfot">${ loginUser.nickname }</td>
				</tr>				
			</tbody>
			
			</table>
			<table style="margin-left: 70px;">
			<tbody>
			<tr>
					<td id="infoname">성명</td>
					<td class="userinfot">${ loginUser.name }</td>
				</tr>
				<tr>
					<td id="infoname">휴대전화</td>
					<td class="userinfot">${ loginUser.phone }</td>
				</tr>
				<tr>
					<td id="infoname">주소</td>
					<td class="userinfot"><c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
						<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
							(${ addr })
						</c:if>
						<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
							${ addr }
						</c:if>
						<c:if test="${ status.index eq 1 }">
							${ addr }
						</c:if>
						<c:if test="${ status.index eq 2 }">
							${ addr }
						</c:if>
					</c:forTokens></td>
				</tr>					
			</tbody>	
				
			</table>
			
					</div>	
				<div>
			<div id="roominfo">
				<p id="infop"><img id="titleImg1" src="resources/images/info/add.png"/>
			열람실 예약 확인</p>				
			</div>
			<div id="boardinfo">
				<p id="infop"><img id="titleImg1" src="resources/images/info/add.png"/>
			내가 작성한 글</p>	
			</div>
			
			<div id="cultureinfo">
				<p id="infop"><img id="titleImg1" src="resources/images/info/add.png"/>
			문화마당 신청 확인</p>	
			</div>
			
			<div id="bookinfo">
				<p id="infop"><img id="titleImg1" src="resources/images/info/add.png"/>
			독서모임 신청 확인</p>	
			</div>
			</div>
				</div>
			</div>	
			
			
	<c:import url="../common/footer.jsp"/>
</body>
</html>