<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 찾기</title>
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
	}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div id="memberFindDiv">
		<h2 align="center">아이디 / 비밀번호 찾기</h2>
		
		<div id="findDiv">
			<div id="idFindDiv">
				<form action="">
					<h3 align="center">아이디 찾기</h3>
					<table id="idFindTable">
						<tr>
							<th width="80">이름</th>
							<td width="200"><input type="text" required style="width: 100%;"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" required style="width: 100%;"></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" placeholder="(-)제외한 숫자만 입력해주세요." required style="width: 100%;"></td>
						</tr>
						<tr></tr>
					</table>
					
					<input type="submit" value="아이디 찾기" id="idFindBtn">
				</form>
			</div>
			
			<div id="point" style="height: 27%; width: 1px; background: gray;"></div>
			
			<div id="pwdFindDiv">
				<form action="">
					<h3>비밀번호 찾기</h3>
					<table id="pwdFindTable">
						<tr>
							<th width="80">아이디</th>
							<td width="200"><input type="text" required style="width: 100%;"></td>
							<td></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" required style="width: 100%;"></td>
							<td></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" required style="width: 100%;"></td>
							<td></td>
						</tr>
						<tr>
							<th>인증번호</th>
							<td><input type="text" required style="width: 100%;"></td>
							<td width="80" align="center"><button>확인</button></td>
						</tr>
					</table>
					<input type="submit" value="비밀번호 찾기" id="pwdFindBtn">
				</form>
			</div>
		</div>
	</div>	
	
	<br><br>
	
	<c:import url="common/footer.jsp"/>
</body>
</html>