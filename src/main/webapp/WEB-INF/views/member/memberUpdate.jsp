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
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton1">
				<img id="sideImg1" />
				회원정보 수정
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton2">
				<img id="sideImg2" />
				회원 탈퇴
			</h3>
		</div>		
	</div>

<!-- 메인 부분 -->	
	<!-- 올해 년도 설정 -->
	<c:set var="now" value="<%= new java.util.Date() %>" />
	<c:set var="nowYear"><fmt:formatDate value="${ now }" pattern="yyyy" /></c:set>
	
		<div class="joinArea" align="center">
			<h1>회원정보 수정</h1>
			<form aciton="joinMember.me" method="post">
				<table id="joinMemberTable">
					<tr>
						<th><label class="must">*</label> 아이디 </th>
						<td width="200px"><input type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"required style="width: 100%;"></td>
						<td width="100px"><label id="idResult"></label></td>
					</tr>
					<tr>
						<th><label class="must">*</label> 비밀번호 </th>
						<td><input type="password" name="pwd1" placeholder="변경 할 비밀번호" required style="width: 100%;"></td>
						<td></td>
					</tr>
					<tr>
						<th><label class="must">*</label> 비밀번호 확인 </th>
						<td><input type="password" name="pwd2" placeholder="비밀번호 확인" required style="width: 100%;"></td>
						<td><label id="pwdResult"></label></td>
					</tr>
					<tr>
						<th><label class="must">*</label> 이름 </th>
						<td><input type="text" id="userName" name="userName" value="${member.userName}" required style="width: 100%;"></td>
						<td></td>
					</tr>
					<tr>
						<th><label class="must">*</label> 닉네임 </th>
						<td><input type="text" id="nickname" name="nickname" value="${member.nickName}" required style="width: 100%;"></td>
						<td width="100px"><input type="button" id="nickCheck" value="중복확인"></td>
					</tr>
					<tr>
						<th>생일</th>
						<td>
							<select name="year">
								<c:forEach var="i" begin="1990" end="${ nowYear }" step="1">
									<option value="${ nowYear - i + 1990 }">${ nowYear - i + 1990 }</option>
								</c:forEach>
							</select>년
							<select name="month">
								<c:forEach var="j" begin="1" end="12" step="1">
									<option value="${ j }">${ j }</option>
								</c:forEach>
							</select>월
							<select name="day">
								<c:forEach var="k" begin="1" end="31" step="1">
									<option value="${ k }">${ k }</option>
								</c:forEach>
							</select>일
						</td>
						<td></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<input type="radio" name="gender" value="M">남자
							<input type="radio" name="gender" value="W">여자
						</td>
						<td></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" id="phone" name="phone" value="${member.phone}" style="width: 100%;"></td>
					</tr>
					<tr>
						<th><label class="must">*</label> 이메일 </th>
						<td><input type="text" id="email" name="email" value="${member.email}" placeholder="이메일" required style="width: 100%;"></td>
						<td></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>
							<input type="text" name="post" class="postcodify_postcode5" value="" size="6">
							<button type="button" id="postcodify_search_button">검색</button>
						</td>
						<td></td>
				</tr>
				<tr>
					<th>도로명 주소</th>
					<td><input type="text" name="address1" class="postcodify_address" value="" style="width: 100%;"></td>
					<td></td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td><input type="text" name="address2" class="postcodify_extra_info" value="" style="width: 100%;"></td>
					<td></td>
				</tr>
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
					$(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					});
				</script>
				<tr>
					<td colspan="3" align="center">
						<button id="updateBtn" onclick="validate();">수정하기</button>
						<button type="button" id="homeBtn" onclick="location.href='mypage.do'">마이페이지로</button>
						<input type="reset" id="reset" value="취소하기">
					</td>
				</tr>
				</table>
			</form>
		</div>
		
		<br>
		
		<c:import url="common/footer.jsp"/>
		
</body>
</html>