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
<style>
	#buttonTab{border-left: hidden; border-right: hidden;}
</style>
</head>
<body>
<!-- 헤더부분 -->
<c:import url="../common/admin_header.jsp"></c:import>
	
	
<!-- 사이드 부분 -->
<c:import url="../common/admin_side.jsp"></c:import>
	
<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/icon3.png"/>
			도서 관리</p>
		</div>
		<div class="empty" style="height:50px;"></div>
		<h3 align="left">도서 목록</h3><br>
		<div>
			<table class="type1">
				<thead>
				<tr>
					<th>번호</th>
					<th>책 제목</th>
					<th>저자</th>
					<th>출판사</th>
					<th>출판년도</th>
					<th>상태</th>
					<th>입고일</th>
					<th><input type="checkbox"></th>

				</tr>
				</thead>
				<tbody>
				<c:forEach var="b" items="${list }">
				<tr>
					<td>${b.bNo }</td>
					<td class="subject"><a href="#a">${b.bTitle }</a></td>
					<td><a href="#a">${ b.bWriter }</a></td>
					<td>${b.bCompany }</td>
					<td>${b.bDate }</td>
					<td>${b.bStatus }</td>
					<td>${b.entryDate }</td>
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
					<c:url var="before" value="book.ad">
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
						<c:url var="pagination" value="book.ad">
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
					<c:url var="after" value="book.ad">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
				
				</tbody>
			</table>
			<br>
			<input type="button" class="btn1" value="도서 등록"  onclick="location.href='bookInsertForm.ad'" style="float:right; margin-right: 75px;">
			<input type="button" class="btn1" value="도서 삭제" style="float:right; margin-right: 75px;">
		</div>
	</div>
</body>
</html>