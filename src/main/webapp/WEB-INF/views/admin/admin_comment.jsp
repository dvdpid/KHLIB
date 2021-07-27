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
<link rel="stylesheet" href="resources/css/cultureList.css?ver=1.0" type="text/css">
<link rel="stylesheet" href="resources/css/bkGroupInsert.css?ver=3.0" type="text/css">
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
		<div>
			<ul class="topLists" style="float:right; margin-right: 75px;">
				<li><h4><a href="board.ad">게시판 목록</a></h4></li>
				<li><h4><a href="comment.ad">댓글 목록</a></h4></li>
			</ul>
		</div>
		<div class="con">
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
				</tbody>
			</table>
			
				<c:if test="${ !empty cmList }">
						<!-- 페이징 부분 -->
						<div class="pagingArea" align="center">
							<!-- [이전] -->
							<c:if test="${ cmpi.currentPage <= 1 }"><div class="pageBtn">&lt;</div></c:if>
							<c:if test="${ cmpi.currentPage > 1 }">
								<c:url value="comment.ad" var="blistBack"> <!-- loc : 현재 내 주소 -->
				            		<c:param name="page" value="${ cmpi.currentPage - 1 }"/>
				            		<c:if test="${ searchValue ne null }">
				            			<c:param name="searchContent" value="${ searchValue }"/>
				            		</c:if>
				            	</c:url>
				            	<div class="pageBtn"><a href="${ blistBack }">&lt;</a></div>
							</c:if>
							
							<!-- 페이지 -->
							<c:forEach var="p" begin="${ cmpi.startPage }" end="${ cmpi.endPage }">
								<c:if test="${ p eq cmpi.currentPage }">
									<div class="currentpageBtn"><b>${ p }</b></div>
								</c:if>
								
								<c:if test="${ p ne cmpi.currentPage }">
									<c:url var="blistCheck" value="comment.ad">
				            			<c:param name="page" value="${ p }"/>
				            			<c:if test="${ searchValue ne null }">
					            			<c:param name="searchContent" value="${ searchValue }"/>
					            		</c:if>
				            		</c:url>
				            		<div class="pageBtn"><a href="${ blistCheck }">${ p }</a></div>
								</c:if>
							</c:forEach>
							
							<!-- [다음] -->
							<c:if test="${ cmpi.currentPage >= cmpi.maxPage }"><div class="pageBtn">&gt;</div></c:if>
							<c:if test="${ cmpi.currentPage < cmpi.maxPage }">
								<c:url value="comment.ad" var="blistNext"> <!-- loc : 현재 내 주소 -->
				            		<c:param name="page" value="${ rpi.currentPage + 1 }"></c:param>
				            		<c:if test="${ searchValue ne null }">
				            			<c:param name="searchContent" value="${ searchContent }"/>
				            		</c:if>
				            	</c:url>
				            	<div class="pageBtn"><a href="${ blistNext }">&gt;</a></div>
							</c:if>
						</div>
					</c:if>
			
			
			<br>
			<input type="button" class="btn2" id="inBtn" value="댓글 삭제" style="float:right; margin-right: 75px;">
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