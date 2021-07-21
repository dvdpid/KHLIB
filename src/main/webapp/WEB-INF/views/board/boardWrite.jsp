<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<link rel="stylesheet" href="resources/css/board/boardWrite.css" type="text/css">
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
	</div>

<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/clipboard-list-solid.svg"/>자유게시판 등록</p>
		</div>
		
		<!-- 게시판 작성 수정 부분 -->
	<div class="board-list">
		<div class="board-upload">
			<div align="center">
				<form action="boardWrite.bo" method="post" enctype="multipart/form-data">
					<table class="board-upload2">
						<tr>
							<th>제목 </th>
							<td><input type="text" size="50" name="bTitle" required></td>  
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
							<th>첨부파일</th>
							<td class="td1" colspan="3">
							 <input type="file" name="uploadFile">
							</td>
						</tr>
						
						<tr>
							<td colspan="4">
								<input type="submit" value="등록 하기"> &nbsp;
								<button onclick="location.href='board.bo'">목록으로</button>
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