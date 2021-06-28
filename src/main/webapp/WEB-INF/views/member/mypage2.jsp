<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 상세설명</title>
<link rel="stylesheet" href="resources/css/roomInfo.css" type="text/css">
<script src="resources/js/roomInfo.js" defer></script>
</head>
<body>
<!-- 헤더부분 -->
	<section id="header">
		<div class="wrapper">
		<div></div>
			<ul class="lists">
				<li><a href="">홈</a></li>
				<li><a href="">로그인</a></li>
				<li><a href="">회원가입</a></li>
			</ul>
		</div>
	</section>
	<section id="top">
		<div class="wrapper" id="topWrapper">
			<div class="logo"><b style="color:rgb(212, 129, 91);">KH</b>도서관 </div>
			<button type="button" class="toggleBtn">
				<img src="resources/images/bars-solid.svg" style="width: 20px; height: 20px"/>
			</button>
			<ul class="topLists">
				<li><a href="">도서관 소개</a></li>
				<li><a href="">도서 게시판</a></li>
				<li><a href="">자유 게시판</a></li>
				<li><a href="">독서 모임</a></li>
				<li><a href="">문화 마당</a></li>
				<li><a href="">열람실</a></li>
				<li><a href="">도서 기부</a></li>
				<li><a href="">공지사항</a></li>
				</ul>
		</div>
	</section>
	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">내 정보보기</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/open-book.png"/>
				회원정보 수정
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/maps.png"/>
				회원 탈퇴
			</h3>
		</div>

	</div>
	
<!-- 메인 부분 -->	
	<div class="center" style="position:relative;left:-260px;top:-170px;
	width: 100%;
    min-height: 30px;">		
	
	
	<div id="layer1" 
	style="width:900px; height:250px; 
	position:absolute; left:950px; top:200px; z-index:-1;
	font-size :24px;
	background-color:rgb(247, 247, 247);
	font-size :24px;
    text-align: center;"> 
	<b>내 정보</b>  
	<div id="layer1-1" 
	style="width:850px; height:180px; 
	position:absolute; left:20px; top:50px; z-index:-1;
	font-size :24px;
	background-color:white;
	font-size :24px;
     text-align: center;">
	<div style="font-size:20px;
	position:absolute; left:50px; top:10px; z-index:-1;
	float: left;">
	<img id="mypageImg7" src="resources/images/checked.png" 
        	style="width: auto; height: 30px; vertical-align:middle;
			padding-bottom: 7px;
			margin-right: 5px;"/>
	<b>아이디</b></div>
	<div style="font-size:20px;
	position:absolute; left:50px; top:70px; z-index:-1;
	float: left;">
	<img id="mypageImg7" src="resources/images/checked.png" 
        	style="width: auto; height: 30px; vertical-align:middle;
			padding-bottom: 7px;
			margin-right: 5px;"/>
	<b>이메일</b></div>
	
	<div style="font-size:20px;
	position:absolute; left:50px; top:130px; z-index:-1;
	float: left;">
	<img id="mypageImg7" src="resources/images/checked.png" 
        	style="width: auto; height: 30px; vertical-align:middle;
			padding-bottom: 7px;
			margin-right: 5px;"/>
	<b>닉네임</b></div>
	
	<div style="font-size:20px;
	position:absolute; left:450px; top:10px; z-index:-1;
	float: left;">
	<img id="mypageImg7" src="resources/images/checked.png" 
        	style="width: auto; height: 30px; vertical-align:middle;
			padding-bottom: 7px;
			margin-right: 5px;"/>
	<b>성명</b></div>
	
	<div style="font-size:20px;
	position:absolute; left:450px; top:70px; z-index:-1;
	float: left;">
	<img id="mypageImg7" src="resources/images/checked.png" 
        	style="width: auto; height: 30px; vertical-align:middle;
			padding-bottom: 7px;
			margin-right: 5px;"/>
	<b>휴대전화</b></div>
	
	<div style="font-size:20px;
	position:absolute; left:450px; top:130px; z-index:-1;
	float: left;">
	<img id="mypageImg7" src="resources/images/checked.png" 
        	style="width: auto; height: 30px; vertical-align:middle;
			padding-bottom: 7px;
			margin-right: 5px;"/>
	<b>주소</b></div>
	
</div>





	
	<div id="layer2" 
  	style="width:420px; height:320px; 
  	position:absolute; left:-2px; top:270px; z-index:-1;
  	background-color:rgb(247, 247, 247);
  	font-size :24px;
    text-align: center;">
  	<b>열람실 예약확인</b>  
  	 <img id="mypageImg1" src="resources/images/add.png" 
        	style="width: auto; height: 30px; vertical-align:middle;
			padding-bottom: 7px;
			margin-right: 5px;"/> </div>
  	
  		<div id="layer3" 
  	style="width:420px; height:320px; 
  	position:absolute; left:480px; top:270px; z-index:-1;
  	background-color:rgb(247, 247, 247);
  	font-size :24px;
    text-align: center;"> 
  	<b>내가 작성한 글</b> 
  	 <img id="mypageImg1" src="resources/images/add.png" 
        	style="width: auto; height: 30px; vertical-align:middle;
			padding-bottom: 7px;
			margin-right: 5px;"/> </div>
  	
  	<div id="layer4" 
  	style="width:420px; height:320px; 
  	position:absolute; left:-2px; top:610px; z-index:-1;
  	background-color:rgb(247, 247, 247);
  	font-size :24px;
    text-align: center;">     
  	<b>문화마당 신청 확인</b>
  	<img id="mypageImg1" src="resources/images/add.png" 
        	style="width: auto; height: 30px; vertical-align:middle;
			padding-bottom: 7px;
			margin-right: 5px;"/>  </div>
  	
  	<div id="layer5" 
  	style="width:420px; height:320px; 
  	position:absolute; left:480px; top:610px; z-index:-1;
  	background-color:rgb(247, 247, 247);
  	font-size :24px;
    text-align: center;">  
    	 
  	<b>독서모임 신청 확인</b>
  	<img id="mypageImg1" src="resources/images/add.png" 
        	style="width: auto; height: 30px; vertical-align:middle;
			padding-bottom: 7px;
			margin-right: 5px;"/>  </div>
  	
  	
  	</div>
	</div>	
		
	
	
	<div>
		<div class="empty" style="height:140px;"></div>
		<div class="in1"></div>
	</div>
	
	<!-- 푸터 -->
	
	

</body>
</html>