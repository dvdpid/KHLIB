<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#signArea{ width: 450px; text-align: center; margin: 0 auto; margin-top: 3%;}
	#signTable{text-align: center; border: 1px solid lightgray; height: 150px; width: 450px; border-collapse: collapse;}
	#signTable td{padding: 5px; border: 1px solid lightgray; padding: 5px;}
	#signTable th{padding: 5px; border: 1px solid lightgray;}
	#signTable tr{padding: 5px; border: 1px solid lightgray;}
	.btn {
 		font-size: 15px; background: rgb(212, 129, 91); color: white; 
		padding: 5px 10px 5px 10px; margin:5px; width: 80px;
		border: 0;  border-radius: 7px;
 	}
 	footer{ position: fixed; bottom: 0;}
</style>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<br>
	
	<div id="signArea">
		<h2>${ group.gName } 신청</h2>
		<table id="signTable">
			<tr>
				<th>글 번호</th>
				<td> ${ group.gNo }
					<input type="hidden" name="gNo" id="gNo" value="${ group.gNo }">
				</td>
				<th>모임 명</th>
				<td> ${ group.gName } </td>
			</tr>
			
			<tr>
				<th>신청자</th>
				<td>${ loginUser.nickname }
					<input type="hidden" name="uNo" id="uNo" value="${ loginUser.no }">
				</td>
				<th>모임 날짜</th>
				<td>${ group.gDate }</td>
			</tr>
		</table>
		
		<br>
		
		<input type="checkbox" name="yes"> ${ group.gName } 모임을 정말로 신청하시겠습니까?
		
		<br><br>
		
		<button id="yesBtn" class="btn">네</button>
		<button id="noBtn" class="btn">아니오</button>
	</div>
	
	
	<input type="hidden" name="page" id="page" value="${ page }">
	
	<br>
	
	<footer>
	<c:import url="../common/footer.jsp"/>
	</footer>
	
	
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
							if(data == 'success'){
								alert('신청 완료');
								location.href="${contextPath}/bkgroupMyPage.bg";
							} 
						},
						error : function(data){
							console.log(data);
							alert('이미 신청된 모임입니다. 신청 내역에서 삭제한 후 신청 가능합니다');
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