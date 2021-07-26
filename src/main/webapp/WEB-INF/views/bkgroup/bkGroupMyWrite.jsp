<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bkGroupMyWrite.css" type="text/css">
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
		
		<div class="sideButton" id="side">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/clipboard-list-solid.svg"/>
				신청 내역
			</h3>
		</div>
		<c:if test="${ !empty loginUser }">
		
			<div class="sideButton" onclick="location.href='bkGroupMyWrite.bg'">
				<h3 id="sideButton3">
					<img id="sideImg3" src="resources/images/clipboard-list-solid.svg"/>
					게시글 내역
				</h3>
			</div>
		
			<div class="sideButton" onclick="location.href='bkgroupInsertForm.bg';">
				<h3 id="sideButton2">
					<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
					모임 등록
				</h3>
			</div>
		</c:if>
	</div>
	
	<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/laptop-solid.svg"/>
			게시글 내역</p>
		</div>
		
		<p style="margin-top: 10px; text-align: center;">모임명 클릭 시, 해당 게시글로 이동합니다.</p>
		
		<div class="listDiv">
			<div class="groupListDiv">
				<table id="signListTable">
					
					<tr>
						<th></th>
						<th>글 번호</th>
						<th>모임명</th>
						<th>모집 인원</th>
						<th>마감 여부</th>
					</tr>
					
					<c:if test="${ empty gList }">
						<tr>
							<td colspan="4"><div align="center">작성한 게시글이 없습니다.</div></td>
						</tr>
					</c:if>	
					
					<c:forEach var="g" items="${ gList }">
							<tr>
								<td>
									<input type="radio" name="deadline" value="${ g.gNo }">
								</td>
								<td>
									<input type="hidden" name="gNo" value="${ g.gNo }">
									${ g.gNo }
								</td>
								<td>
									<c:url var="gdetail" value="gDetail.bg">
										<c:param name="gNo" value="${ g.gNo }"/>
										<c:param name="page" value="0"/>
									</c:url>
									<input type="hidden" name="gName" value="${ g.gName }">
									<a href="${gdetail}">${ g.gName }</a>
								</td>
								<td>
									<c:forEach var="m" items="${ memCountList }">
										<c:if test="${ g.gNo eq m.gNo }">
										${ m.memberCount } / ${ g.gTotal }
										</c:if>
									</c:forEach>
								</td>
								<td>
									<input type="hidden" id="deadline" value="${ g.gDeadline }">
									<c:forEach var="m" items="${ memCountList }">
										<c:if test="${ g.gNo eq m.gNo }">
											<c:choose>
												<c:when test="${ g.gDeadline == 'Y' }">모집 마감</c:when>
												<c:when test="${ m.memberCount eq g.gTotal }">모집 마감</c:when>
												<c:when test="${  g.gDeadline == 'N' }">모집 진행 중 </c:when>
												<c:when test="${ m.memberCount < g.gTotal }">모집 진행 중</c:when>
											</c:choose>
											<%-- <c:if test="${ g.gDeadline == 'Y' || m.memberCount eq g.gTotal }">모집 마감</c:if>
											<c:if test="${ g.gDeadline == 'N' || m.memberCount < g.gTotal }">모집 진행 중</c:if> --%>
										</c:if>
									</c:forEach>							
								</td>
							</tr>
					</c:forEach>
				</table>
				
				<br><br>
				
				<div id="btnDiv">
					<button id="deadlineBtn">마감</button> 
					<button id="noDeadlineBtn">마감 취소</button>
				</div>
				
				
			</div>
		</div>
	</div>
	
	<br>
	
	<c:import url="../common/footer.jsp"/>
		
		<script>
		$(function(){
			
			$('#deadlineBtn').on('click', function(){
				
				var gNo = $('input:radio[name="deadline"]:checked').val();
				var deadline = $('input:radio[name="deadline"]:checked').parent().parent().children().eq(4).children().val();
				
				console.log(deadline);
				
				if(gNo == undefined){
					alert('마감 취소할 게시글을 선택해주세요');
				} else {
					
					if(deadline == 'N'){
						var bool = confirm('정말로 마감처리 하시겠습니까?');
						
						if(bool){
							 location.href="${contextPath}/deadline.bg?gNo=" + gNo;
							 alert('마감되었습니다.');
						}
					} else {
						alert('이미 마감되었습니다.');
					}
				}
				
				
			});
			
			$('#noDeadlineBtn').on('click', function(){
				
				var gNo = $('input:radio[name="deadline"]:checked').val();
				
				if(gNo == undefined){
					alert('마감 취소할 게시글을 선택해주세요');
				} else {
					location.href="${contextPath}/noDeadline.bg?gNo=" + gNo;
					
					alert('마감을 취소하였습니다.');
				}
				
				
			});
			
		});		
		
		var loginUser = document.getElementById('loginUser').value;
		
		$('#side').on('click', function(){
			if(!loginUser){
				alert('로그인 후 이용 가능합니다.');
				location.href="${contextPath}/loginForm.me";
			} else {
				location.href="${contextPath}/bkgroupMyPage.bg";
			}
		});
		
		
		</script>
		
		
</body>
</html>