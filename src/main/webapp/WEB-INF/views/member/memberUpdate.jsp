<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/mypageUpdate.css" type="text/css">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script> 

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
		border: 0; border-radius: 7px; width: 120px;
	}
	#nickCheck{
		background: rgb(212, 129, 91); color: white; padding: 5px; margin:5px;
		border: 0; border-radius: 7px; font-size: 12px;
	}
	span.guide{display: none; font-size: 12px; top:12px; right: 10px; margin: 9px 0 -2px;}
	span.ok{color: green;}
	span.error{color: red;}
	span.guide2{display: none; font-size: 12px; top:12px; right: 10px; margin: 9px 0 -2px;}
	span.ok2{color: green;}
	span.error2{color: red;}
	#joinMemberTable {
    margin-left:120px;
}
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
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<!-- 올해 년도 설정 -->
	<c:set var="now" value="<%= new java.util.Date() %>" />
	<c:set var="nowYear"><fmt:formatDate value="${ now }" pattern="yyyy" /></c:set>
	
		<div class="joinArea" align="center">
			<h1><span  style="color:rgb(212, 129, 91);">KH</span> 도서관</h1>
			<form action="mupdate.me" method="post">
			<input type="hidden" name="id" value="${ loginUser.id }">
				<table id="joinMemberTable">				
					<tr>
						<th><label class="must">*</label> 아이디 </th>
						<td width="200px">${ loginUser.id }</td>
						
					</tr>
			
					<tr>
						<th><label class="must">*</label> 비밀번호 </th>
						<td><input type="password" name="pwd" id="userpwd1" placeholder="변경 할 비밀번호" required style="width: 100%;"></td>
						
					</tr>
					<tr>
						<th><label class="must">*</label> 비밀번호 확인 </th>
						<td><input type="password" name="pwd2" id="userpwd2" placeholder="비밀번호 확인" required style="width: 100%;"></td>
						<td width="200px" style="vertical-align: middle;margin-top:5px;">
							<span style="height:10px;margin: 9px 0 -2px;"><font id="chkNotice" size="2"></font></span>
						</td>
						
					</tr>
					<tr>
						<th><label class="must">*</label> 이름 </th>
						<td><input type="text" name="name" value="${loginUser.name}" placeholder="이름" required style="width: 100%;"></td>
						<td></td>
					</tr>
					
					<tr>
						<th><label class="must">*</label> 닉네임 </th>
						<td><input type="text" id="nickname" name="nickname" placeholder="닉네임" value="${loginUser.nickname}" required style="width: 100%;">
							<span class="guide ok2">사용 가능합니다.</span>
							<span class="guide error2">사용 불가능합니다.</span>
							<input type="hidden" name="nicknameDUplicateCheck" id="nicknameDUplicateCheck" value="0">		
						</td>
					</tr>
					
					<tr>
						<th>생일</th>
						<td>
							<select name="year">
								<c:forEach var="i" begin="1990" end="${ nowYear }" step="1">
									<option value="${ nowYear - i + 1990 }"<c:if test="${year eq nowYear - i + 1990 }"> selected="selected" </c:if>>${ nowYear - i + 1990 }</option>
								</c:forEach>
							</select>년
							<select name="month">
								<c:forEach var="j" begin="1" end="12" step="1">
									<option value="${ j }" <c:if test="${month eq j }"> selected="selected" </c:if>>${j }</option>
								</c:forEach>
							</select>월
							<select name="day">
								<c:forEach var="k" begin="1" end="31" step="1">
									<option value="${ k }"<c:if test="${day eq k }"> selected="selected" </c:if>>${ k }</option>
								</c:forEach>
							</select>일
						</td>
						<td></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
						<c:if test="${loginUser.gender == 'M' }">
							<input type="radio" name="gender"  value="M" checked="checked">남자
							<input type="radio" name="gender" value="W">여자
						</c:if>
						
							<c:if test="${loginUser.gender == 'W' }">
							<input type="radio" name="gender"  value="M" >남자
							<input type="radio" name="gender" value="W" checked="checked">여자
						</c:if>
						</td>
						<td></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" name="phone" value="${loginUser.phone}" placeholder="(-)를 제외한 숫자만 입력" style="width: 100%;"></td>
					</tr>
					<tr>
						<th><label class="must">*</label> 이메일 </th>
						<td><input type="text" name="email" value="${loginUser.email}" placeholder="이메일" required style="width: 100%;"></td>
						<td></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>
							<input type="text" name="address1" class="postcodify_postcode5" value="${address1}"   size="6">
							<button type="button" id="postcodify_search_button">검색</button>
						</td>
						
					</tr>
				<tr>
					<th>도로명 주소</th>
					<td><input type="text" name="address2" class="postcodify_address" value="${address2}" style="width: 100%;"></td>
					<td></td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td><input type="text" name="address3" class="postcodify_extra_info" value="${address3}" style="width: 100%;"></td>
					<td></td>
				</tr>
				<!-- jQuery와 Postcodify를 로딩한다. -->
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
					$(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					});
				</script>
				<tr>
					<td colspan="2" align="center">
						<button id="updateBtn" onclick="return validate();">가입하기</button>
						<input  id="reset" type="reset" value="취소하기">
						<button id="homeBtn" type="button" onclick="location.href='home.do'">메인 페이지 </button>
					</td>
				</tr>
				</table>
			</form>
		</div>
			
		<br>
		
		<c:import url="../common/footer.jsp"/>
		<script>
		$(function(){
		    $('#userpwd1').keyup(function(){
		      $('#chkNotice').html('');
		    });
		
		    $('#userpwd2').keyup(function(){
		
		        if($('#userpwd1').val() != $('#userpwd2').val()){
		          $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
		          $('#chkNotice').attr('color', '#f82a2aa3');
		        } else{
		          $('#chkNotice').html('비밀번호 일치함<br><br>');
		          $('#chkNotice').attr('color', '#199894b3');
		        }
		
		    });
		});


</script>
</html>