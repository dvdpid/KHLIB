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
<style>
.qnatable {
	margin: auto;
}

.btn {
	font-size: 15px;
	background: rgb(212, 129, 91);
	color: white;
	padding: 5px 10px 5px 10px;
	margin: 5px;
	width: 100px;
	border: 0;
	border-radius: 7px;
}
</style>
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
		<div class="boardwrapper">
			<div class="mainTitle">
			<p>
				<img id="titleImg1" src="resources/images/user-check-solid.svg"/>
				묻고 답하기
			</p>
			</div>
			<br>
			<br>
			<div id="boardList">
			<table id="boardListTable">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>

				<c:if test="${ empty qList }">
					<tr>
						<td colspan="4">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>

				<c:forEach var="q" items="${ qList }">
					<c:url value="detail.cm" var="qDetail">
						<c:param name="qNo" value="${ q.qNo }" />
					</c:url>
					<tr class="board" onclick="location.href='${qDetail}'">
						<td class="numberColumn">${ q.qNo }</td>
						<td class="titleColumn">${ q.qTitle}</td>
						<td class="authorColumn">${ q.writer }</td>
						<td>${ q.qDate }</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${!empty qList }">
				<div id="pagination">
					<c:if test="${ !empty qList }">
						<!-- 페이징 부분 -->
						<div class="pagingArea" align="center">
							<!-- [이전] -->
							<c:if test="${ pi.currentPage <= 1 }">
								<div class="pageBtn">&lt;</div>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url value="${ loc }" var="qlistBack">
									<!-- loc : 현재 내 주소 -->
									<c:param name="page" value="${ pi.currentPage - 1 }" />
									<c:if test="${ searchValue ne null }">
										<c:param name="searchCondition" value="${ searchCondition }" />
										<c:param name="searchValue" value="${ searchValue }" />
									</c:if>
								</c:url>
								<div class="pageBtn">
									<a href="${ qlistBack }">&lt;</a>
								</div>
							</c:if>

							<!-- 페이지 -->
							<c:forEach var="p" begin="${ pi.startPage }"
								end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<div class="currentpageBtn">
										<b>${ p }</b>
									</div>
								</c:if>

								<c:if test="${ p ne pi.currentPage }">
									<c:url var="qlistCheck" value="${ loc }">
										<c:param name="page" value="${ p }" />
									</c:url>
									<div class="pageBtn">
										<a href="${ qlistCheck }">${ p }</a>
									</div>
								</c:if>
							</c:forEach>

							<!-- [다음] -->
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								<div class="pageBtn">&gt;</div>
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url value="${ loc }" var="bListNext">
									<!-- loc : 현재 내 주소 -->
									<c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
									<c:if test="${ searchValue ne null }">
										<c:param name="searchCondition" value="${ searchCondition }" />
										<c:param name="searchValue" value="${ searchValue }" />
									</c:if>
								</c:url>
								<div class="pageBtn">
									<a href="${ blistNext }">&gt;</a>
								</div>
							</c:if>
						</div>
					</c:if>
				</div>
			</div>
			</c:if>
			<c:if test="${loginUser != null }">
				<div id="writequestion">
					<button class="btn" id="questionRegister"
						onclick="location.href='questionForm.cm'">질문등록</button>
				</div>
			</c:if>
		</div>
	</div>
</body>
<script type="text/javascript">
	
</script>

</html>