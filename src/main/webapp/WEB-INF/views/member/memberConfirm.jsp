<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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



	.joinArea{margin-top: 3%;}
	th {text-align: right;}
	td {padding: 5px 10px;}
	.must {color: red;}
	#updateBtn {
		background: rgb(212, 129, 91); color: white; font-weight: bold; padding: 5px; margin:5px;
		border: 0; border-radius: 7px; width: 80px;
	}
	#reset {
		background: rgb(204, 65, 57); color: white; font-weight: bold; padding: 5px; margin:5px;
		border: 0; border-radius: 7px; width: 80px;
	}
	#homeBtn {
		background: rgb(26, 188, 156); color: white; font-weight: bold; padding: 5px; margin:5px;
		border: 0; border-radius: 7px; width: 100px;
	}
	#nickCheck{
		background: rgb(212, 129, 91); color: white; padding: 5px; margin:5px;
		border: 0; border-radius: 7px; font-size: 12px;
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
			<h2 id="sideMainTitle">마이페이지</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">My Page</h4>
		</div>
		<div class="sideButton" onclick="location.href='memberCheck.me';">
			<h3 id="sideButton1">
				<img id="sideImg1" />
				회원정보 수정
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='memberdelete.me';">
			<h3 id="sideButton2">
				<img id="sideImg2" />
				회원 탈퇴
			</h3>
		</div>		
	</div>

<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p>회원정보 수정</p>
		</div>
		
		<div align="center" class="loginArea">
			<h3>비밀번호 재확인</h3>
			<p>이용자의 정보를 안전하게 보호하가 위해 비밀번호를 한번 더 입력하십시오. </p>
			<form action="login.me" method="">
				<table id="loginTable" style="text-align:center;">
					<tr>
						<th width="100px">아이디</th>
						<td colspan="2"><input type="text" name="id" placeholder="아이디"></td>
					</tr>			
					<tr>
						<th>비밀번호</th>
						<td colspan="2"><input type="password" name="pwd" placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td colspan="3"><button id="loginBtn">로그인</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

		
</body>
</html>