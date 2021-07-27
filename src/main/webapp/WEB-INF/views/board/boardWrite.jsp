<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<link rel="stylesheet" href="resources/css/board/boardWrite.css?ver=1.0" type="text/css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- 헤더부분 -->
<c:import url="../common/menubar.jsp"/>
	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">자유게시판</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='board.bo';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				자유게시판
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='noticeList.nt';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/icon7.png"/>
				공지사항
			</h3>
		</div>
	</div>


<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/clipboard-list-solid.svg"/>자유게시판 등록</p>
		</div>
		
		<br>
		<!-- 게시판 작성 수정 부분 -->
	<div class="board-list">
		<div class="board-upload">
			<div align="center">
				<form action="boardWrite.bo" method="post" enctype="multipart/form-data">
					<table id="writeTable">
						<tr>
							<th height="40px">제목 </th>
							<td>
								<input type="text" height="40px" size="50" name="bTitle" required></td>  
							<th>작성자</th>
							<td>	
								<input type="hidden" name="bWriter" value="${ loginUser.nickname }">
								${ loginUser.nickname }
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea name="bContent" id="bContent" rows="20" cols="80" required></textarea></td>
						</tr>
						
						<tr>
							<td colspan="4" style="border-top: 1px solid lightgray;"></td>
						</tr>
						
						<tr>
							<th>첨부파일</th>
							<td class="td1" colspan="3">
							 <input type="file" name="uploadFile">
							</td>
						</tr>
						
						<tr>
							<td colspan="4" style="text-align: center">
								<input type="submit" class="buttons" value="등록 하기"> &nbsp;
								<button class="buttons" onclick="location.href='board.bo'">목록으로</button>
							</td>
						</tr>
						
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>