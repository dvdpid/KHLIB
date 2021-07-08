<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="UTF-8">
<title>홈페이지</title>
<style>
	.groupArea a{
		pointer-events:none;
	}
</style>
<link rel="stylesheet" href="resources/css/common/mainPage.css" type="text/css">
<link rel="stylesheet" href="resources/css/common/lightslider.css" type="text/css">
</head>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="resources/js/lightslider.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- <script type="text/javascript" src="resources/js/lightslider.js"></script> -->
<script>
	$(document).ready(function() {
	    $('#autoWidth').lightSlider({
	        autoWidth:true,
	        loop:true,
	        onSliderLoad: function() {
	            $('#autoWidth').removeClass('cS-hidden');
	        } 
	    });  
	  });
</script>
</head>
<body>
	<c:import url="common/menubar.jsp"></c:import>
	
		<div class="leftArea">
			<div class="searchArea">
				<input type="text" placeholder="검색할 도서명 입력"><button id="searchBtn">검색</button>
			</div>
			<div class="noticeArea">
				<div id="noticeTitle"><span>공지사항</span><button id="noticeBtn">+ 더보기</button></div>
				<div id="noticeTable">
					<table>
						<thead style="background:rgba(224, 224, 224, 0.5); font-weight: 700;">
							<tr>
								<td>No.</td>
								<td>Name</td>
								<td>Value</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>공지사항</td>
								<td></td>
							</tr>
							<tr>
								<td>2</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>3</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>4</td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="bookArea">
				<div id="bookTitle"><span>이 달의 추천 도서</span><button id="bookBtn">+ 더보기</button></div>
				<div id="bookList">
					<div class="container">
					<!-- 슬라이더 -->
					<ul id="autoWidth" class="cS-hidden">
  						<li class="item-a">
  							<div class="box">  <!-- 이미지 넣는 박스 -->
								<img src="resources/images/book/book1.png" class="model">
							</div>
  						</li>
  						<li class="item-a">
  							<div class="box">  <!-- 이미지 넣는 박스 -->
								<img src="resources/images/book/book2.png" class="model">
							</div>
  						</li>
  						
  						<li class="item-a">
  							<div class="box">  <!-- 이미지 넣는 박스 -->
								<img src="resources/images/book/book3.png" class="model">
							</div>
  						</li>
  						
  						<li class="item-a">
  							<div class="box">  <!-- 이미지 넣는 박스 -->
								<img src="resources/images/book/book4.png" class="model">
							</div>
  						</li>
  						
  						<li class="item-a">
  							<div class="box">  <!-- 이미지 넣는 박스 -->
								<img src="resources/images/book/book5.png" class="model">
							</div>
  						</li>
  						
  					</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="rightArea">
			<div class="Mainbutton">
				<button id="button1">열람실 현황</button>
				<button id="button2">프로그램 신청</button>
				<button id="button3">도서 기부</button>
			</div>
			<div class="buttonViewArea">
				<div id="viewArea">열람실 현황 페이지</div>
			</div>
			<div class="groupArea">
				<c:import url="test.jsp"></c:import>
			</div>
		</div>
		<br><br>
  <c:import url="common/footer.jsp"/>

</body>
</html>