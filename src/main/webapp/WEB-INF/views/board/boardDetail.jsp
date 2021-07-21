<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>`
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<link rel="stylesheet" href="resources/css/board/boardDetail.css" type="text/css">
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
			<p>자유게시판</p>
		</div>
		
		<br>
		 
	<div class="outer">
		<div class="tableArea">
		<input type="hidden" name="bNo" value="${ board.bNo }">
		<table>
			<tr>
				<th>제목</th>
				<td colspan="5">${ board.bTitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${ board.bWriter }</td>
				<th>조회수</th>
				<td>${ board.bCount }</td>
				<th>작성일</th>
				<td>${ board.bDate }</td>
			</tr>
			<tr>
				<th colspan="6">내용</th>
			</tr>
			<tr>
				<td colspan="6">
					<% pageContext.setAttribute("newLineChar", "\r\n"); %> 
					${ fn:replace(board.bContent, newLineChar, "<br>") }
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<c:if test="${ !empty file.originName }">
					<td colspan="5">
						<a href="${ contextPath }/resources/boardUploadFiles/${ file.changeName }" download="${ file.originName }">${ file.originName }</a>
						<!-- a태그 안에서 다운로드 받을 것이 있을 때 쓰는 속성 download, 얘는 download="fileName" 이라고 해서 fileName을 지정해줄 수 있다. -->
					</td>
				</c:if>
				<c:if test="${ empty file.originName }">
					<td colspan="5">첨부 파일이 없습니다.</td>
				</c:if>
			</tr>
		
			<c:url var="bupdateForm" value="bupdateForm.bo">
				<c:param name="bNo" value="${ board.bNo }"/>
				<c:param name="page" value="${ page }"/>
			</c:url>
			<c:url var="bdelete" value="bdelete.bo">
				<c:param name="bNo" value="${ board.bNo }"/>
			</c:url>
			<c:url var="blist" value="board.bo">
				<c:param name="page" value="${ page }"/>
			</c:url>
			
			<c:if test="${ loginUser.nickname == board.bWriter }">
			<tr>
				<td colspan="6" align="center">
					<button id="button1" onclick="location.href='${ bupdateForm }'">수정</button>
					<button id="button2">삭제</button>
					<button id="button3">목록으로</button>
				</td>
			</tr>
			</c:if>
			
			</table>
		</div>
		
		<div class="replyArea">
			<div class="replyWriterArea"><!-- 댓글 작성 부분 -->
				<table>
					<tr>
						<td>댓글 작성</td>
						<td><textarea rows="3" cols="60" id="cContent" style="resize:none;"></textarea>
						<td><button id="cSubmit">댓글 등록</button></td>
					</tr>
				</table>
			</div>
			
			<div id="replySelectArea"><!-- 댓글 조회 부분 -->
				<table id="rtb">
					<thead>
						<tr>
							<td colspan="2"><b id="cCount"></b></td>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>	
		

	<script>
		$(function(){
			$('#button2').on('click', function(){
				var bool = confirm('정말로 삭제하시겠습니까?');
				
				if(bool){
					 location.href="${ bdelete }";
					 alert('삭제되었습니다.');
				}
			});
		});
		
		$(function(){
			 getContentsList();
			 
			// 댓글 10초마다 갱신하기
			 setInterval(function() {
				getContentsList();
			}, 10000);
			 
			$('#cSubmit').on('click', function(){
				
				if(${ empty loginUser }){
					alert('로그인 후 이용 가능합니다.');
					location.href="${contextPath}/loginForm.me";
				} 
				
				var cContent = $('#cContent').val();
				var bNo = ${board.bNo};
				
				console.log(bNo);
				
				$.ajax({
					url: 'addComments.bo',
					data: {cContent:cContent, bNo:bNo},
					success: function(data){
						console.log(data);
						
						if(data == 'success'){
							$('#cContent').val('');
							getContentsList();
						}
					}
				});
				
			});
		});
		
		function getContentsList(){
			var bNo = ${board.bNo};
			
			$.ajax({
				url: 'cList.bo',
				data: {bNo:bNo},
				dataType: 'json',
				success: function(data){
					console.log(data);
					
					var $tableBody = $('#rtb tbody');
					$tableBody.html('');
					
					$('#cCount').text('댓글(' + data.length + ')');
					if(data.length > 0){
						for(var i in data){
							var $tr = $('<tr>');
							var $cWriter = $('<td width=100>').text(data[i].cWriter);
							var $cContent = $('<td>').text(data[i].cContent);
							var $cDate = $('<td width=100>').text(data[i].cDate);
							
							$tr.append($cWriter);
							$tr.append($cContent);
							$tr.append($cDate);
							$tableBody.append($tr);
							
						} 
					} else {
							var $tr = $('<tr>');
							var $cContent = $('<td colspan=3>').text('등록된 댓글이 없습니다.');
							
							$tr.append($cContent);
							$tableBody.append($tr);
					}
				}
			});
			
		}
		
	</script>
	
</body>
</html>