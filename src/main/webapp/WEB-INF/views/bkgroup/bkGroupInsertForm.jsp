<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bkGroupInsert.css" type="text/css">
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
			<p>
				<img id="titleImg1" src="resources/images/clipboard-list-solid.svg"/>
				독서모임 등록
			</p>
		</div>
		<br>
		<form action="bkgroupInsert.bg" method="post" enctype="Multipart/form-data">
			<table id="bkInsertTable">
				<tr>
					<th>모임명</th>
					<td colspan="2" style="height: 40px;">
						<input type="text" name="gName" required style="width: 90%; height:30px;">
					</td>
					<th>모임인원</th>
					<td style="width: 220px;">
						<input type="number" name="gTotal" required style="height:30px;" min="0" > 명
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						${ loginUser.nickname }
						<input type="hidden" name="gWriter" value="${ loginUser.nickname }">
					</td>
					<td></td>
					<th>모임 날짜</th>
					<td><input type="date" style="width: 80%;" name="gDate" required></td>
				</tr>
				<tr>
					<th rowspan="2">모임소개</th>
					<td colspan="4">
						<span id="introCounter">0</span>/39<br>
						<textarea rows="2" style="width: 90%;" name="mainIntro" id="mainIntro" value="" class="intro" placeholder="모임 한 줄 소개를 작성해주세요." required></textarea>
					</td>
					
				</tr>
				<tr>
					<td colspan="4">
						<span id="counter">0</span>/150<br>
						<textarea rows="5" style="width: 90%;" name="subIntro" id="subIntro" value="" class="intro" placeholder="모임에 대해 자세히 소개해주세요."></textarea>
					</td>
				</tr>
				
				<tr>
					<th rowspan="3">책 표지</th>
					<td rowspan="3">
						<div id="bookImageArea">
							<img id="bookImage1" width="134" height="180">
						</div>	
						
								
					</td>
					<th height="40px;">책 제목</th>
					<td colspan="2">
						<input type="text" name="gbTitle" required style="width: 85%; height:40px;">
					</td>
				</tr>
				<tr>
					<th rowspan="2">책 줄거리</th>
					<td rowspan="2" colspan="2">
						<span id="bookCounter">0</span>/1500<br>
						<textarea rows="5" style="width: 85%; height: 300;" name="gbContent" id="gbContent"></textarea>
					</td>
				</tr>
				<tr style="border-bottom: 1px solid black;"></tr>
				<tr>
					<th>진행 방식</th>
					<td colspan="4">
						<span id="contentCounter">0</span>/1500<br>
						<textarea rows="20" style="width: 90%; height: 250;" name="gContent" id="gContent"></textarea>
					</td>
				</tr>
				
				<tr>
					<th rowspan="4">장소</th>
				</tr>
				<tr>
					<th>우편번호</th>
					<td colspan="4">
						<input type="text" name="post" class="postcodify_postcode5" value="" size="6">
						<button type="button" id="postcodify_search_button">검색</button>
					</td>
				</tr>
				<tr>
					<th>도로명 주소</th>
					<td colspan="4"><input type="text" name="address1" class="postcodify_address" value=""></td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td colspan="4"><input type="text" name="address2" class="postcodify_extra_info" value=""></td>
				</tr>
				
				<tr>
					<td colspan="5" align="center">
						<input type="submit" id="inBtn" value="등록하기"> &nbsp;
						<button onclick="location.href='bkgroup.bg'">취소하기</button>
					</td>
				</tr>
			</table>
			
			<br>
			
			<div id="fileArea">
				<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this, 1)">
			</div>
			
			
			<script>
				$(function(){
					$("#fileArea").hide();
										
					$('#bookImage1').click(function(){
						$('#thumbnailImg1').click();
					});
				});
									
				function LoadImg(value, num){
					if(value.files && value.files[0]){
						
						var reader = new FileReader();
						
						reader.onload = function(e) {
							switch(num){
							case 1:
								$('#bookImage1').attr("src", e.target.result);
								break;				
							}
						}
						reader.readAsDataURL(value.files[0]);
					}
				}
				
				var count = 0;
				
				$(function(){
					$('#mainIntro').keyup(function(){
						var input = $(this).val();
						var inputLength = input.length;
						console.log(inputLength);
						
						$('#introCounter').html('<b>' + inputLength + '<b>');
						
						if(inputLength <= 39){
							$('#introCounter').css('color','black');
						} else {
							$('#introCounter').css('color', 'red');
							
							var pieceStr = input.substr(0, 39); // 0부터 150글자까지 담아두는 변수
							$(this).val(pieceStr); // 나한테 값을 집어넣으면 끝
							console.log(this);		
						}
					});
					
					$('#subIntro').keyup(function(){
						var input = $(this).val();
						var inputLength = input.length;
						console.log(inputLength);
						
						$('#counter').html('<b>' + inputLength + '<b>');
						
						if(inputLength <= 150){
							$('#counter').css('color','black');
						} else {
							$('#counter').css('color', 'red');
							
							var pieceStr = input.substr(0, 150); // 0부터 150글자까지 담아두는 변수
							$(this).val(pieceStr); // 나한테 값을 집어넣으면 끝
							console.log(this);		
						}
					});
					
					$('#gbContent').keyup(function(){
						var input = $(this).val();
						var inputLength = input.length;
						console.log(inputLength);
						
						$('#bookCounter').html('<b>' + inputLength + '<b>');
						
						if(inputLength <= 1500){
							$('#bookCounter').css('color','black');
						} else {
							$('#bookCounter').css('color', 'red');
							
							var pieceStr = input.substr(0, 1500); 
							$(this).val(pieceStr); // 나한테 값을 집어넣으면 끝
							console.log(this);		
						}
					});
					
					$('#gContent').keyup(function(){
						var input = $(this).val();
						var inputLength = input.length;
						console.log(inputLength);
						
						$('#contentCounter').html('<b>' + inputLength + '<b>');
						
						if(inputLength <= 1500){
							$('#contentCounter').css('color','black');
						} else {
							$('#contentCounter').css('color', 'red');
							
							var pieceStr = input.substr(0, 1500); 
							$(this).val(pieceStr); // 나한테 값을 집어넣으면 끝
							console.log(this);		
						}
					});
				});
				
				
			</script>
			<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
			<script>
				$(function(){
					$("#postcodify_search_button").postcodifyPopUp();
				});
			</script>
	
		</form>
		
	</div>	
	
	<br>
	
	<c:import url="../common/footer.jsp"/>
	
			
	
	
	
	
	
	
	
	
</body>
</html>