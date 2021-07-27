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
				문화 수정
			</p>
		</div>
		<br>
		<form action="cUpdate.ad" method="post" encType="multipart/form-data">
			<input type="hidden" name="cNo" value="${cList[0].cNo }">
			<table id="bkInsertTable">
				<tr>
					<th width="100">문화 제목</th>
					<td colspan="3" height="40px">
						<input type="text" name="cTitle" size="40" value="${cList[0].cTitle }" required style="height:25px;">
					</td>
					<th>모집 인원</th>
					<td>
						<input type="text" name="cTotal" size="10"  value="${cList[0].cTotal }" required style="height:25px;">
					</td>
				</tr>
				<tr>
					<th>모집 시작</th>
					<td colspan="3">
						<input type="datetime-local" name="cStartDate" size="40"  value="${cList[0].cStartDate }" required style="height:25px;">
					</td>
					<th>모집 마감</th>
					<td><input type="datetime-local" name="cEndDate" value="${cList[0].cEndDate }" required style="height:25px;"></td>
				</tr>
					<tr>
					<th>강의 시간</th>
					<td colspan="3">
						<input type="text" name="lTime" value="${cList[0].lTime }" size="10" required style="height:25px;">
					</td>
					<th>강의 날짜</th>
					<td><input type="datetime-local"  value="${cList[0].lDate }" size="40" name="lDate" required style="height:25px;"></td>
				</tr>
				<tr>
					<th>강사</th>
					<td colspan="3"><input type="text" name="cInstructor" value="${cList[0].cInstructor }" size="10" required style="height:25px;"></td>
					<th>대상</th>
					<td colspan="3"><input type="text" name="cTarget"  value="${cList[0].cTarget }" size="10" required style="height:25px;"></td>
				</tr>
				<tr>
					<th>장소</th>
					<td colspan="3"><input type="text" name="cPlace"  value="${cList[0].cPlace }" size="50" required style="height:25px;"></td>
				</tr>
				<tr>
					<th rowspan="2">프로그램 설명</th>
				</tr>
				<tr>
					<td colspan="5">
						<textarea rows="20" cols="103" name="cContent" id="subIntro"  class="intro" placeholder=""><c:out value="${cList[0].cContent }"></c:out></textarea>
					</td>
				</tr>
			<tr>
				<td style="font-size: 20px;"><b>문화 표지</b></td>
				<td colspan="3">
				<div id="titleImgArea" style="width: 350px; height: 200px;">
					<img id="titleImg" width="350" height="200" src="resources/CultureUploadFiles/${fList[0].changeName }">
				</div>
				</td>
				</tr>
				<tr>
						<th>첨부파일</th>
						<td><input type="file" name="uploadFile"></td>
				</tr>
				</table>
				
				<div class="empty" style="height:50px;"></div>
				<div style="margin: 0px 60px;">
					<input type="submit" id="inBtn" value="문화 수정" class="btn"> &nbsp;
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