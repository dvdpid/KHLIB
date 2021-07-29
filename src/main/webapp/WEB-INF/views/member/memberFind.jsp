<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 찾기</title>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<style>
	#memberFindDiv{padding-top: 2%;}
	#idFindDiv, #pwdFindDiv, #point {display: inline-block; text-align: center;}
	#findDiv{width: 100%; margin-left: auto; margin-right: auto;text-align: center;}
	#idFindDiv{margin-right: 20px; padding: 10px;}
	#pwdFindDiv{margin-left: 20px; padding: 10px;}
	tr{height: 30px;}
	button{padding: 5px 10px 5px 10px; margin:5px; background: black; color: white; border: 0;  border-radius: 7px;}
	#idFindBtn, #pwdFindBtn{
		font-size: 15px; background: rgb(212, 129, 91); color: white; 
		padding: 5px 10px 5px 10px; margin:5px; width: 92%;
		border: 0;  border-radius: 7px;
		margin-left:27px;
	}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div id="memberFindDiv">
		<h2 align="center"><b style="color:rgb(212, 129, 91); font-size:28px;">KH</b>도서관</h2>
		
		<div id="findDiv">
			<div id="idFindDiv">
				<form action="">
					<h3 align="center" style="margin-left:53px;">아이디 찾기</h3>
					<table id="idFindTable">
						<tr>
							<th width="80">이름</th>
							<td width="200"><input type="text" id="nameID" required style="width: 100%;"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" id="emailID" required style="width: 100%;"></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" id="telID" placeholder="(-)제외한 숫자만 입력해주세요." required style="width: 100%;"></td>
						</tr>
						<tr></tr>
					</table>
					
					<input type="submit" value="아이디 찾기" id="idFindBtn">
				</form>
			</div>
			
			<div id="point" style="height: 27%; width: 1px; background: gray;"></div>
			
			<div id="pwdFindDiv">
				<form action="">
					<h3 style="margin-left:53px;">비밀번호 찾기</h3>
					<table id="pwdFindTable" style="margin-bottom:32px;">
						<tr>
							<th width="80">아이디</th>
							<td width="200"><input type="text" id="id" required style="width: 100%;"></td>
							<td></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" id="name" required style="width: 100%;"></td>
							<td></td>
						</tr>
						<tr >
							<th>이메일</th>
							<td><input type="text" id="email" required style="width: 100%;"></td>
							<td></td>
						</tr>
						<!-- <tr>
							<th>인증번호</th>
							<td><input type="text" required style="width: 100%;"></td>
							<td width="80" align="center"><button>확인</button></td>
						</tr> -->
					</table>
					<input type="submit" value="비밀번호 찾기" id="pwdFindBtn">
				</form>
			</div>
		</div>
	</div>	
	
	<br><br>
	
	<c:import url="../common/footer.jsp"/>
	
	<script type="text/javascript">
		$(function(){
			$('#idFindBtn').click(function(){
				var name = $("#nameID").val();
				var email = $("#emailID").val();
				var tel = $("#telID").val();
				$.ajax({
					url: "findId.me",
					type: "POST",
					data: {name:name, email:email, tel:tel},
					success: function(result){
						if(result == null || result == ""){
							alert("해당하는 아이디가 없습니다.");
						} else{
							alert('귀하의 아이디는 '+result+'입니다.'); // 결과가 controller에는 출력이 되는데 ajax로는 안넘어옴. 왜?
						}
					}, fail: function(result){
						alert('해당하는 아이디가 없습니다.');
					}, error: function(result){
						alert('실패');
					}
				})
			});
			
			$('#pwdFindBtn').click(function(){
				var id = $("#id").val();
				var name = $("#name").val();
				var email = $("#email").val();
				$.ajax({
					url: "findPwd.me",
					type: "POST",
					data: {id:id, name:name, email:email},
					success: function(result){
						alert(result);
					}, error: function(result){
						alert('이메일 발송 실패');
					}
				})
			});
		})
	</script>
</body>
</html>