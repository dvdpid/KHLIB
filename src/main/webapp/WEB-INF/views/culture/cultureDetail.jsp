<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화마당 프로그램 상세정보</title>
<link rel="stylesheet" href="resources/css/cultureDetail.css?ver=1.0" type="text/css">
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
		<div class="programInfoTable">
			<div id="title">도시공간 상상하기</div>
			<div class="titleSub">일시 : 2021년 6월 25일 19시 30분</div>
			<div class="titleSub">장소 : 브링크 삼덕 아지트</div>
			<table id="programDetailTable">
				<tr>
					<td>접수 기간</td>
					<td>
						6월 4일 금요일 오후 2시 ~ 6월 18일 오후 8시
					</td>
				</tr>
				<tr>
					<td>강연자</td>
					<td>
						박신우
					</td>
				</tr>
				<tr>
					<td>강의 시간</td>
					<td>
						6월25일 금요일 19시 30분 ~ 22시 30분
					</td>
				</tr>
				<tr>
					<td>교육 대상</td>
					<td>
						성인
					</td>
				</tr>
				<tr>
					<td>신청/정원</td>
					<td>
						21/30
					</td>
				</tr>
				<tr>
					<td>문의</td>
					<td>
						독서문화진흥과
					</td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td>
						Go to the link
					</td>
				</tr>
			</table>
			<button id="signBtn">프로그램 신청</button>
			<button id="listBtn">목록으로</button>
		</div>
		<div class="programImageTable">
			<img id="cultureImg" src="resources/images/cDetailImg.jpg">
			<div id="programEx">프로그램 설명</div>
			<div id="programExDetail">
피부가 얼마나 생생하며 그들의 눈에 무엇이 타오르고 있는가? 
우리 눈이 그것을 보는 때에 우리의 귀는 생의

주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 
그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으며 
그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 
그와 같지 못하다 할지라도 창공에 반짝이는 뭇 별과 같이 산야에 피어나는 군영과

운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 
목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다 이상의 꽃이 없으면 
쓸쓸한 인간에 남는 것은 영락과
			</div>
		</div>
	</div>
</body>
</html>