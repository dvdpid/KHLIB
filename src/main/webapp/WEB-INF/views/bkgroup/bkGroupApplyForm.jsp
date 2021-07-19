<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#signArea{margin-right: auto; margin-left: auto; width: 450px; text-align: center;}
	#signTable{text-align: center; border: 1px solid lightgray; height: 200px; width: 450px;}
	#signTable td{border: 1px solid lightgray;}
</style>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<br>

	
	<div id="signArea">
		<table id="signTable">
			<tr>
				<td>글 번호</td>
				<td> ${ group.gNo }
					<input type="hidden" name="gNo" id="gNo" value="${ group.gNo }">
				</td>
				
			</tr>
			<tr>
				<td>모임 명</td>
				<td> ${ group.gName } </td>
			</tr>
			<tr>
				<td>신청자</td>
				<td>${ loginUser.nickname }
					<input type="hidden" name="uNo" id="uNo" value="${ loginUser.no }">
				</td>
				<td>모임 날짜</td>
				<td>${ group.gDate }</td>
			</tr>
		</table>
		
		<br>
		
		<input type="checkbox" name="yes"> ${ group.gName } 모임을 정말로 신청하시겠습니까?
		
		<br><br>
		
		<button id="yesBtn">네</button>
		<button id="noBtn">아니오</button>
	</div>
	
	
	<input type="hidden" name="page" id="page" value="${ page }">
	
	<br>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		var yes = $('input:checkbox[name="yes"]');
		var uNo = $('#uNo').val();
		var gNo = $('#gNo').val();
		var page = $('#page').val();
		
		$(function(){
			$('#yesBtn').on('click', function(){
				
				if(yes.prop("checked") == true){
					$.ajax({
						url: 'realApply.bg',
						data: {uNo : uNo, gNo : gNo},
						success : function(data){
							console.log(data);
							if( data == 'success' ){
								alert('신청 완료');
								location.href="${contextPath}/bkgroupMyPage.bg";
							} 
						}
					});
					
					
				} else {
					alert('신청 여부를 체크해주세요.');
				}
			});
			
			$('#noBtn').on('click', function(){
				alert('신청을 취소하셨습니다.');
				location.href="${contextPath}/gDetail.bg?gNo=" + gNo + "&page=" + page;
			});
			
		});
	</script>

</body>
</html>