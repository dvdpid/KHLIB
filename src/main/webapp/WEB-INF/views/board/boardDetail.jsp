<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<link rel="stylesheet" href="resources/css/board/boardDetail.css?ver=3.0" type="text/css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
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
			<p>${ board.bTitle }</p>
		</div>
		
		<br>
		 
		<div class="tableArea">
		<input type="hidden" name="bNo" value="${ board.bNo }">
		<table id="dtable" >
			<tr>
				<th width="100" height="30">제목</th>
				<td colspan="5">${ board.bTitle }</td>
			</tr>
			<tr>
				<th height="30">작성자</th>
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
				<td colspan="6" height="300">
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
		</table>
		
			<table id="btntable">
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
			
			
			
			<br>
			<tr>
				<td colspan="6" align="center">
				<c:if test="${ loginUser.nickname == board.bWriter }">
					<button id="button1" onclick="location.href='${ bupdateForm }'">수정</button>
					<button id="button2">삭제</button>
				</c:if>	
					<button id="button3" onclick="location.href='${ blist }'">목록으로</button>
				</td>
			</tr>
			
			</table>
			
		</div>
		
		<br>
		<div class="replyArea">
			<div class="replyWriterArea"> <!-- 댓글 작성 부분 -->
				<table id="replytable">
					<tr>
						<th width="140">댓글</th>
						<td><textarea rows="2" cols="70" id="cContent" style="resize:none;"></textarea>
						<td width="140"><button id="cSubmit">댓글 등록</button></td>
					</tr>
				</table>
			</div>
			<br>
			<div id="replySelectArea"><!-- 댓글 조회 부분 -->
				<table id="rtb" >
					<thead>
						<tr>
							<td colspan="3"><b id="cCount"></b></td>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<br>
			</div>
		</div>	
	</div>	

	<input type="hidden" id="loginuser" value="${loginUser}" >
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
				
				var loginuser=document.getElementById("loginuser").value;
				console.log(loginuser);
				if(!loginuser){
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
							var $cContent = $('<td width=460>').text(data[i].cContent);
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