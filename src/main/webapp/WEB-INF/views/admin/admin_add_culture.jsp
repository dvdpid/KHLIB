<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 회원 </title>
<link href="<c:url value="/resources/css/admin/admin.css"/>" rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/admin.js" defer></script>
</head>
<body>
<!-- 헤더부분 -->
<c:import url="common/admin_header.jsp"></c:import>
	
	
<!-- 사이드 부분 -->
<c:import url="common/admin_side.jsp"></c:import>
	
<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/icon5.png"/>
			문화 등록</p>
		</div>
		<div class="empty" style="height:50px;"></div>
		
		<div>
			<table style="width: 80%; border-spacing: 5px 30px;">
			<tr>
				<td style="font-size: 20px;"><b>문화 제목</b></td>
				<td><input type="text" name="name"></td>
				<td style="font-size: 20px;"><b>모집 인원</b></td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td style="font-size: 20px;"><b>접수 기간</b></td>
				<td><input type="text" name="price"></td>
				<td style="font-size: 20px;"><b>장소</b></td>
				<td><input type="text" name="stock"></td>
			</tr>
			<tr>
				<td style="font-size: 20px;"><b>강의 시간</b></td>
				<td><input type="text" name="price"></td>
				<td style="font-size: 20px;"><b>강사</b></td>
				<td><input type="text" name="stock"></td>
			</tr>
			<tr>
				<td style="font-size: 20px;"><b>대상</b></td>
				<td><input type="text" name="stock"></td>
			</tr>
			<tr>
				<td style="font-size: 20px;"><b>프로그램 설명</b></td>
				<td><textarea name="detail" rows="15" cols="90"></textarea></td>
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
					<input type="submit" value="도서 등록">
					<input type="reset" value="새로 입력" onclick="resetInsertData()">
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
		</div>
	</div>
</body>
</html>