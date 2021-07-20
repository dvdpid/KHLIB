<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 상세설명</title>
<link rel="stylesheet" href="${contextPath}/resources/css/bookMain.css"
	type="text/css">
<script src="resources/js/roomInfo.js" defer></script>
</head>
<body>
	<!-- 헤더부분 -->
	<c:import url="../common/menubar.jsp" />

	<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">도서게시판</h2>
			<h4 id="sideSubTitle" style="color: lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton"
			onclick="location.href='${contextPath}/bookSearch.bk';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg" /> 도서검색
			</h3>
		</div>
		<div class="sideButton"
			onclick="location.href='${contextPath}/book.bk';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg" />
				신착도서
			</h3>
		</div>
		<div class="sideButton"
			onclick="location.href='${contextPath}/recommend.bk';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/clipboard-list-solid.svg" />
				추천도서
			</h3>
		</div>
	</div>

	<!-- 메인 부분 -->
	<div class="main">
		<div id="toggleBooks">
			<a href="${contextPath}/book.bk">
				<div id="toggle-newarrival" class="toggle-size toggle-active">신착도서</div>
			</a> <span class="line"></span> <a href="${contextPath}/recommend.bk">
				<div id="toggle-recommend" class="toggle-size">추천도서</div>
			</a>
		</div>
		<c:if test="${bList ne null}">
			<div id="bookList">
				<c:forEach var="book" items="${bList}">
					<div class="bookItem">
						<c:url var="bDetail" value="detail.bk">
							<c:param name="bNo" value="${ book.bNo}"></c:param>
						</c:url>
						<a href="${bDetail}"> <img
							src="${contextPath}/resources/bkuploadFiles/${book.renameFileName}"
							class="bookImage" />
						</a>
					</div>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${ bList eq null}">
			<div class="bookItem" style="text-align: center;">등록 된 책이 없습니다.
			</div>
		</c:if>
		<c:if test="${bList ne null}">
			<div class="pages">
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<!-- 현재 선택된 페이지와 번호 버튼이 같을 때 -->
					<c:if test="${ p == pi.currentPage }">
						<span class="active">${ p }</span>
					</c:if>
					<!-- 현재 선택된 페이지와 번호 버튼이 같지 않을 때 -->
					<c:if test="${ p != pi.currentPage }">
						<c:url var="bListCheck" value="${ loc }">
							<c:param name="currentPage" value="${ p }"></c:param>
						</c:url>
						<a class="inactive" href="${ bListCheck  }">${ p }</a>
					</c:if>
				</c:forEach>
			</div>
			<div id="searchArea">
				<select name="searchType">
					<option value="title">도서명</option>
					<option value="author">저자</option>
					<option value="publisher">출판사</option>
				</select> <input type="text" name="searchText" /> <img
					src="resources/images/magnifying-glass.png"
					style="width: 20px; display: block; margin-top: auto; margin-bottom: auto;"
					alt="돋보기">
			</div>
		</c:if>
	</div>

	<script>
		$(function() {
			('#boardTable')
		})
	</script>
</body>
</html>