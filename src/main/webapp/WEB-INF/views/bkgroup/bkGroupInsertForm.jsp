<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bkGroupInsert.css?ver=3.0" type="text/css">
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
			<p>
				<img id="titleImg1" src="resources/images/clipboard-list-solid.svg"/>
				독서모임 등록
			</p>
		</div>
		<br>
		<form action="bkgroupInsert.bg" method="post" enctype="multipart/form-data">
			<table id="bkInsertTable">
				<tr>
					<th width="100">모임명</th>
					<td colspan="3" height="40px">
						<input type="text" name="gName" size="55" maxlength="10" placeholder="10글자 이내" required style="height:25px;">
					</td>
					<th>작성자</th>
					<td>
						${ loginUser.nickname }
						<input type="hidden" name="gWriter" value="${ loginUser.nickname }">
					</td>
				</tr>
				<tr>
					<th>모임인원</th>
					<td colspan="3">
						<input type="number" name="gTotal" required  min="0"> 명
					</td>
					<th>모임 날짜</th>
					<td><input type="date" name="gDate" required></td>
				</tr>
				<tr>
					<th rowspan="2">모임소개</th>
					<td colspan="5">
						<span id="introCounter">0</span>/39<br>
						<textarea rows="2" cols="103" name="mainIntro" id="mainIntro" value="" class="intro" placeholder="모임 한 줄 소개를 작성해주세요." required></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<span id="counter">0</span>/150<br>
						<textarea rows="6" cols="103" name="subIntro" id="subIntro" value="" class="intro" placeholder="모임에 대해 자세히 소개해주세요."></textarea>
					</td>
				</tr>
				
				
				<tr>
					<th height="40px;">책 제목</th>
					<td colspan="5">
						<input type="text" name="gbTitle" size="114" required style="height:40px;">
					</td>
				</tr>
				<tr>
					<th>책 표지</th>
					<td width="200">
						<div id="bookImageArea">
							<img id="bookImage1" width="178" height="240">
						</div>	
					</td>
					<th width="100">책 줄거리</th>
					<td colspan="3">
						<span id="bookCounter">0</span>/1500<br>
						<textarea name="gbContent" id="gbContent" rows="15" cols="60"></textarea>
					</td>
				</tr>
				
				<tr>
					<th>진행 방식</th>
					<td colspan="5">
						<span id="contentCounter">0</span>/400<br>
						<textarea rows="20" cols="103" name="gContent" id="gContent"></textarea>
					</td>
				</tr>
			</table>
			
			<table id="placeTable">
				 <tr>
					<th rowspan="4" width="100">장소</th>
				</tr>
			<!--	<tr>
					<th>우편번호</th>
					<td colspan="4">
						<input type="text" name="post" class="postcodify_postcode5" value="" size="15">
						<button type="button" id="postcodify_search_button">검색</button>
					</td>
				</tr>
				<tr>
					<th>도로명 주소</th>
					<td colspan="4"><input type="text" name="address1" class="postcodify_address" value="" size="73"></td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td colspan="4"><input type="text" name="address2" class="postcodify_extra_info" value="" size="73"></td>
				</tr>
				 -->
				
				<tr>
					<th>주소</th>
					<td>
						<input type="text" id="sample5_address" name="gPlace" placeholder="주소" size="50">
						<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="btn">
					</td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td colspan="4"><input type="text" name="address2" class="postcodify_extra_info" value="" size="80"></td>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="resultX"  name="resultX">
						<input type="hidden" id="resultY"  name="resultY">
					</td>
				</tr>
					
				
			</table>
			
			<div id="map" style="margin-right: auto; margin-left: auto; width: 78%; height:350px; margin-top:10px;display:none"></div>
			
			<br><br>
			
			<div style="margin: 0px 60px;">
				<input type="submit" id="inBtn" value="등록하기" class="btn"> &nbsp;
				<button onclick="location.href='bkgroup.bg'" class="btn">취소하기</button>
			</div>
			
			<br>
			
			<div id="fileArea">
				<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this, 1)">
			</div>
			
			<input type="hidden" id="loginUser" value="${ loginUser }">
			
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
						
						if(inputLength <= 400){
							$('#contentCounter').css('color','black');
						} else {
							$('#contentCounter').css('color', 'red');
							
							var pieceStr = input.substr(0, 400); 
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
			
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3aaa2974fdb4f9697f8623de5191f895&libraries=services"></script>
	<script>
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample5_address").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)

	                    	console.log(result.x);
	                        console.log(result.y);
	                        
	                        document.getElementById('resultX').value = result.x;
	                        document.getElementById('resultY').value = result.y;
	                    }
	                });
	            }
	        }).open();
	    }
	</script>
	
		</form>
		
	</div>	
	
	<br>
	
	<c:import url="../common/footer.jsp"/>
	
			
	
	
	
	
	
	
	
	
</body>
</html>