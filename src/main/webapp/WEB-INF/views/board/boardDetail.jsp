<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
@charset "UTF-8";

	body{ margin: 0; }
	
	a{ text-decoration: none; }
	
	#header{
		font-weight: bold;
		background-color: rgb(212, 129, 91);
		font-size: 10px;
		color: white;
	}
	
	.wrapper{
		width: 100%;
		min-height: 30px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.logo{
		font-size: 15px;
		font-weight: 900;
		margin-left: 60px;
		color: black;
	}
	
	.lists{ display: flex; margin-right: 60px; }
	
	.lists li{ list-style-type:none; }
	
	.lists li a{
		color: white;
		padding: 10px 20px;
	}
	
	.lists li a:hover{ background: rgb(159, 101, 74); }
	
	#top{
		font-weight: bold;
		border-bottom: 2px solid lightgray;
		font-size: 13px;
	}
	
	#topWrapper{ min-height: 50px; }
	
	.topLists{ display: flex; margin-right: 60px; margin-top: 0; margin-bottom: 0;}
	
	.topLists li{ list-style-type:none;}
	
	.topLists li a{
		display:block;
		color: black;
		padding: 17px 20px;
	}
	
	.topLists li a:hover{
		background: rgba(212, 129, 91, 0.5);
		color:white;
	}
	
	.toggleBtn{
		display:none;
	}
	
	.left{ float: left; width: 25%; }
	
	.sideTitle{
		background: rgb(212, 129, 91);
		color: white;
		align-items: center;
		margin: 30px 30px 15px 30px;
		padding: 30px 30px;
	}
	
	.sideButton{
		background: lightgray;
		color: black;
		text-align: center;
		margin: 15px 30px 15px 30px;
		padding: 10px 25px;
	}
	
	.main{ float: right; width: 75%; text-align: center; }
	
	.mainTitle{
		font-weight: 900;
		border-bottom: 2px solid lightgray;
		font-size: 30px;
		margin: 25px 60px 0px 60px;
		padding: 0px 0px 13px 0px;
	}
	
	.mainTitle p{ text-align: left; width: 70%; margin: 0;}

	#titleImg1{ 
		width: 25px; height: auto; vertical-align:middle;
		padding-bottom: 7px;
		margin-right: 10px;
	}
	
	.infoSpace{ margin: 0px 60px 0px 60px; }
	
	#infoTable{
		border-top: 2px solid lightgray;
		border-bottom: 2px solid lightgray;
		border-left: none;
		border-right: none;
		border-collapse: collapse;
		width: 100%;
		font-size:10px;
	}
	
	td{
		border: 1px solid lightgray;
		border-left: none;
		border-right: none;
		border-collapse: collapse;
		padding: 10px 25px;
	}
	
	.sideButton{
		text-align: left;
		padding-left : 30px;
		cursor: pointer;
	}
	
	.sideButton a{ color: black; }
	
	#infoImg1 { width: 100%; height: auto; }
	
	.sideButton img{
		width: auto; height: 30px; vertical-align:middle;
		padding-bottom: 7px;
		margin-right: 5px;
	}
	
	.sideButton a{
		display:block;
		color: black;
		padding: 17px 20px;
	}
	
	.sideButton:hover{
		background: gray;
	}
	
	
@media screen and (max-width: 1035px){
	#topWrapper{
		align-items: flex-start;
		padding: 8px 24px;
		min-height: 20px;
	}
	
	.topLists{
		display:none;
		flex-direction: column;
		align-items:center;
		width: 100%;
	}
	
	.logo { white-space: nowrap;}
	
	.topLists li, .topLists li a{ text-align:center; width: 100%; margin-right: 150px;}
	
	.toggleBtn{
		display:block;
		position: absolute;
		right: 45px;
		border: none;
		background: none;
		align-items: center;
	}
	
	.topLists.active{ 
		display: flex;
		flex-direction: column;
		align-items:center;
		width: 100%;
		margin: 26px 60px 0px 0px;
	}
	
	.left{ display: none; }
	.main{ width: 100%; }
	
}


.board-list span {
	font-size: 20px;
}


/*게시판 작성부분*/
.board-upload {
	position: center;
	width: auto;
	box-sizing: border-box;
}

.board-upload2 {
	table-layout: fixed
}

.board-upload table th {
	text-align: left;
}

.board-upload2 {
	border-spacing: 15px;
	border-collapse: collapse;
}

.board-upload2 tr {
	border-bottom: 1px solid #ccc;
	height: 40px;
	font-size: 18px;
}

#btn {
	background-color: rgb(212, 129, 91);
	border: none;
	color: #fff;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin-top: 20px;
	cursor: pointer;
	border-radius: 5px;
	align: center;
}

/**/
	#boardDetailTable {
			width: 800px; 
			margin: auto; 
			border-collapse: collapse; 
			border-left: hidden; 
			border-right: hidden;
}
			
	#boardDetailTable tr td{
			padding: 5px;
}
			
	.replyTable{
			margin: auto; 
			width: 500px;
}
			
	.tableArea{
			margin: auto; 
			width: 500px;
}

	#button1{	
			background: rgb(212, 129, 91); 
			color: white; 
			font-weight: bold; 
			padding: 5px; margin:5px;
			border: 0; border-radius: 7px; 
			width: 80px;
}
	
	#button2{
			background: rgb(153, 153, 153); 
			color: white; 
			font-weight: bold; padding: 5px; margin:5px;
			border: 0; border-radius: 7px; width: 80px;
}

</style>

<meta charset="UTF-8">
<title>게시판 리스트</title>
<link rel="stylesheet" href="resources/css/roomInfo.css" type="text/css">
<script src="resources/js/roomInfo.js" defer></script>
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
			<form action="" id="detailForm" method="post">
				<table>
					<tr>
						<th>제목</th>
						<td colspan="3"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td></td>
						<th>조회수</th>
						<td></td>
						<th>작성일</th>
						<td></td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="6">
							<textarea cols="60" rows="15" style="resize:none;" readonly></textarea>
						</td>
					</tr>
				</table>
				
				<div align="center">
					<input type="submit" id="button1" value="수정">
					<input type="button" onclick="" id="button1" value="메뉴로">
					<input type="button" onclick="" id="button2" value="삭제">
				</div>
			</form>
		</div>
		
		<br>
		<c:if test="${ !empty board.originalFileName }">
			<tr>
				<th>첨부파일</th>
				<td>
					<a href="${ contextPath }/resources/buploadFiles/${ board.renameFileName }" download="${ board.originalFileName }">${ board.originalFileName }</a>
					<!-- a태그 안에서 다운로드 받을 것이 있을 때 쓰는 속성 download, 얘는 download="fileName" 이라고 해서 fileName을 지정해줄 수 있다. -->
				</td>
			</tr>
		</c:if>
		
			<c:url var="bupView" value="bupView.bo">
				<c:param name="bId" value="${ board.bId }"/>
				<c:param name="page" value="${ page }"/>
			</c:url>
			<c:url var="bdelete" value="bdelete.bo">
				<c:param name="bId" value="${ board.bId }"/>
			</c:url>
			<c:url var="blist" value="blist.bo">
				<c:param name="page" value="${ page }"/>
			</c:url>
			
			<c:if test="${ loginUser.id eq board.bWriter }">
			<tr>
				<td colspan="2" align="center">
					<button id="button1" onclick="location.href='${ bupView }'">수정</button>
					<button id="button2" onclick="location.href='${ bdelete }'">삭제</button>
				</td>
			</tr>
			</c:if>
			
		</table>
		
		<div class="replyArea">
			<div class="replyWriterArea"><!-- 댓글 작성 부분 -->
				<table>
					<tr>
						<td>댓글 작성</td>
						<td><textarea rows="3" cols="60" id="replyContent" style="resize:none;"></textarea>
						<td><button id="button1">댓글 등록</button></td>
					</tr>
				</table>
			</div>
			
			<div id="replySelectArea"><!-- 댓글 조회 부분 -->
				<table id="replySelectTable">
					<!-- <tr><td colspan="3">댓글이 없습니다.</td></tr>  -->	
					<%-- 댓글이 있다면 (비어있지 않다면), 행이 여러개 나올 것이기 때문에 for문을 넣어줌 --%>
							<tr>
								<td width="100px"></td>
								<td width="400px"></td>
								<td width="200px"></td>
							</tr>
				</table>
			</div>
		</div>	

	
	
</body>
</html>

</body>
</html>