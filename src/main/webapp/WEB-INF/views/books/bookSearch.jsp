<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서검색</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/bookSearch.css" type="text/css">
<script src="resources/js/roomInfo.js" defer></script>
</head>
<style>
	div#bookInfo {
		width: 100%;
		padding-left: 130px;
	}
	
	div#title {
		width: 100%;
	}
	
	.bookCategory {
		margin-right: 10px;
	}
</style>
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
		<div id="mainTitle">도서 검색</div>
		<div class="line"></div>
		<div id="searchArea">
			<form action="${ loc }">
				<select name="searchCondition">
					<option value="title">도서명</option>
					<option value="writer">저자</option>
					<option value="company">출판사</option>
				</select> <input name="searchValue" type="text">
				<button>검색</button>
			</form>
		</div>
		<div id="searchResult">
			<c:forEach var="book" items="${ bList }">
				<c:url var="bDetail" value="detail.bk">
					<c:param name="bNo" value="${book.bNo}"></c:param>
				</c:url>
				<div>
					<a href="${ bDetail }"> <img class="bookThumnail"
						style="width: 90px; float: left;"
						src="${contextPath}/resources/bkuploadFiles/${book.renameFileName}"
						alt="" />
						<div id="bookInfo">
							<div class="bookCategory">도서</div>
							<div id="title">${ book.bTitle }</div>
							<div id="writer">저자 : ${ book.bWriter }</div>
							<div id="company">출판사: ${ book.bCompany }</div>
							<div id="publishDate">발행년도: ${ book.bDate }</div>
						</div>
					</a>
				</div>
			</c:forEach>

		</div>
		<c:if test="${ bList ne null }">
			<!-- 페이징 영역 -->
			<div class="pages">
				<!-- 페이징 영역 -->
				<div class="pages">
					<c:if test="${ !empty bList }">
						<!-- 페이징 부분 -->
						<div class="pagingArea" align="center">
							<!-- [이전] -->
							<c:if test="${ pi.currentPage <= 1 }">[이전]&nbsp;</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url value="${ loc }" var="blistBack">
									<!-- loc : 현재 내 주소 -->
									<c:param name="page" value="${ pi.currentPage - 1 }" />
									<c:if test="${ searchValue ne null }">
										<c:param name="searchCondition" value="${ searchCondition }" />
										<c:param name="searchValue" value="${ searchValue }" />
									</c:if>
								</c:url>
								<a href="${ blistBack }">[이전]</a>
							</c:if>
							<!-- 페이지 -->
							<c:forEach var="p" begin="${ pi.startPage }"
								end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<font color="rgb(212, 129, 91)" size="4"><b>[${ p }]</b></font>
								</c:if>

								<c:if test="${ p ne pi.currentPage }">
									<c:url var="blistCheck" value="${ loc }">
										<c:param name="page" value="${ p }" />
										<c:if test="${ searchValue ne null }">
											<c:param name="searchCondition" value="${ searchCondition }" />
											<c:param name="searchValue" value="${ searchValue }" />
										</c:if>
									</c:url>
									<a href="${ blistCheck }">${ p }</a>
								</c:if>
							</c:forEach>

							<!-- [다음] -->
							<c:if test="${ pi.currentPage >= pi.maxPage }">&nbsp;[다음]</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url value="${ loc }" var="bListNext">
									<!-- loc : 현재 내 주소 -->
									<c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
									<c:if test="${ searchValue ne null }">
										<c:param name="searchCondition" value="${ searchCondition }" />
										<c:param name="searchValue" value="${ searchValue }" />
									</c:if>
								</c:url>
								<a href="${ bListNext }">&nbsp;[다음]</a>
							</c:if>
						</div>
					</c:if>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>