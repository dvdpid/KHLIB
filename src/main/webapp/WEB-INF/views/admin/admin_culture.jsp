<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 회원 </title>
<link href="<c:url value="/resources/css/admin/admin.css?ver=2.0"/>" rel='stylesheet' />
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
			<p><img id="titleImg1" src="resources/images/icon5.png"/>
			문화마당 관리</p>
		</div>
		<div class="empty" style="height:50px;"></div>
		<h3 align="left">문화마당 목록</h3><br>
		<div class="search-box" style="float:right; margin-right: 75px;">
    	  	<select id="searchCondition" class="search-txt" name="searchCondition">
				<option value="title">제목</option>
				<option value="instructor">강사명</option>
				<option value="target">대상</option>
			</select>
    	  <input type="text" class="search-txt" id="searchValue" name="" placeholder="검색">
     		 <a class="search-btn" onclick="searchCulture();">
        		<i class="fas fa-search"></i>
    		  </a>
  		</div>
	<script type="text/javascript">
		function searchCulture(){
			var search = $('#searchCondition').val();
			var searchContent = $('#searchValue').val();
			
			location.href="searchCulture.ad?search=" + search + "&searchContent=" + searchContent;
		}
	</script>
		
		
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
					<th>체크</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="c" items="${list }">
				<tr class="list" onclick="location.href='${ contextPath }/cDetail.cu?cNo=' + ${c.cNo} + '&page=' + ${ pi.currentPage }">
					<td>${c.cNo }</td>
					<td class="subject"><a href="#a">${c.cTitle }</a></td>
					<td><a href="#a">${ c.cTotal }</a></td>
					<td>${c.cStartDate }</td>
					<td>${c.cEndDate }</td>
					<td>${c.cInstructor }</td>
					<td>${c.cTarget }</td>
					<td onclick="event.cancelBubble=true"><input type="radio" name="cNo" value="${c.cNo }"></td>
				</tr>
				</c:forEach>
				
				<tr align="center" height="20" id="buttonTab">
				<td colspan="8">
			
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
			<input type="button" class="btn3" value="문화마당 삭제" style="float:right; margin-right: 75px;">
			<input type="button" class="btn2" value="문화마당 수정" style="float:right; margin-right: 75px;">
			<input type="button" class="btn1" value="문화마당 등록" onclick="location.href='cultureInsertForm.ad'"  style="float:right; margin-right: 75px;">
			<br><br>
		</div>
	</div>
	<script>
	        $('.btn3').on('click', function () {
	        	var cNo = $('input:radio[name=cNo]:checked').val();
	        	if(cNo == undefined){
					alert("체크를 해주세요");    		
	        	} else{
	        	window.open("cDeleteForm.ad?cNo="+cNo, 'cultureSignPage', 'width=800, height=500, top=100, left=300,location=cNo');
	        	}
	        });
     </script>
	<script>
	        $('.btn2').on('click', function () {
	        	var cNo = $('input:radio[name=cNo]:checked').val();
	        	if(cNo == undefined){
					alert("체크를 해주세요");    		
	        	} else{
					location.href="cUpdateForm.ad?cNo="+cNo;
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