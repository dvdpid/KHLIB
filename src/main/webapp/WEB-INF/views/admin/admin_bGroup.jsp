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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link rel="stylesheet" href="resources/css/cultureList.css?ver=1.0" type="text/css">

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
			<p><img id="titleImg1" src="resources/images/icon6.png"/>
			독서모임 관리</p>
		</div>
		<div class="con">
		<div class="empty" style="height:50px;"></div>
		<h3 align="left">독서 모임</h3><br>
		
		<div class="search-box" style="float:right; margin-right: 75px;">
    	  	<select id="searchCondition" class="search-txt" name="searchCondition">
				<option value="name">그룹 명</option>
				<option value="book">책 제목</option>
			</select>
    	  <input type="text" class="search-txt" id="searchValue" name="" placeholder="검색">
     		 <a class="search-btn" onclick="searchBGroup();">
        		<i class="fas fa-search"></i>
    		  </a>
  		</div>
	<script type="text/javascript">
		function searchBGroup(){
			var search = $('#searchCondition').val();
			var searchContent = $('#searchValue').val();
			
			location.href="searchBGroup.ad?search=" + search + "&searchContent=" + searchContent;
		}
	</script>
	
		<div>
			<table class="type1">
				<thead>
				<tr>
					<th>번호</th>
					<th>그룹 이름</th>
					<th>책 제목</th>
					<th>작성자</th>
					<th>모임 일자</th>
					<th>체크</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="g" items="${list }">
					<tr class="list" onclick="location.href='${ contextPath }/gDetail.bg?gNo='+ ${ g.gNo } + '&page=' + ${ pi.currentPage }">
						<td>${g.gNo }</td>
						<td>${g.gName }</td>
						<td>${g.gbTitle }</td>
						<td>${ g.gWriter }</td>
						<td>${g.gDate }</td>
						<td onclick="event.cancelBubble=true"><input type="radio" name="gNo" value="${g.gNo  }"></td>
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
								<c:url value="bkgroup.ad" var="blistBack"> <!-- loc : 현재 내 주소 -->
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
									<c:url var="blistCheck" value="bkgroup.ad">
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
								<c:url value="bkgroup.ad" var="blistNext"> <!-- loc : 현재 내 주소 -->
				            		<c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
				            		<c:if test="${ searchValue ne null }">
				            			<c:param name="searchContent" value="${ searchContent }"/>
				            		</c:if>
				            	</c:url>
				            	<div class="pageBtn"><a href="${ blistNext }">&gt;</a></div>
							</c:if>
						</div>
					</c:if>
			
			
			
			<br>
			<input type="button" class="btn1" id="inBtn" value="모임 삭제" style="float:right; margin-right: 75px;">
		</div>
		</div>
	</div>
		<script>
	        $('.btn1').on('click', function () {
	        	var gNo = $('input:radio[name=gNo]:checked').val();
	        	if(gNo == undefined){
					alert("체크를 해주세요");    		
	        	} else{
	        		window.open("bgDeleteForm.ad?gNo="+gNo, 'bookgroupSignPage', 'width=800, height=500, top=100, left=300,location=gNo');
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