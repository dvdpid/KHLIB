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
	.joinArea{margin-top: 3%;}
	th {text-align: right;}
	td {padding: 5px 10px;}
	.must {color: red;}
	#joinBtn {
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
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<!-- 올해 년도 설정 -->
	<c:set var="now" value="<%= new java.util.Date() %>" />
	<c:set var="nowYear"><fmt:formatDate value="${ now }" pattern="yyyy" /></c:set>
	
		<div class="joinArea" align="center">
			<h1><span  style="color:rgb(212, 129, 91);">KH</span> 도서관</h1>
			<form aciton="joinMember.me" method="post">
				<table id="joinMemberTable">
					<tr>
						<th><label class="must">*</label> 아이디 </th>
						<td width="200px"><input type="text" name="id" placeholder="아이디" required style="width: 100%;"></td>
						<td width="100px"><label id="idResult"></label></td>
					</tr>
					<tr>
						<th><label class="must">*</label> 비밀번호 </th>
						<td><input type="password" name="pwd1" placeholder="비밀번호" required style="width: 100%;"></td>
						<td></td>
					</tr>
					<tr>
						<th><label class="must">*</label> 비밀번호 확인 </th>
						<td><input type="password" name="pwd2" placeholder="비밀번호 확인" required style="width: 100%;"></td>
						<td><label id="pwdResult"></label></td>
					</tr>
					<tr>
						<th><label class="must">*</label> 이름 </th>
						<td><input type="text" name="name" placeholder="이름" required style="width: 100%;"></td>
						<td></td>
					</tr>
					<tr>
						<th><label class="must">*</label> 닉네임 </th>
						<td><input type="text" name="nickname" placeholder="닉네임" required style="width: 100%;"></td>
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
						<td><input type="text" name="phone" placeholder="(-)를 제외한 숫자만 입력" style="width: 100%;"></td>
					</tr>
					<tr>
						<th><label class="must">*</label> 이메일 </th>
						<td><input type="text" name="email" placeholder="이메일" required style="width: 100%;"></td>
						<td></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>
							<input type="text" name="post" class="postcodify_postcode5" value="" size="6">
							<button type="button" onclick="openZipSearch"id="postcodify_search_button">검색</button>
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
				<script>

				function openZipSearch() {
					new daum.Postcode({
						oncomplete: function(data) {
							$('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
							$('[name=addr1]').val(data.address);
							$('[name=addr2]').val(data.buildingName);
						}
					}).open();
				}
				
				</script>
				<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
				<script src="/resources/js/addressapi.js"></script>
				<tr>
					<td colspan="3" align="center">
						<button id="joinBtn" onclick="validate();">가입하기</button>
						<button type="button" id="homeBtn" onclick="location.href='home.do'">메인메뉴로</button>
						<input type="reset" id="reset" value="취소하기">
					</td>
				</tr>
				</table>
			</form>
		</div>
		
		<br>
		
		<c:import url="../common/footer.jsp"/>
</body>
</html>