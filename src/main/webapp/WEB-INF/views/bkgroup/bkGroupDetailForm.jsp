<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서모임 상세보기</title>
<link rel="stylesheet" href="resources/css/bkGroupDetail.css" type="text/css"> 
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
	
	<br>
	
<!-- 메인 부분 -->
	<div id="bkDetailDiv">
		<input type="hidden" id="gNo" value="${group.gNo}">
		<input type="hidden" id="gName" value="${ group.gName }">
		<h2>${ group.gName }</h2>
		<div id="count">
			신청현황 : ${ signMemberCount } / ${ group.gTotal }명
			<input type="hidden" name="signMemberCount"	value="${ signMemberCount }">
		</div>
		
		<hr> 
		
		<table style="width: 98%; padding-bottom: 5px;">
			<tr>
				<th width="100">작성자</th>
				<td>${ group.gWriter }</td>
				<th width="100">모임 날짜</th>
				<td>${ group.gDate }</td>
			</tr>
			<tr>
				<th>모임소개</th>
				<td colspan="4">
					<c:forTokens var="intro" items="${ group.gIntro }" delims="/" varStatus="s">
					<c:if test="${ s.index eq 0 }">
						${ intro }
					</c:if>
					<br>
					<c:if test="${ s.index eq 1 }">
						${ intro }
					</c:if>
					</c:forTokens>
				</td>
			</tr>
		</table>
		
		<hr>
		<br>
		
		<table style="width: 98%;">   
			<tr>
			 	<td rowspan="3" width="280">
			 	<a href="${ contextPath }/resources/guploadFiles/${ file.changeName }" download="${ file.originName }">
			 		<img id="bookImage1" width="268" height="360" src="${ contextPath }/resources/guploadFiles/${ file.changeName }">
			 		<input type="hidden" name="fNo" value="${ file.fNo }">		 
			 	</a>
			 	</td>
			 	<td width="30"></td>
			 	<td style="text-align: center;">${group.gbTitle}</td>
			</tr>
			<tr>
				<td></td>
				<td rowspan="2">${group.gbContent}</td>
			</tr>
		</table>
		
		<br>
		<hr>
		<h4>진행 방식</h4>
		<pre>${group.gContent}</pre>
	
		<div>
			<strong>모임 장소 </strong> 
			<c:forTokens var="addr" items="${ group.gPlace }" delims="/" varStatus="status">
				<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
					(${ addr })
				</c:if>
				<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
					${ addr }
				</c:if>
				<c:if test="${ status.index eq 1 }">
					${ addr }
				</c:if>
				<c:if test="${ status.index eq 2 }">
					${ addr }
				</c:if>
			</c:forTokens>
		</div>
		
		<br><br>

		<c:url var="groupApply" value="gApply.bg">
			<c:param name="gNo" value="${ group.gNo }"/>
			<c:param name="uNo" value="${ loginUser.no }"/>
			<c:param name="page" value="${ page }"/>
		</c:url>
		
		<div id="applyDiv">
			<button id="applyBtn">${group.gName} 모임 신청하기!!</button>
		</div>
		
		
		<c:url var="goList" value="bkgroup.bg"/>
		
		<div id="goList">
			<button id="listBtn" onclick="location.href='${goList}'">목록으로</button>
		</div>
		
		<c:url var="bkGroupUpdateForm" value="bkGroupUpdateForm.bg">
			<c:param name="gNo" value="${ group.gNo }"/>
			<c:param name="page" value="${ page }"/>
		</c:url>
		
		<c:url var="gdelete" value="gdelete.bg">
			<c:param name="gNo" value="${ group.gNo }"/>
		</c:url>
		
		<c:url var="signList" value="gsMemberList.bg">
			<c:param name="gNo" value="${ group.gNo }"/>
			<c:param name="signMemberCount" value="${ signMemberCount }" />
		</c:url>
		
		<c:if test="${ loginUser.nickname eq group.gWriter }">
			<div id="etcDiv">
				<button id="signBtn" onclick="location.href='${signList}'">신청자 리스트</button>
				<button id="updateBtn" onclick="location.href='${bkGroupUpdateForm}'">수정</button>
				<button id="deleteBtn">삭제</button>
			</div>
		</c:if>
		
	</div>	
	
	<br>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
	
		
		$(function(){
			$('#deleteBtn').on('click', function(){
				var bool = confirm('정말로 삭제하시겠습니까?');
				
				if(bool){
					 location.href="${gdelete}"
					 alert('삭제되었습니다.');
				}
				
			});
			
			$('#applyBtn').on('click', function(){
				if(${ empty loginUser }){
					alert('로그인 후 이용 가능합니다.');
					location.href="${contextPath}/loginForm.me";
				} else {
					location.href="${groupApply}";
				}
				
			});
			
		});
	
		
	</script>	
	
	
	
</body>
</html>