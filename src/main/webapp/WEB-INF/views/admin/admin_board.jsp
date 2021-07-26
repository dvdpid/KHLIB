<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 회원 </title>
<link href="<c:url value="/resources/css/admin/admin.css?ver=4.0"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/admin/style.css?ver=3.0"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/admin/admin_searchd.css"/>" rel='stylesheet' />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<script src="resources/js/admin.js" defer></script>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>

</head>
<body>
<!-- 헤더부분 -->
<c:import url="../common/admin_header.jsp"></c:import>
	
	
<!-- 사이드 부분 -->
<c:import url="../common/admin_side.jsp"></c:import>
	
<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/icon2.png"/>
			게시글 관리</p>
		</div>
		<div class="con">
		<div class="empty" style="height:50px;"></div>
		<h3 align="left">자유게시판 목록</h3><br>
		<div class="search-box" style="float:right; margin-right: 75px;">
    	  	<select id="searchCondition" class="search-txt" name="searchCondition">
				<option value="title">제목</option>
				<option value="writer">작성자</option>
			</select>
    	  <input type="text" class="search-txt" id="searchValue" name="" placeholder="검색">
     		 <a class="search-btn" onclick="searchBoard();">
        		<i class="fas fa-search"></i>
    		  </a>
  		</div>
	<script type="text/javascript">
		function searchBoard(){
			var search = $('#searchCondition').val();
			var searchContent = $('#searchValue').val();
			
			location.href="searchBoard.ad?search=" + search + "&searchContent=" + searchContent;
		}
	</script>
	
		<div>
			<table class="type1">
				<thead>
				<tr>
					<th>번호</th>
					<th>게시글 제목</th>
					<th>게시글 작성자</th>
					<th>조회수</th>
					<th>작성일</th>
					<th>체크</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="b" items="${bList }">
				<tr class="bList" onclick="location.href='${ contextPath }/bDetail.ad?bNo=' + ${b.bNo} + '&page=' + ${ pi.currentPage }">
					<td>${b.bNo }</td>
					<td>${b.bTitle }</td>
					<td>${ b.bWriter }</td>
					<td>${b.bCount }</td>
					<td>${b.bDate }</td>
					<td onclick="event.cancelBubble=true"><input type="radio" name="bNo" value="${b.bNo }"></td>
				</tr>
				</c:forEach>
				
				<tr align="center" height="20" id="buttonTab">
				<td colspan="8">
			
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="board.ad">
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
						<c:url var="pagination" value="board.ad">
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
					<c:url var="after" value="board.ad">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
				</tbody>
			</table>
			<br>
			<input type="button" class="btn1" value="게시글 삭제" style="float:right; margin-right: 75px;">
			<br><br>
		</div>
		
		<div class="empty" style="height:50px;"></div>
		
		<h3 align="left">댓글 목록</h3><br>
		<div>
			<table class="type1">
				<thead>
				<tr>
					<th>댓글 번호</th>
					<th>게시글 번호</th>
					<th>댓글 내용</th>
					<th>댓글 작성자</th>
					<th>작성일</th>
					<th>체크</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="cm" items="${cmList }">
				<tr class="bList" onclick="location.href='${ contextPath }/bDetail.ad?bNo=' + ${cm.bNo} + '&page=' + ${ cmpi.currentPage }">
					<td>${cm.cNo }</td>
					<td>${cm.bNo }</td>
					<td>${cm.cContent }</td>
					<td>${cm.cWriter }</td>
					<td>${cm.cDate }</td>
					<td onclick="event.cancelBubble=true"><input type="radio" name="cNo" value="${cm.cNo }"></td>
				</tr>
				</c:forEach>
				
				<tr align="center" height="20" id="buttonTab">
				<td colspan="8">
			
				<!-- [이전] -->
				<c:if test="${ cmpi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ cmpi.currentPage > 1 }">
					<c:url var="before" value="board.ad">
						<c:param name="page" value="${ cmpi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ cmpi.startPage }" end="${ cmpi.endPage }">
					<c:if test="${ p eq cmpi.currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne cmpi.currentPage }">
						<c:url var="pagination" value="board.ad">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ cmpi.currentPage >= cmpi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ cmpi.currentPage < cmpi.maxPage }">
					<c:url var="after" value="board.ad">
						<c:param name="page" value="${ cmpi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
				</tbody>
			</table>
			<br>
			<input type="button" class="btn2" value="댓글 삭제" style="float:right; margin-right: 75px;">
			<br><br>
		</div>
		</div>
		
	</div>
	<script>
	        $('.btn1').on('click', function () {
	        	var bNo = $('input:radio[name=bNo]:checked').val();
	        	if(bNo == undefined){
					alert("체크를 해주세요");    		
	        	} else{
	        	window.open("boardDeleteForm.ad?bNo="+bNo, 'boardSignPage', 'width=800, height=500, top=100, left=300,location=bNo');
	        	}
	        });
     </script>
     <script>
	        $('.btn2').on('click', function () {
	        	var cNo = $('input:radio[name=cNo]:checked').val();
	        	if(cNo == undefined){
					alert("체크를 해주세요");    		
	        	} else{
	        	window.open("cmDeleteForm.ad?cNo="+cNo, 'commentsSignPage', 'width=800, height=500, top=100, left=300,location=cNo');
	        	}
	        });
     </script>
      <script>
		$(function(){
			$('.bList').mouseover(function(){
				$(this).css({"background":"#EEEEEE", "color":"white", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"none", "color":"black"});
			});
		});
	</script>
</body>
</html>