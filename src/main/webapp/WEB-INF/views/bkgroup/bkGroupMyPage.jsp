<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bkGroupMyPage.css?ver=2.0" type="text/css">
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
			신청 내역</p>
		</div>
		<br>
		
		<div class="count">
			신청 내역 개수 : ${ gsListCount }
		</div>
		
		<br>
		
		<input type="hidden" name="uNo" id="uNo" value="${ loginUser.no }">
		
		<table id="bkMyPageTable">
			
			<tr>
				<th></th>
				<th width="100">글 번호</th>
				<th width="200">독서 모임명</th>
				<th width="400">장소 및 시간</th>
				<th width="150">모집 인원 현황</th>
				<th width="150">승인 여부</th>
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
							<td>
								<c:forTokens var="addr" items="${ bg.gPlace } " delims="/" varStatus="status">
									<c:if test="${ status.index eq 1 }">
										${ addr }
									</c:if>
									<c:if test="${ status.index eq 2 }">
										${ addr } <br>
									</c:if>
								</c:forTokens>
								
								/ ${ bg.gDate }
							
							</td>
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
		
		<br><br>
		
		<button id="cancelBtn">신청 취소 및 내역 삭제</button>
		
		<input type="hidden" id="loginUser" value="${ loginUser }">
	</div>
	
	<script>		
			
		var loginUser = document.getElementById('loginUser').value;
		
		$('#side').on('click', function(){
			if(!loginUser){
				alert('로그인 후 이용 가능합니다.');
				location.href="${contextPath}/loginForm.me";
			} else {
				location.href="${contextPath}/bkgroupMyPage.bg";
			}
		});
		
		$('#cancelBtn').on('click', function(){																		
			
			var gNo = $('input:radio[name="cancelCheck"]:checked').val();
			var uNo = document.getElementById('uNo').value;
			
			alert('독서모임 내역 삭제를 완료했습니다.');
			location.href="gsCancel.bg?gNo=" + gNo + "&uNo=" + uNo;
		});
	</script>
	
	<c:import url="../common/footer.jsp"/>
	
</body>
</html>