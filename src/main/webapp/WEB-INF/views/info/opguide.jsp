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
			<p><img id="titleImg1" src="resources/images/info/time.png"/>
			이용 안내</p>
		</div>
		<div class="empty" style="height:50px;"></div>
		<div class="infoSpace">
		
				<table id="infoTable" style="width: 100%;border: 1px solid #444444;">
						<caption style="text-align: left; font-size:28px; margin-bottom:30px;"><b>도서관 이용시간 안내표-자료실, 평일 (월~금), 주말 (토, 일)</b></caption>
						
						<colgroup>
						<col>
						<col>
						<col>
						<col>
						</colgroup>
						
						<thead style="text-align: center; font-size:20px;">
							<tr>
								<th scope="col" style="border: 1px solid #444444;" >자료실</th>
								<th scope="col" style="border: 1px solid #444444;">월~금요일</th>
								<th scope="col" style="border: 1px solid #444444;">토-일요일</th>
								<th scope="col" style="border: 1px solid #444444;">비고</th>
							</tr>
						</thead>
						<tbody>
							<tr style="text-align: left; font-size:18px;">
								<td class="alignCenter"style="border: 1px solid #444444;"><p>일반 자료실</p></td>
								<td class="alignCenter" rowspan="2"style="border: 1px solid #444444;">09:00 ~ 19:00</td>
								<td class="alignCenter" rowspan="3"style="border: 1px solid #444444;">09:00 ~ 17:00</td>
								<td class="alignCenter" rowspan="5"style="border: 1px solid #444444;">정부 방역지침에 따라 운영시간 변동 가능</td>
							</tr>
							<tr style="text-align: left; font-size:18px;">
								<td class="alignCenter"style="border: 1px solid #444444;"><p>디지털 자료실</p></td>
							</tr>
							
						</tbody>
					</table>
			<div class="guideContent">
			<h3 class="guideTitle1"  style="text-align: left;">휴관일 안내</h3>
			<ul class="guideList2"  style="text-align: left;">
				<li>매주 월요일</li>
				<li>일요일을 제외한 법정공휴일 및 국가가 정한 임시 휴일</li>
				<li>코로나 확진자 방역으로 인한 임시 휴관</li>
			</ul>
		</div>
			<br>

		</div>
	</div>
</body>
</html>