<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<link rel="stylesheet" href="resources/css/board/boardUpdate.css" type="text/css">
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
			<p>자유게시판 수정</p>
		</div>
		
		<!-- 게시판 작성 수정 부분 -->
	<div class="board-list">
		<div class="board-upload">
			<div align="center">
				<form action="boardUpdate.bo" method="post" enctype="multipart/form-data">
					<input type="hidden" name="page" value="${ page }">
					<input type="hidden" name="bNo" value="${ board.bNo }">
					<input type="hidden" name="changeName" value="${ file.changeName }">
					<table class="board-upload2">
						<tr>
							<th>제목 </th>
							<td>
								<input type="text" size="50" name="bTitle" value="${ board.bTitle }" required>
							</td>  
							<th>작성자</th>
							<td>	
								<input type="hidden" name="bWriter" value="${ board.bWriter }">
								${ board.bWriter }
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">
								<textarea name="bContent" rows="20" cols="85">${ board.bContent }</textarea>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<input type="file" name="reloadFile">
								<c:if test="${ !empty file.originName }">
									<br>현재 업로드한 파일 : 
									<a href="${ contextPath }/resources/boardUploadFiles/${ file.changeName }" download="${ file.originName }">
										${ file.originName }
									</a>	
								</c:if>
							</td>
						</tr>
					</table>
					<div align="center">
						<input type="submit" id="inBtn" value="수정하기"> &nbsp;
						<button onclick="location.href='javascript:history.go(-1);'">취소하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>