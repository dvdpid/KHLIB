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
<script src="resources/js/roomInfo.js" defer></script>
<style>
#searchDiv {
    display: flex;
    margin: 25px 60px 0px 60px;
    background: lightgray;
    text-align: center;
}
user agent stylesheet
div {
    display: block;
}
.main {
    float: right;
    width: 75%;
    text-align: center;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
#mpTable {
    border-top: 2px solid lightgray;
    border-bottom: 2px solid lightgray;
    border-left: none;
    border-right: none;
    border-collapse: collapse;
    width: 100%;
    font-size: 13px;
    margin-bottom: 55px;
}
user agent stylesheet
table {
    border-collapse: separate;
    text-indent: initial;
    border-spacing: 2px;
}
.main {
    float: right;
    width: 75%;
    text-align: center;
}
#bkgroupListOuter {
    margin: 25px 80px 0px 10px;
    width: 65%;
    margin-left: auto;
}
user agent stylesheet
div {
    display: block;
}
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
		<div class="column">
			<div id="searchDiv">
			<table id="searchTable" style="margin-left: 130px;">
				<tbody><tr>
				
					<td>아이디</td>
					<td>${ loginUser.id }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${ loginUser.email }</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>${ loginUser.nickname }</td>
				</tr>				
			</tbody>
			
			</table>
			<table style="margin-left: 130px;">
			<tbody>
			<tr>
					<td>성명</td>
					<td>${ loginUser.name }</td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td>${ loginUser.phone }</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
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
			
	
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>