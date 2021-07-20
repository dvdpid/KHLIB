<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/customerService.css" type="text/css">
<script src="resources/js/roomInfo.js" defer></script>
</head>

<body>
	<c:import url="../common/menubar.jsp"></c:import>

	<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">고객센터</h2>
			<h4 id="sideSubTitle" style="color: lightgray">Kh Library</h4>
		</div>
		<div class="sideButton"
			onclick="location.href='${contextPath}/customer.cm';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg" /> 자주하는
				질문
			</h3>
		</div>
		<div class="sideButton"
			onclick="location.href='${contextPath}/qna.cm';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg" />
				묻고답하기
			</h3>
		</div>
	</div>

	<!-- 메인 부분 -->
	<div class="main">
		<div class="wrapper">
			<div class="boardTitle"
				style="font-weight: bold; font-size: 2rem; text-align: left;">묻고답하기</div>
			<table>
				<thead>
					<tr>
						<td class="numberColumn">번호</td>
						<td class="titleColumn">제목</td>
						<td class="authorColumn">작성자</td>
						<td class="dateColumn">작성일</td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ qList != null }">
							<c:forEach items="${ qList }" var="q">
								<c:url value="detail.cm" var="qDetail">
									<c:param name="qNo" value="${ q.qNo }" />
								</c:url>
								<tr onclick="location.href='${qDetail}'">
									<td class="numberColumn">${ q.qNo }</td>
									<td class="titleColumn">${ q.qTitle} </td>
									<td class="authorColumn">${ q.writer }</td>
									<td>${ q.qDate }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:when test="${ qList == null}">
							<tr>
								<td col="4" text-align="center">등록 된 질문이 없습니다.</td>
							</tr>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<c:if test="${!empty qList }">
				<div id="pagination">
				<!-- 이전 -->
					<c:if test="${ pi.currentPage <= 1 }"><a href="${ qListBack }"><div class="arrow pageButton">&lt;</div></a></c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url value="${ loc }" var="qListBack"> <!-- loc : 현재 내 주소 -->
            					<c:param name="page" value="${ pi.currentPage - 1 }"/>
            						<c:if test="${ searchValue ne null }">
            							<c:param name="searchCondition" value="${ searchCondition }"/>
            							<c:param name="searchValue" value="${ searchValue }"/>
            						</c:if>
            				</c:url>
            	<a href="${ qListBack }"><div class="arrow pageButton">&lt;</div></a>
			</c:if>	
			<!-- 이전 -->
			<!-- 페이지 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<div class="pageNumber activeNumber pageButton">${ p }</div>
				</c:if>
				
				<c:if test="${ p ne pi.currentPage}">
					<c:url var="qListCheck" value="${ loc }">
						<c:param name="page" value="${ p }" />
						<c:if test="${ searchValue ne null }">
							<c:param name="searchCondition" value="${ searchCondition }" />
							<c:param name="searchValue" value="${ searchValue }" />
						</c:if>
					</c:url>
					<a href="${ qListCheck }"><div class="pageNumber pageButon">${ p }</div></a>
				</c:if>
			</c:forEach>	
				
			<!-- 페이지 -->
			<!-- 다음 -->
			<c:if test="${ pi.currentPage >= pi.maxPage }"><div class="arrow  pageButton">&gt;</div></c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url value="${ loc }" var="qListNext"> <!-- loc : 현재 내 주소 -->
            		<c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
            		<c:if test="${ searchValue ne null }">
            			<c:param name="searchCondition" value="${ searchCondition }"/>
            			<c:param name="searchValue" value="${ searchValue }"/>
            		</c:if>
            	</c:url>
            	<div class="arrow pageButton"><a href="${ qListNext }">&gt;</a></div>
			</c:if>
			
			<!-- 다음 -->
				
				<%-- <div class="arrow pageButton">&lt;</div>
				<div class="pageNumber activeNumber  pageButton">1</div>
				<div class="pageNumber  pageButton">2</div>
				<div class="pageNumber  pageButton">3</div>
				<div class="arrow  pageButton">&gt;</div> --%>
				</div>
			</c:if>
		</div>
	</div>
</body>
<script type="text/javascript">

</script>

</html>