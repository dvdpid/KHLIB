<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화마당 이용안내</title>
<link rel="stylesheet" href="resources/css/cultureList.css?ver=2.0" type="text/css">
</head>
<body>
<c:import url="../common/menubar.jsp"></c:import>
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">문화마당</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='culture.cu';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				프로그램
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='cultureMypage.cu';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
				신청 내역
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='cultureInfo.cu';">
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
			프로그램</p>
		</div>
		<div id="searchDiv">
			<table id="searchTable">
				<tr>
					<td>강좌명</td>
					<td><input type="text" placeholder="강좌명을 입력해주세요"></td>
				</tr>
				<tr>
					<td>강사명</td>
					<td><input type="text" placeholder="강사명을 입력해주세요"></td>
				</tr>
				<tr>
					<td>일시</td>
					<td><input type="datetime-local"></td>
				</tr>
				<tr>
					<td>장소</td>
					<td><input type="text" placeholder="장소를 입력해주세요"></td>
				</tr>
				<tr>
					<td>교육 대상</td>
					<td><input type="text" placeholder="교육 대상을 입력해주세요"></td>
				</tr>
			</table>
			<button id="searchBtn">조회</button>
		</div>
		<div style="height: 30px;"></div>
		<div class="programList">
		<%-- <c:if test="${ empty cList || empty fList }">
			등록된 프로그램이 없습니다.
		</c:if>
		<c:if test="${ !empty cList || !empty fList }">
			<c:forEach var="c" items="${ list }"> --%>
				<div class="thumbList" align="center">
					<%-- <c:url var="cDetail" value="cdetail.co"> --%>
					<div class="cultureListIMG">
						<img src="resources/images/cultureListImg1.jpg">
						<p class="thumbTitle">도시공간 상상하기</p>
							<p class="thumbInfo">
								<span>일시 :</span> 2021년 6월 25일 19시 30분<br>
								<span>장소 :</span> 브링크 삼덕 아지트
							</p>					
					</div>
					<div class="cultureListIMG">
						<img src="resources/images/cultureListImg2.jpg">
						<p class="thumbTitle">스스로에 대한 정확한 말 찾아내기</p>
							<p class="thumbInfo">
								<span>일시 :</span> 2021년 6월 21일 19시 30분<br>
								<span>장소 :</span> 브링크 삼덕 아지트
							</p>
					</div>
					<div class="cultureListIMG">
						<img src="resources/images/cultureListImg3.jpg">
						<p class="thumbTitle">알아두면 쓸데없는 솔직한 영화 이야기</p>
							<p class="thumbInfo">
								<span>일시 :</span> 2021년 4월 18일 14시 00분<br>
								<span>장소 :</span> 브링크 삼덕 아지트
							</p>					
					</div>
					<%-- </c:url> --%>
				</div>
			<%-- </c:forEach>
		</c:if> --%>
		</div>
	</div>
</body>
</html>