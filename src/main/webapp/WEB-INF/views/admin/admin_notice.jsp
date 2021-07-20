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
				<tr class="list"  onclick="location.href='${ contextPath }/nDetail.ad?nNo=' + ${n.nNo} + '&page=' + ${ pi.currentPage }">
					<td>${n.nNo }</td>
					<td class="subject"><a href="#a">${n.nTitle }</a></td>
					<td><a href="#a">${ n.nDate }</a></td>
					<td>${n.nWriter }</td>
					<td>${n.nCount }</td>
					<td><input type="radio" name="nNo" value="${n.nNo  }"></td>
				</tr>
				</c:forEach>
				
				<tr align="center" height="20" id="buttonTab">
				<td colspan="6">
			
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="notice.ad">
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
						<c:url var="pagination" value="notice.ad">
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
					<c:url var="after" value="notice.ad">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
				
				</tbody>
			</table>
			<br>
			<input type="button" class="btn2" value="공지사항 삭제"  style="float:right; margin-right: 75px;" >
			<input type="button" class="btn3" value="공지사항 수정"  style="float:right; margin-right: 75px;" >
			<input type="button" class="btn1" value="공지사항 추가"  onclick="location.href='noticeInsertForm.ad'" style="float:right; margin-right: 75px;">
		</div>
	</div>
	<script>
	        $('.btn2').on('click', function () {
	        	var bNo = $('input:radio[name=nNo]:checked').val();
	        	if(bNo == undefined){
					alert("체크를 해주세요");    		
	        	} else{
	        	window.open("noticeDelete.ad?nNo="+nNo, 'booksSignPage', 'width=800, height=500, top=100, left=300,location=no');
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