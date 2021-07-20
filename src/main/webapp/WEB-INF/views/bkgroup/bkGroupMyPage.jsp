<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bkGroupMyPage.css" type="text/css">
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
				<li><a href="bkGroupMyWrite.bg">독서모임 게시글 내역</a></li>
			</ul>
			
		</div>
		<br>
		
		<table>
			<tr>
				<th>신청 내역 개수 :</th>
				<td colspan="3">${ gsListCount }</td>
			</tr>
		</table>
		
		<br>
		
		<input type="hidden" name="uNo" id="uNo" value="${ loginUser.no }">
		
		<table id="bkMyPageTable" border="1">
			
			<tr>
				<th></th>
				<th width="200">게시글 번호</th>
				<th width="200">독서 모임명</th>
				<th width="200">장소 및 시간</th>
				<th width="200">신청 현황</th>
				<th width="200">승인 여부</th>
			</tr>
			<c:if test="${ empty gsList }">
				<tr>
					<td colspan="5"><div align="center">신청한 프로그램이 없습니다.</div></td>
				</tr>
			</c:if>
			
			<c:forEach var="gs" items="${ gsList }" >
				<c:forEach var="bg" items="${ bgList }">
					<c:if test="${ !empty gs && (gs.uNo == loginUser.no) && (gs.gNo==bg.gNo)}">
						<tr>
							<td><input type="radio" name="cancelCheck" value="${ bg.gNo }"></td>
							<td><input type="hidden" name="gNo" value="${ bg.gNo }">${ bg.gNo }</td>
							<td>${ bg.gName }</td>
							<td>${ bg.gPlace } / ${ bg.gDate }</td>
							<td>
								${ gs.memberCount } / ${ bg.gTotal } 
								<c:if test="${ gs.memberCount < bg.gTotal }">
									(모집중)
								</c:if>
								<c:if test="${ gs.memberCount >= bg.gTotal }">
									(모집 마감)
								</c:if>
							</td>
							<td>
							<input type="hidden" name="gsApproval" value="${ gs.gsApproval }">
							<c:if test="${ gs.gsApproval == 'Y' }">
								승인 완료
							</c:if>
							<c:if test="${ gs.gsApproval == 'W' }">
								승인 대기
							</c:if>
							<c:if test="${ gs.gsApproval == 'N' }">
								승인 거절
							</c:if>
						</td>
						</tr>
						</c:if>
				</c:forEach>	
			</c:forEach>
		</table>
		<button id="cancelBtn">신청 취소 및 내역 삭제</button>
	</div>
	
	<script>		
		$('#cancelBtn').on('click', function(){																		
			
			var gNo = $('input:radio[name="cancelCheck"]:checked').val();
			var uNo = document.getElementById('uNo').value;
			
			alert('독서모임 내역 삭제를 완료했습니다.');
			location.href="gsCancel.bg?gNo=" + gNo + "&uNo=" + uNo;
		});
	</script>
	
</body>
</html>