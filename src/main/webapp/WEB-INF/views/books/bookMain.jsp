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
			<!-- 도서 목록 -->
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
		<c:if test="${ bList eq null  }">
			<div id="nobook" style="align-text: center">등록 된 도서가 없습니다.</div>
		</c:if>
		<c:if test="${ bList ne null }">
			<!-- 페이징 영역 -->
			<div class="pages">
				<c:if test="${ !empty bList }">
					<!-- 페이징 부분 -->
					<div class="pagingArea" align="center">
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">[이전] &nbsp;</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url value="${ loc }" var="blistBack">
								<!-- loc : 현재 내 주소 -->
								<c:param name="page" value="${ pi.currentPage - 1 }" />
							</c:url>
							<a href="${ blistBack }">[이전]</a>
						</c:if>

						<!-- 페이지 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<font color="rgb(212, 129, 91)" size="4"><b>[${ p }]</b></font>
							</c:if>

							<c:if test="${ p ne pi.currentPage }">
								<c:url var="blistCheck" value="${ loc }">
									<c:param name="page" value="${ p }" />
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
							</c:url>
							<a href="${ bListNext }">&nbsp;[다음]</a>
						</c:if>
					</div>
				</c:if>
			</div>
			<!-- 검색 -->
			<div id="searchArea">
				<form action="bookSearch.bk">
					<select name="searchType">
						<option value="title">도서명</option>
						<option value="author">저자</option>
						<option value="publisher">출판사</option>
					</select><input type="text" name="searchText" />
					<button style="position: relative">검색</button>
				</form>
			</div>
		</c:if>
	</div>

	<script>
		
	</script>
</body>
</html>