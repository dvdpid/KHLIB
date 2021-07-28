<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화마당 신청내역</title>
<link rel="stylesheet" href="resources/css/gsMemberList.css?ver=3.0" type="text/css"> 
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">문화마당</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='culture.cu';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				프로그램
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='cultureMypage.cu';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
				신청 내역
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='cultureInfo.cu';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/clipboard-list-solid.svg"/>
				이용 안내
			</h3>
		</div>
	</div>
	
<!-- 메인 부분 -->	
		<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/laptop-solid.svg"/>
			신청자 리스트</p>
		</div>
		<br>
		<table id="signTable">
			<tr>
				<th></th>
				<th width="100px;">글 번호</th>
				<th width="300px;">문화 제목</th>
				<th width="150px;">신청자 닉네임</th>
				<th width="280px;">이메일</th>
				<th width="100px;">모집 인원</th>
				<th width="100px;">승인 여부</th>
			</tr>
			
			<c:if test="${ empty memInfoList }">
				<tr>
					<td colspan="6">신청자가 없습니다.</td>
				</tr>
			</c:if>
					
		 	<c:forEach var="m" items="${ memInfoList }">
			 	<c:forEach var="cs" items="${ csList }">
			 		<c:if test="${ cs.uNo eq m.no }">
				 	<tr>
				 		<td><input type="radio" name="sign" value="${ m.no }"></td>
						<td>
							<input type="hidden" name="cNo" id="cNo" value="${ culture.cNo }">
							${ culture.cNo }
						</td>
						<td>
							<input type="hidden" name="gName" id="gName" value="${ culture.cTitle }">
							${ culture.cTitle }
						</td>
						<td>
							<input type="hidden" name="uNo" id="uNo" value="${ m.no }">
							<input type="hidden" name="nickname" value="${ m.nickname }">
							${ m.nickname }
						</td>
						<td>
							<input type="hidden" name="email" value="${ m.email }">
							${ m.email }
						</td>
						<td>
							<input type="hidden" id="smc" value="${ approvalCount }">	
							<input type="hidden" id="cTotal" value="${ culture.cTotal }">	
							${ approvalCount} /  ${ culture.cTotal }
							
						</td>
						<td>
							<input type="hidden" name="csApproval" value="${ cs.csApproval }">
							<c:if test="${  cs.csApproval == 'Y' }">
								<span style="color: blue;">승인 완료</span>
							</c:if>
							<c:if test="${  cs.csApproval == 'W' }">
								승인 대기
							</c:if>
							<c:if test="${  cs.csApproval == 'N' }">
								<span style="color: red;">승인 거절</span>
							</c:if>
						</td>
					</tr>
					</c:if>
				</c:forEach>	
			</c:forEach> 
		</table>
		
		<br>
		
		<div class="btn">
			<button id="yesBtn">신청 승인</button>
			<button id="noBtn">신청 거절</button>
		</div>
		
		<input type="hidden" id="loginUser" value="${ loginUser }">
	</div>
	
	<script>
		$('#yesBtn').on('click', function(){
			var radio = $('input:radio[name="sign"]').is(':checked');
			
			var signCount = 0;
			var total = 0;
			signCount = document.getElementById('smc').value;
			total = document.getElementById('cTotal').value;
			
			if(radio == true && signCount < total){	// 버튼이 체크 된 경우
				var bool = confirm('신청을 수락하시겠습니까?');
			} else if(radio == false) {
				alert('신청 승인을 원하는 사용자의 버튼을 클릭해주세요.');
			} else if(signCount >= total){
				alert('모집 인원이 마감되었습니다.');
			}
			
			if(bool){
				var uNo = $('input:radio[name="sign"]:checked').val();
				var check = $('input:radio[name="sign"]:checked'); 
				
				var cNo = document.getElementById('cNo').value;
				var smc = Number(document.getElementById('smc').value); 	// 숫자로 형변환
				var csApproval =  check.parent().parent().children().eq(6).find('input[name="csApproval"]').val();
				// 체크 된 행의 수락 여부 Y/N 가져오기
				
				if(csApproval == 'N'){
					smc = smc + 1;
				}
				
				$.ajax({
					url : 'csMemberApply.cu',
					data : { cNo : cNo, uNo : uNo},
					success : function(data){
						console.log(data);
						if("success"){
							alert('승인 성공');
							location.href="${contextPath}/csMemberList.cu?cNo=" + cNo + "&approvalCount=" + smc;
						}
					}
				});
				
			}
		});
		
		$('#noBtn').on('click', function(){
			
			var radio = $('input:radio[name="sign"]').is(':checked');
			var csApproval = $('input:radio[name="sign"]:checked').parent().parent().children().eq(6).find('input[name="csApproval"]').val();
			
			console.log(csApproval);
			
			if(radio == true && csApproval != 'N'){	// 버튼이 체크 된 경우
				var bool = confirm('신청을 거절하시겠습니까?');
			} else if(radio == false){
				alert('신청 거절을 원하는 사용자의 버튼을 클릭해주세요.');
			} else if(csApproval == 'N'){
				alert('이미 신청 거절된 사용자입니다.');
			}
			
			
			if(bool){
				var uNo = $('input:radio[name="sign"]:checked').val();
				var cNo = document.getElementById('cNo').value;
				var smc = document.getElementById('smc').value;
				
				$.ajax({
					url : 'csMemberNoApply.cu',
					data : { cNo : cNo, uNo : uNo },
					success : function(data){
						console.log(data);
						if("success"){
							alert('신청 거절 성공');
							
							smc = smc - 1;
							
							location.href="${contextPath}/csMemberList.cu?cNo=" + cNo + "&approvalCount=" + smc;
						}
					}
				});
				
			}
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