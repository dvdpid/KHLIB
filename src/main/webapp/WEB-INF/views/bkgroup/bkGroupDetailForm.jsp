<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서모임 상세보기</title>
<link rel="stylesheet" href="resources/css/bkGroupDetail.css?ver=3.0" type="text/css"> 
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
	
	<br>
	 
<!-- 메인 부분 -->
	<div class="main">
		<input type="hidden" id="gNo" value="${group.gNo}">
		<input type="hidden" id="gName" value="${ group.gName }">
		
		<div class="mainTitle">
			<span>${ group.gName }</span>
			<div id="count">
				<strong>모집인원</strong> : ${ signMemberCount } / ${ group.gTotal }명
				<input type="hidden" name="signMemberCount" id="signMemberCount" value="${ signMemberCount }">
				<input type="hidden" name="gTotal" id="gTotal" value="${ group.gTotal }">
			</div>
		</div>
		
		<table id="groupTable1">
			<tr>
				<th rowspan="2" width="100">모임소개</th>
				<td rowspan="2" colspan="2" width="650">
					<c:forTokens var="intro" items="${ group.gIntro }" delims="/" varStatus="s">
					<c:if test="${ s.index eq 1 }">
						${ intro }
					</c:if>
					</c:forTokens>
				</td>
				<th width="100">작성자</th>
				<td width="100">${ group.gWriter }</td>
			</tr>
			<tr>
				<th width="100">모임 날짜</th>
				<td width="100">${ group.gDate }</td>
			</tr>
		</table>
		
		<hr>
		<br>
		
		<table id="bookTable">   
			<tr>
			 	<td rowspan="3" width="280">
			 	<a href="${ contextPath }/resources/guploadFiles/${ file.changeName }" download="${ file.originName }">
			 		<img id="bookImage1" width="268" height="360" src="${ contextPath }/resources/guploadFiles/${ file.changeName }">
			 		<input type="hidden" name="fNo" value="${ file.fNo }">		 
			 	</a>
			 	</td>
			 	<th width="100" height="50">책 제목</th>
			 	<td>${group.gbTitle}</td>
			</tr>
			<tr>
				<th valign="top">줄거리</th>
				<td rowspan="2" valign="top">
					<% pageContext.setAttribute("newLineChar", "\r\n"); %> 
					${ fn:replace(group.gbContent, newLineChar, "<br>") }
				</td>
			</tr>
		</table>
		
		<br>
		<hr>
		
			<div style="margin: 0px 60px; float: left; width: 40%; height: 300px;">
			<h3>진행 방식</h3>
			<% pageContext.setAttribute("newLineChar", "\r\n"); %> 
			${ fn:replace(group.gContent, newLineChar, "<br>") }
			</div>
		
			<div class="div" style="margin-left: 5px;">
				<h3>모임 장소</h3>
				<c:forTokens var="addr" items="${ group.gPlace }" delims="/" varStatus="status">
					<c:if test="${ status.index eq 0 }">
						<input type="hidden" id="addr1" value="${ addr }">
						${ addr }
					</c:if>
					<c:if test="${ status.index eq 1 }">
						<input type="hidden" id="addr2" value="${ addr }">
						${ addr }
					</c:if>
					<c:if test="${ status.index eq 2 }">
						<input type="hidden" id="resultX" value="${ addr }">
					</c:if>
					<c:if test="${ status.index eq 3 }">
						<input type="hidden" id="resultY" value="${ addr }">
					</c:if>
				</c:forTokens>
				
				<br><br>
				
				<div id="map" style="margin: 0px 60px; width: 400px; height:350px;"></div>
				
			</div>
		<br>
		
		
		
		<br><br>

		<c:url var="groupApply" value="gApply.bg">
			<c:param name="gNo" value="${ group.gNo }"/>
			<c:param name="uNo" value="${ loginUser.no }"/>
			<c:param name="page" value="${ page }"/>
		</c:url>
		
		
		<c:url var="goList" value="bkgroup.bg"/>
		
		
		
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
		
		<div id="goList" class="div">
			<button class="btn" id="applyBtn">${group.gName} 모임 신청하기!!</button>
			<button class="btn" id="listBtn" onclick="location.href='${goList}'">목록으로</button>
			<c:if test="${ loginUser.nickname eq group.gWriter }">
				<div id="etcDiv">
					<button class="btn" id="signBtn" onclick="location.href='${signList}'">신청자 리스트</button>
					<button class="btn" id="updateBtn" onclick="location.href='${bkGroupUpdateForm}'">수정</button>
					<button class="btn" id="deleteBtn">삭제</button>
				</div>
			</c:if>
		</div>
		
		<input type="hidden" id="gDeadline" value="${group.gDeadline }">
		<input type="hidden" id="loginUser" value="${ loginUser }">
		
	</div>	
	
		<c:set var="now" value="<%= new java.util.Date() %>" />
		<c:set var="sysDate"><fmt:formatDate value="${ now }" pattern="yyyy-MM-dd" /></c:set>
		<input type="hidden" id="sysdate" value="${ sysDate }">
		<input type="hidden" id="gDate" value="${ group.gDate }">
	
	<br>
	
	<c:import url="../common/footer.jsp"/>
	
	
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
		
		$(function(){
			$('#deleteBtn').on('click', function(){
				var bool = confirm('정말로 삭제하시겠습니까?');
				
				if(bool){
					 location.href="${gdelete}";
					 alert('삭제되었습니다.');
				}
				
			});
			
			$('#applyBtn').on('click', function(){
				var signMemberCount = document.getElementById('signMemberCount').value;
				var gTotal = document.getElementById('gTotal').value;
				var gDeadline = document.getElementById('gDeadline').value;
				var sysdate = document.getElementById('sysdate').value;
				var gDate = document.getElementById('gDate').value;
				
				console.log(gDate);
				console.log(gDate < sysdate);
				
				if(!loginUser){
					alert('로그인 후 이용 가능합니다.');
					location.href="${contextPath}/loginForm.me";
				} else if(signMemberCount == gTotal || gDeadline == 'Y'){
					alert('마감된 모임은 신청이 불가능합니다.');
				} else if(gDate < sysdate){
					alert('모임 날짜가 지나 신청이 불가능합니다.');
				}else if(gDeadline == 'N'){
					if(gDate >= sysdate){
						location.href="${groupApply}";
					}
				}
				
			});
			
			
		});
		
		
	</script>	
	
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3aaa2974fdb4f9697f8623de5191f895&libraries=services"></script>
	<script>
	var x = document.getElementById('resultX').value;
    var y = document.getElementById('resultY').value;
    
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(y, x), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	 //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new kakao.maps.LatLng(y, x),
        map: map
    });
	
	</script>
	
	<!-- <script>
	
		
	    
	    console.log(x, y)
	    
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(x, y), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(x, y),
	        map: map
	    });
	
	
	</script> -->

	
	
	
	
</body>
</html>