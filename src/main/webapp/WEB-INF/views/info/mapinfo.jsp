<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 상세설명</title>
<link rel="stylesheet" href="resources/css/roomInfo.css" type="text/css">
<script src="resources/js/roomInfo.js" defer></script>
<style>
	#mapinfo1{
				display: block;
			    text-align: center;
			    line-height: 35px;
			    font-style: normal;		    
			    width: 130px;
			    height: 42px;
			    box-sizing: border-box;
			    border: 3px solid #cedfed;
			    color: #2850bf;
			    font-weight: 700;
			    border-radius: 30px;
			    -webkit-border-radius: 30px;
			    margin-bottom:3px;
	}
	#mapinfo1-2{
			    display: block;
			    text-align: center;
			    line-height: 35px;
			    font-style: normal;
			    left: 800px;
			    top: 200px;			    
			    width: 430px;
			    height: 20px;
			    position:static;">
			    
	}
	.parent {
    display: flex;
	}
	.child {
	    flex: 1;
	}


</style>
</head>
<body>
<!-- 헤더부분 -->
<c:import url="../common/menubar.jsp"/>
	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">도서관 소개</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='intro.in';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/info/hi.png"/>
				인사말
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='map.in';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/info/maps.png"/>
				오시는 길
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='guide.in';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/info/time.png"/>
				이용 안내
			</h3>
		</div>
	</div>
	
<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/info/maps.png"/>
			오시는 길</p>
		</div>
		<div class="empty" style="height:50px;"></div>
		<div class="infoSpace">
			<table id="infoTable">
				
			</table>
			<br>
			 <div id="daumRoughmapContainer1624187338293" class="root_daum_roughmap root_daum_roughmap_landing"></div>
	
			<script charset="UTF-8" class="daum_roughmap_loader_script" 
	
				src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
				<!-- 3. 실행 스크립트 -->
				<script charset="UTF-8">
					new daum.roughmap.Lander({
						"timestamp" : "1624187338293",
						"key" : "26atc",
						"mapWidth" : "900",
						"mapHeight" : "560"
					}).render();
				</script>
				
		  
		 
			<div class="parent" style="width: 300px; height: 100px; margin:35px 30px 10px 10px;">
			    <div class="child">
					<div id="mapinfo1">주소</div>
			    </div>
			    <div class="child" style="float:right">
					<div id="mapinfo1-2" style="margin-left:36px;"><strong>서울특별시 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층</strong></div>
			    </div>
			</div>
			<div class="parent" style="width: 300px; height: 100px; margin:35px 30px 10px 10px;">
			    <div class="child">
					 <div id="mapinfo1"><b>전화번호</b></div>
			    </div>
			    <div class="child" style="float:right">
					<div id="mapinfo1-2"><strong>1544-9970 주말 및 공휴일도 통화 가능 합니다.</strong></div>	
			    </div>
			</div>    
		
			    
			  		
		</div>
	</div>
</body>
</html>