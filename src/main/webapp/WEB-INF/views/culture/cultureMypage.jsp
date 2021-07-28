<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화마당 신청내역</title>
<link rel="stylesheet" href="resources/css/cultureMypage.css?ver=1.0" type="text/css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">문화마당</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='culture.cu';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				프로그램
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='cultureMypage.cu';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
				신청 내역
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='cultureInfo.cu';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/clipboard-list-solid.svg"/>
				이용 안내
			</h3>
		</div>
	</div>
	
<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/user-check-solid.svg"/>
			신청 내역</p>
		</div>
		<div class="empty" style="height:140px;"></div>
		<div class="infoSpace">
		<div class="btn" align="right" style="margin-bottom:5px;">
			<button class="cancelBtn" id="cancelBtn">수강 취소</button>
			<button class="cancelBtn" id="deleteBtn">내역 삭제</button>
		</div>
			<table id="mpTable" style="margin-bottom: 50px;">
				<tr>
					<th> </th>
					<th>프로그램 이름</th>
					<th>강연자</th>
					<th>완료 여부</th>
					<th>수강 확정</th>
				</tr>
				
				<c:if test="${ empty loginUser }">
					<tr>
						<td colspan="5" style="font-size:15px;">로그인 후 이용 가능합니다.</td>
					</tr>
				</c:if>
				<c:if test="${ !empty loginUser && empty csList }">
					<tr>
						<td colspan="5" style="font-size:15px;">신청한 프로그램이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ !empty loginUser }">
					<c:forEach var="cs" items="${ csList }">
						<c:forEach var="c" items="${ cList }"> 
								<c:if test="${ (cs.uNo == loginUser.no) && (cs.cNo == c.cNo) }">
									<tr>
										<td>
											<c:if test="${ ((cs.csApproval == 'Y' || cs.csStatus == 'Y') && cs.csApproval != 'N') && c.cDeadLine == 'N' }">
												<input type="radio" id="cancelCheck" name="check" value="${ cs.cNo }">
											</c:if>
											<c:if test="${ c.cDeadLine == 'Y' || cs.csStatus=='N' || ((cs.csApproval == 'Y' || cs.csStatus == 'Y') && cs.csApproval == 'N') }">
												<input type="radio" id="deleteCheck" name="check" value="${ cs.cNo }">
											</c:if>
										</td>
										<td align="center">${ c.cTitle }</td>
										<td align="center">${ c.cInstructor }</td>
										<td align="center">
											<c:if test="${ c.cDeadLine == 'N' }">진행중</c:if>
											<c:if test="${ c.cDeadLine == 'Y' }"><span style="color: red;">완료</span></c:if>
										</td>
										<td align="center">
											<c:if test="${ cs.csApproval == 'W' }">수락 대기</c:if>
											<c:if test="${ cs.csApproval ==  'N' }"><span style="color: red;">수강 취소</span></c:if>
											<c:if test="${ cs.csApproval == 'Y' }"><span style="color: blue;">수락 완료</span></c:if>
										</td>
									</tr>
								</c:if>
						</c:forEach>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
	<input type="hidden" id="uNo" value="${ loginUser.no }">
	<c:import url="../common/footer.jsp"/>
	
	<script type="text/javascript">
		$('#cancelBtn').on('click', function(){
			var bool = confirm('수강을 취소하시겠습니까?');
			if(bool){
				var cNo = $('input:radio[id="cancelCheck"]:checked').val();
				var uNo = $('#uNo').val();
				console.log(cNo);
				 $.ajax({
					url: 'cancel.cu',
					data: {cNo:cNo, uNo:uNo},
					success: function(data){
						alert('정상적으로 수강 취소되었습니다.');
						location.reload(true);
					},
					fail: function(data){
						alert('수강 취소 실패');
					},
					error: function(data){
						alert('수강이 취소되었거나 완료된 프로그램입니다.\n내역 삭제 버튼을 클릭해주세요.');
					}
				});
			} else{
			}
		});
		
		$('#deleteBtn').on('click', function(){
			var bool = confirm('내역을 삭제하시겠습니까?');
			if(bool){
				var cNo = $('input:radio[id="deleteCheck"]:checked').val();
				var uNo = $('#uNo').val();
				console.log(cNo);
				 $.ajax({
					url: 'delete.cu',
					data: {cNo:cNo, uNo:uNo},
					success: function(data){
						alert('정상적으로 내역이 삭제되었습니다.');
						location.reload(true);
						
					},
					fail: function(data){
						alert('내역 삭제 실패');
					},
					error: function(data){
						alert('수강 취소 후 내역 삭제가 가능합니다.');
					}
				});
			} else{
			}
		});
	</script>

</body>
</html>