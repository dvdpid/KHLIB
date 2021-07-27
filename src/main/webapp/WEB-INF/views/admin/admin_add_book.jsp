<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 회원 </title>

<link href="<c:url value="/resources/css/admin/admin.css"/>" rel='stylesheet' />
<link rel="stylesheet" href="resources/css/bkGroupInsert.css?ver=3.0" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/admin.js" defer></script>
</head>
<body>
<!-- 헤더부분 -->
<c:import url="../common/admin_header.jsp"></c:import>
	
	
<!-- 사이드 부분 -->
	<c:import url="../common/admin_side.jsp"></c:import>
	
<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p>
				<img id="titleImg1" src="resources/images/clipboard-list-solid.svg"/>
				도서 등록
			</p>
		</div>
		<br>
		<form action="bkinsert.ad" method="post" encType="multipart/form-data">
			<table id="bkInsertTable">
				<tr>
					<th width="100">책제목</th>
					<td colspan="3" height="40px">
						<input type="text" name="bTitle" size="40" required style="height:25px;">
					</td>
					<th>저자</th>
					<td>
						<input type="text" name="bWriter" size="40" required style="height:25px;">
					</td>
				</tr>
				<tr>
					<th>출판사</th>
					<td colspan="3">
						<input type="text" name="bCompany" size="40" required style="height:25px;">
					</td>
					<th>출판 년도</th>
					<td><input type="date" name="bDate" required></td>
				</tr>
					<tr>
					<th>형태 사항</th>
					<td colspan="3">
						<input type="text" name="bForm" size="40" required style="height:25px;">
					</td>
					<th>표준 번호</th>
					<td><input type="text" size="40" name="bStandardNo" required style="height:25px;"></td>
				</tr>
					<tr>
					<th>분류 기호</th>
					<td colspan="3">
						<input type="text" name="bCallNo" size="40" required style="height:25px;">
					</td>
				</tr>
				<tr>
					<th rowspan="2">책 줄거리</th>
				</tr>
				<tr>
					<td colspan="5">
						<textarea rows="20" cols="103" name="bContent" id="subIntro" value="" class="intro" placeholder=""></textarea>
					</td>
				</tr>
				<tr>
					<td style="font-size: 20px;"><b>책 표지</b></td>
					<td colspan="3">
						<div id="titleImgArea" style="width: 350px; height: 200px;">
							<img id="titleImg" width="350" height="200">
						</div>
					</td>
					</tr>
				
			</table>
				<div class="empty" style="height:50px;"></div>
				<div style="margin: 0px 60px;">
					<input type="submit" id="inBtn" value="등록하기" class="btn"> &nbsp;
					<input type="reset" id="inBtn" value="새로 입력" onclick="resetInsertData()">
				</div>
			
			
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
				</div>
			<script>
				$(function(){
						$("#fileArea").hide();
						
						$("#titleImgArea").click(function(){
							$("#thumbnailImg1").click();
						});
					});
					
					// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){								
								switch(num){
								case 1: 
									$("#titleImg").attr("src", e.target.result);
									break;
								}
							}
							
							reader.readAsDataURL(value.files[0]);
						}
					}
			</script>
		</form>
		</div>
</body>
</html>