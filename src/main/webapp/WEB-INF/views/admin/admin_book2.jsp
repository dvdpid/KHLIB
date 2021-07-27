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
<link rel="stylesheet" href="resources/css/bkGroupInsert.css?ver=3.0" type="text/css">
<link rel="stylesheet" href="resources/css/cultureList.css?ver=1.0" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<script src="resources/js/admin.js" defer></script>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>

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
		<div class="con">
		<div>
			<ul class="topLists" style="float:right; margin-right: 75px;">
				<li><h4><a href="book.ad">도서 목록</a></h4></li>
				<li><h4><a href="book2.ad">추천 도서 목록</a></h4></li>
			</ul>
		</div>
				
		<div class="empty" style="height:50px;"></div>
		<h3 align="left">이달의 추천 도서 목록</h3><br>
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
					<th>체크</th>

				</tr>
				</thead>
				<tbody>
				<c:if test="${ empty rlist }">
					<tr>
						<td colspan="8"> 등록된 도서가 없습니다. </td>
					</tr>
				</c:if>
				<c:if test="${ not rlist.isEmpty() }">
				<c:forEach var="rb" items="${rlist }">
				<tr class="list"  onclick="location.href='${ contextPath }/detail.bk?bNo=' + ${rb.bNo} + '&page=' + ${ pi.currentPage }">
					<td>${rb.bNo }</td>
					<td>${rb.bTitle }</td>
					<td>${rb.bWriter }</td>
					<td>${rb.bCompany }</td>
					<td>${rb.bDate }</td>
					<td>${rb.bStatus }</td>
					<td>${rb.entryDate }</td>
					<td onclick="event.cancelBubble=true"><input type="radio" name="rbNo" value="${rb.bNo  }"></td>
				</tr>
				</c:forEach>
				</c:if>
				</tbody>
			</table>
			
			<c:if test="${ !empty rlist }">
						<!-- 페이징 부분 -->
						<div class="pagingArea" align="center">
							<!-- [이전] -->
							<c:if test="${ rpi.currentPage <= 1 }"><div class="pageBtn">&lt;</div></c:if>
							<c:if test="${ rpi.currentPage > 1 }">
								<c:url value="book2.ad" var="blistBack"> <!-- loc : 현재 내 주소 -->
				            		<c:param name="page" value="${ rpi.currentPage - 1 }"/>
				            		<c:if test="${ searchValue ne null }">
				            			<c:param name="searchContent" value="${ searchValue }"/>
				            		</c:if>
				            	</c:url>
				            	<div class="pageBtn"><a href="${ blistBack }">&lt;</a></div>
							</c:if>
							
							<!-- 페이지 -->
							<c:forEach var="p" begin="${ rpi.startPage }" end="${ rpi.endPage }">
								<c:if test="${ p eq rpi.currentPage }">
									<div class="currentpageBtn"><b>${ p }</b></div>
								</c:if>
								
								<c:if test="${ p ne rpi.currentPage }">
									<c:url var="blistCheck" value="book2.ad">
				            			<c:param name="page" value="${ p }"/>
				            			<c:if test="${ searchValue ne null }">
					            			<c:param name="searchContent" value="${ searchValue }"/>
					            		</c:if>
				            		</c:url>
				            		<div class="pageBtn"><a href="${ blistCheck }">${ p }</a></div>
								</c:if>
							</c:forEach>
							
							<!-- [다음] -->
							<c:if test="${ rpi.currentPage >= rpi.maxPage }"><div class="pageBtn">&gt;</div></c:if>
							<c:if test="${ rpi.currentPage < rpi.maxPage }">
								<c:url value="book2.ad" var="blistNext"> <!-- loc : 현재 내 주소 -->
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
			<input type="button" class="btn5" value="추천 취소" id="inBtn" style="float:right; margin-right: 75px;" >
		</div>
		</div>
				<div class="empty" style="height:70px;"></div>
	</div>
	<script>
	        $('.btn2').on('click', function () {
	        	var bNo = $('input:radio[name=bNo]:checked').val();
	        	if(bNo == undefined){
					alert("체크를 해주세요");    		
	        	} else{
	        	window.open("bkDelete.ad?bNo="+bNo, 'booksSignPage', 'width=800, height=500, top=100, left=300,location=no');
	        	}
	        });
     </script>
	<script>
	        $('.btn3').on('click', function () {
	        	var bNo = $('input:radio[name=bNo]:checked').val();
	        	if(bNo == undefined){
					alert("체크를 해주세요");    		
	        	} else{
					location.href="bkUpdateForm.ad?bNo="+bNo;
	        	}
			});
     </script>
    <script>
	        $('.btn4').on('click', function () {
	        	var bNo = $('input:radio[name=bNo]:checked').val();
	        	if(bNo == undefined){
					alert("체크를 해주세요");    		
	        	} else{
					location.href="bkRecommend.ad?bNo="+bNo;
	        	}
			});
     </script>
       <script>
	        $('.btn5').on('click', function () {
	        	var bNo = $('input:radio[name=rbNo]:checked').val();
	        	if(bNo == undefined){
					alert("체크를 해주세요");    		
	        	} else{
	        		window.open("bkCancelRecommend.ad?bNo="+bNo, 'booksSignPage', 'width=800, height=600, top=150, left=400,location=no');
	        		window.opener.location.reload();
	        	}
			});
     </script>
     
     
	 <script>
		$(function(){
			$('.list').mouseover(function(){
				$(this).css({"background":"#EEEEEE", "color":"white", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"none", "color":"black"});
			});
		});
	</script>
	
</body>
</html>