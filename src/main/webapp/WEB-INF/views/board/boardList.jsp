<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<link rel="stylesheet" href="resources/css/board/boardList.css?ver=1.0" type="text/css"> 
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">자유게시판</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='board.bo';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				자유게시판
			</h3>
		</div>
	</div>

<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p>
				<img id="titleImg1" src="resources/images/clipboard-list-solid.svg"/>
				자유 게시판
			</p>
		</div>
		<div id="searchDiv">
			<table id="searchTable">
				<tr>
					<td>
		 				<select id="searchCondition" name="searchCondition">
							<option value="title">제목</option>
							<option value="writer">작성자</option>
						</select>
					</td>
					<td><input type="search" id="searchValue" placeholder="입력해주세요"></td>
				</tr>
			</table>
			<button id="searchBtn" onclick="searchBoard();">조회</button>
		</div>
  	</div>
  	
  	<script>
		function searchBoard(){
			var search = $('#searchCondition').val();
			var searchContent = $('#searchValue').val();
			
			console.log(search);
			console.log(searchContent);
			
			location.href="search.bo?search=" + search + "&searchContent=" + searchContent;
		}
	</script>
  	
  	<div class="boardList">
  		<table id="boardListTable">
  			<tr>
  				<th>제목</th>
  				<th>작성자</th>
  				<th>작성일</th>
  				<th>조회수</th>
  			</tr>
  			
  			<c:if test="${ empty list }">
  				<tr>
  					<td colspan="4">등록된 게시글이 없습니다.</td>
 				</tr>
  			</c:if>
  			
  			<c:forEach var="b" items="${ list }">
		  		<tr onclick="location.href='${ contextPath }/bdetail.bo?bNo='+ ${ b.bNo } + '&page=' + ${ pi.currentPage }">
		  			<td>${ b.bTitle }</td>
		  			<td>${ b.bWriter }</td>
		  			<td>${ b.bDate }</td>
		  			<td>${ b.bCount }</td>
		  		</tr>
  			</c:forEach>
  			
  			
  			<tr>
				<td colspan="4" align="right" id="buttonTab">
					<c:if test="${ !empty loginUser }">
						&nbsp; &nbsp; &nbsp;
						<button onclick="location.href='boardWriteForm.bo';">글쓰기</button>
					</c:if>
				</td>
			</tr>
  			
  			<!-- 페이징 처리 -->
			<tr align="center" height="20" id="buttonTab">
				<td colspan="6">
				
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="blist.bo">
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
							<c:url var="pagination" value="blist.bo">
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
						<c:url var="after" value="blist.bo">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a>
					</c:if>
				</td>
			</tr>
  		
  		</table>
  	
  	</div>
  		
  		
  	<c:import url="../common/footer.jsp"/>
	
	<script>
		$(function(){
			
			$('#boardListTable td').mouseover(function(){
				$(this).parent().css({"background":"lightgray", "color":"white", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"none", "color":"black"});
			});
			
			
		});
		
		
	</script>
  	
  	
</body>
</html>