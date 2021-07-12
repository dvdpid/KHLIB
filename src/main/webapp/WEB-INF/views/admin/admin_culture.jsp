<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 회원 </title>
<link href="<c:url value="/resources/css/admin/admin.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/admin/style.css"/>" rel='stylesheet' />
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
			<p><img id="titleImg1" src="resources/images/icon5.png"/>
			문화마당 관리</p>
		</div>
		<div class="empty" style="height:50px;"></div>
		<h3 align="left">문화마당 목록</h3><br>
		<div>
			<table class="type1">
				<thead>
				<tr>
					<th>번호</th>
					<th>문화 제목</th>
					<th>모집 인원</th>
					<th>모집 시작</th>
					<th>모집 마감</th>
					<th>강사</th>
					<th>대상</th>
					<th><input type="checkbox"></th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="c" items="${list }">
				<tr>
					<td>${c.cNo }</td>
					<td class="subject"><a href="#a">${c.cTitle }</a></td>
					<td><a href="#a">${ c.cTotal }</a></td>
					<td>${c.cStartDate }</td>
					<td>${c.cEndDate }</td>
					<td>${c.cInstructor }</td>
					<td>${c.cTarget }</td>
					<td><input type="checkbox"></td>
				</tr>
				</c:forEach>
				
				<tr align="center" height="20" id="buttonTab">
				<td colspan="6">
			
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="culture.ad">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="culture.ad">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="culture.ad">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
				</tbody>
			</table>
			<br>
			<input type="button" class="btn1" value="문화마당 등록" onclick="location.href='cultureInsertForm.ad'"  style="float:right; margin-right: 75px;">
			<input type="button" class="btn1" value="문화마당 삭제" style="float:right; margin-right: 75px;">
			<br><br>
			
		</div>
	</div>
</body>
</html>