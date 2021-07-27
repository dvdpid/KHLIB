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
<link rel="stylesheet" href="resources/css/bkGroupInsert.css?ver=3.0" type="text/css">
<link rel="stylesheet" href="resources/css/cultureList.css?ver=1.0" type="text/css">
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
			<p><img id="titleImg1" src="resources/images/icon7.png"/>
			공지사항 관리</p>
		</div>
		<div class="con">
		<div class="empty" style="height:50px;"></div>
		<h3 align="left">공지사항 목록</h3><br>
		<div>
			<table class="type1">
				<thead>
				<tr>
					<th>번호</th>
					<th>공지사항 제목</th>
					<th>작성일</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>체크</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="n" items="${list }">
				<tr class="list"  onclick="location.href='${ contextPath }/ndetail.nt?nNo=' + ${n.nNo} + '&page=' + ${ pi.currentPage }">
					<td>${n.nNo }</td>
					<td>${n.nTitle }</td>
					<td>${ n.nDate }</td>
					<td>${n.nWriter }</td>
					<td>${n.nCount }</td>
					<td onclick="event.cancelBubble=true"><input type="radio" name="nNo" value="${n.nNo  }"></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			<c:if test="${ !empty list }">
						<!-- 페이징 부분 -->
						<div class="pagingArea" align="center">
							<!-- [이전] -->
							<c:if test="${ pi.currentPage <= 1 }"><div class="pageBtn">&lt;</div></c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url value="notice.ad" var="blistBack"> <!-- loc : 현재 내 주소 -->
				            		<c:param name="page" value="${ pi.currentPage - 1 }"/>
				            		<c:if test="${ searchValue ne null }">
				            			<c:param name="searchContent" value="${ searchValue }"/>
				            		</c:if>
				            	</c:url>
				            	<div class="pageBtn"><a href="${ blistBack }">&lt;</a></div>
							</c:if>
							
							<!-- 페이지 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<div class="currentpageBtn"><b>${ p }</b></div>
								</c:if>
								
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="blistCheck" value="notice.ad">
				            			<c:param name="page" value="${ p }"/>
				            			<c:if test="${ searchValue ne null }">
					            			<c:param name="searchContent" value="${ searchValue }"/>
					            		</c:if>
				            		</c:url>
				            		<div class="pageBtn"><a href="${ blistCheck }">${ p }</a></div>
								</c:if>
							</c:forEach>
							
							<!-- [다음] -->
							<c:if test="${ pi.currentPage >= pi.maxPage }"><div class="pageBtn">&gt;</div></c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url value="notice.ad" var="blistNext"> <!-- loc : 현재 내 주소 -->
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
			<input type="button" class="btn2" id="inBtn" value="공지사항 삭제"  style="float:right; margin-right: 75px;" >
			<input type="button" class="btn3" id="inBtn" value="공지사항 수정"  style="float:right; margin-right: 75px;" >
			<input type="button" class="btn1" id="inBtn" value="공지사항 추가"  onclick="location.href='noticeInsertForm.ad'" style="float:right; margin-right: 75px;">
		</div>
		</div>
	</div>
	<script>
	        $('.btn2').on('click', function () {
	        	var nNo = $('input:radio[name=nNo]:checked').val();
	        	if(nNo == undefined){
					alert("체크를 해주세요");    		
	        	} else{
	        	window.open("noticeDeleteForm.ad?nNo="+nNo, 'booksSignPage', 'width=800, height=500, top=100, left=300,location=no');
	        	}
	        });
     </script>
	<script>
	        $('.btn3').on('click', function () {
	        	var nNo = $('input:radio[name=nNo]:checked').val();
	        	if(nNo == undefined){
					alert("체크를 해주세요");    		
	        	} else{
					location.href="noticeUpdateForm.ad?nNo="+nNo;
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