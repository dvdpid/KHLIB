<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/admin/admin.css?ver=4.0"/>" rel='stylesheet' />
<%-- <link href="<c:url value="/resources/css/admin/style.css"/>" rel='stylesheet' /> --%>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="resources/js/admin.js" defer></script>
<style>
	.joinArea{margin-top: 3%;  maring-right: auto; margin-left: auto;}
	th {text-align: center; width: 200px;}
	td {padding: 5px 10px; }
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
	span.guide{display: none; font-size: 12px; top:12px; right: 10px;}
	span.ok{color: green;}
	span.error{color: red;}
	span.guide2{display: none; font-size: 12px; top:12px; right: 10px;}
	span.ok2{color: green;}
	span.error{color: red;}
</style>
</head>
<body>
	<c:import url="../common/admin_header.jsp"/>
	
	<c:set var="now" value="<%= new java.util.Date() %>" />
	<c:set var="nowYear"><fmt:formatDate value="${ now }" pattern="yyyy" /></c:set>
	
		<div class="joinArea" align="center">
			<h1><span  style="color:rgb(212, 129, 91);">KH</span> 도서관</h1>
			<form action="signup.ad" method="post">
				<table id="joinMemberTable">
					<tr>
						<th><label class="must">*</label> 아이디 </th>
						<td width="200px"><input type="text" id="userId" name="id" placeholder="아이디" required style="width: 100%;">
							<span class="guide ok">사용 가능합니다.</span>
							<span class="guide error">사용 불가능합니다.</span>
							<input type="hidden" name="idDUplicateCheck" id="idDUplicateCheck" value="0">
						</td>
					</tr>
						
					<tr>
						<th><label class="must">*</label> 비밀번호 </th>
						<td><input type="password" name="pwd" id="userpwd1" placeholder="비밀번호" required style="width: 100%;"></td>
						<td></td>
					</tr>
					<tr>
						<th><label class="must">*</label> 비밀번호 확인 </th>
						<td>
							<input type="password" name="pwd2" id="userpwd2" placeholder="비밀번호 확인" required style="width: 100%;">
							<font id="chkNotice" size="2"></font>
						</td>
						
					</tr>
					<tr>
						<th><label class="must">*</label> 이름 </th>
						<td><input type="text" name="name" placeholder="이름" required style="width: 100%;"></td>
						<td></td>
					</tr>
					<tr>
						<th><label class="must">*</label> 닉네임 </th>
						<td><input type="text" name="nickname" placeholder="닉네임" required style="width: 100%;"></td>
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
							<input type="text" name="address1" class="postcodify_postcode5" value="" size="6">
							<button type="button" id="postcodify_search_button">검색</button>
						</td>
						
					</tr>
				<tr>
					<th>도로명 주소</th>
					<td><input type="text" name="address2" class="postcodify_address" value="" style="width: 100%;"></td>
					<td></td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td><input type="text" name="address3" class="postcodify_extra_info" value="" style="width: 100%;"></td>
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
						<button onclick="return validate();">가입하기</button>
						<input type="reset" value="취소하기">
						<button type="button" onclick="location.href='home.do'">시작 페이지로 이동</button>
					</td>
				</tr>
				</table>
			</form>
		</div>
			
		<br>
		
		<c:import url="../common/footer.jsp"/>
		<script>
		$('#userId').on('keyup', function() {
			var userId= $(this).val().trim();
			
			if(userId.length < 4){
				$('.guide').hide();
				$('#idDUplicateCheck').val(0);
				
				return;
			}
			
			$.ajax({
				url: 'dupId.ad',
				data: {id:userId},
				success: function(data) {
					if(data == 0){
						$('.guide.error').hide();
						$('.guide.ok').show();
						$('#idDUplicateCheck').val(1);
					} else{
						$('.guide.error').show();
						$('.guide.ok').hide();
						$('#idDUplicateCheck').val(0);
					}
				}
			});
		});
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
</body>
</html>