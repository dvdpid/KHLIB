<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bkGroupMyPage.css" type="text/css">
<style type="text/css">
	.listDiv{display: flex;}
	.groupListDiv{width: 700px;}
	.signMemberList{display: flex; border: 1px solid red;}
</style>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
</head>

<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">독서 모임</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='bkgroup.bg';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				독서 모임
			</h3>
		</div>
		
		<div class="sideButton" onclick="location.href='bkgroupMyPage.bg';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/clipboard-list-solid.svg"/>
				신청 내역
			</h3>
		</div>
		<c:if test="${ !empty loginUser }">
			<div class="sideButton" onclick="location.href='bkgroupInsertForm.bg';">
				<h3 id="sideButton2">
					<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
					독서 모임 등록
				</h3>
			</div>
		</c:if>
	</div>
	
	<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<!-- <p>
				<img id="titleImg1" src="resources/images/clipboard-list-solid.svg"/>
				독서모임 신청내역
			</p> -->
			
			<ul>
				<li><a href="bkgroupMyPage.bg">독서모임 신청 내역</a></li>
				<li><a href="">독서모임 게시글 내역</a></li>
			</ul>
			
		</div>
				
		<div class="listDiv">
			<div class="groupListDiv">
				<table id="signListTable">
					
					<tr>
						<th>글 번호</th>
						<th>모임명</th>
						<th>신청자 수</th>
					</tr>
					
					<c:if test="${ empty gList }">
							<tr>
								<td colspan="5"><div align="center">작성한 게시글이 없습니다.</div></td>
							</tr>
					</c:if>	
					
					<c:forEach var="g" items="${ gList }">
							<tr>
								<td>
									<input type="hidden" name="gNo" value="${ g.gNo }">
									${ g.gNo }
								</td>
								<td>
									<input type="hidden" name="gName" value="${ g.gName }">
									${ g.gName }
								</td>
								<td>
									<c:forEach var="m" items="${ memCountList }">
										<c:if test="${ g.gNo eq m.gNo }">
										${ m.memberCount }
										</c:if>
									</c:forEach>
								</td>
							</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<script>
		$(function(){
			$('#signListTable td').on({'mouseenter': function(){
				$(this).parent().css({'background' : 'darkgray', 'cursor' : 'pointer'}); // tr에 대해 css 설정
			}, 'mouseout': function(){
				$(this).parent().css('background','none');
			}, 'click': function(){
				var gNo = $(this).parent().children().eq(0).text();
				
				// 보낼 줄 현재 페이지 값이 없으므로 임의로 0이라 설정
				location.href="gDetail.bg?gNo=" + gNo + "&page=" + 0;
				
			}});
			
			
			
		});		
		</script>
		
		
</body>
</html>