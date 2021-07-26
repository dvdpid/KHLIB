<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화마당 프로그램 상세정보</title>
<link rel="stylesheet" href="resources/css/cultureDetail.css?ver=2.0" type="text/css">
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
		<div class="programInfoTable">
			<div id="title">${ culture.cTitle }</div>
			<div class="titleSub">일시 : 
				<fmt:parseDate value="${ culture.lDate }" var="cLDate" pattern="yyyy-MM-dd'T'HH:mm"/>
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm" var="ld" value="${ cLDate }"/>${ ld }
			</div>
			<div class="titleSub">장소 : ${ culture.cPlace }</div>
			<table id="programDetailTable">
				<tr>
					<td>접수 기간</td>
					<td>
						<fmt:parseDate value="${ culture.cStartDate }" var="cSDate" pattern="yyyy-MM-dd'T'HH:mm"/>
						<fmt:parseDate value="${ culture.cEndDate }" var="cEDate" pattern="yyyy-MM-dd'T'HH:mm"/>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" var="sd"  value="${ cSDate }"/> ${ sd }
						 ~ <fmt:formatDate pattern="yyyy-MM-dd HH:mm" var="ed"  value="${ cEDate }"/> ${ ed }
					</td>
				</tr>
				<tr>
					<td>강연자</td>
					<td>
						${ culture.cInstructor }
					</td>
				</tr>
				<tr>
					<td>강의 시간</td>
					<td>
						${ culture.lTime }
					</td>
				</tr>
				<tr>
					<td>교육 대상</td>
					<td>
						${ culture.cTarget }
					</td>
				</tr>
				<tr>
					<td>신청/정원</td>
					<td>
						${ approvalCount }/${ culture.cTotal }
					</td>
				</tr>
				<tr>
					<td>마감 여부</td>
					<td>
						<jsp:useBean id="toDay" class="java.util.Date"/>
						<fmt:formatDate var="now" value="${ toDay }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<c:if test="${ toDay < cLDate && toDay < cSDate && culture.cDeadLine == 'N' && toDay < cEDate  }">진행 전</c:if>
						<c:if test="${ (toDay < cLDate && cSDate < toDay && toDay < cEDate && culture.cDeadLine == 'N' && (approvalCount != culture.cTotal)) || (cSDate < toDay && culture.cDeadLine == 'N' && toDay < cEDate && (approvalCount != culture.cTotal)) }">진행 중</c:if>
						<c:if test="${ cLDate < toDay || cEDate < toDay || culture.cDeadLine == 'Y' || approvalCount == culture.cTotal || (toDay < cEDate && culture.cDeadLine == 'Y') }">마감</c:if>
					</td>
				</tr>
				<tr>
					<td>첨부 파일</td>
					<td>
						<c:if test="${ files[0].fileLevel == 0 }">  
							<a href="${ contextPath }/resources/CultureUploadFiles/${ files[1].changeName }" download="${ files[1].originName }">
								${ files[1].originName }
							</a>
						</c:if>
						<c:if test="${ files[0].fileLevel == 2 }">
							<a href="${ contextPath }/resources/CultureUploadFiles/${ files[0].changeName }" download="${ files[0].originName }">
								${ files[0].originName }
							</a>
						</c:if>
					</td>
				</tr>
			</table>
			<button id="signBtn">프로그램 신청</button>
			<button id="listBtn" onclick="location.href='${contextPath}/culture.cu?page='+${page}">목록으로</button>
			
			
			<c:url var="signList" value="csMemberList.cu">
				<c:param name="cNo" value="${ culture.cNo }"/>
				<c:param name="approvalCount" value="${ approvalCount }" />
			</c:url>
			
			<!-- 관리자만 리스트 조회 가능 -->
			<c:if test="${ sessionScope.loginUser.admin == 'Y' }">
				<button class="btn" id="signBtn" onclick="location.href='${signList}'">신청자 리스트</button>
			</c:if>
			
			
		</div>
		<div class="programImageTable">
		 	<c:if test="${ files[0].fileLevel == 0 }">  
				<img id="cultureImg" src="${ contextPath }/resources/CultureUploadFiles/${ files[0].changeName }">
			</c:if>
			<c:if test="${ files[0].fileLevel == 2 }">
				<img id="cultureImg" src="${ contextPath }/resources/CultureUploadFiles/${ files[1].changeName }">
			</c:if>
			<div id="programEx">프로그램 설명</div>
			<div id="programExDetail">
				${ culture.cContent }
			</div>
		</div>
	</div>
	<input type="hidden" id="CNO" name="CNO" value="${ culture.cNo }">
	<input type="hidden" id="cDeadLine" name="cDeadLine" value="${ culture.cDeadLine }">
	<input type="hidden" id="uNo" name="uNo" value="${ loginUser.no }">
	<input type="hidden" id="cTotal" name="cTotal" value="${ culture.cTotal }">
	<input type="hidden" id="sd" name="sd" value="${ sd }">
	<input type="hidden" id="ed" name="ed" value="${ ed }">
	<input type="hidden" id="ld" name="ld" value="${ ld }">
	<input type="hidden" id="now" name="now" value="${ now }">
	<input type="hidden" id="approvalCount" name="approvalCount" value="${ approvalCount }">

	<c:forEach var="cs" items="${ csList }">
		<input type="hidden" id="csListcNo" name="csListcNo" value="${ cs.cNo }">
	 	<input type="hidden" id="csListuNo" name="csListuNo" value="${ cs.uNo }">
		<input type="hidden" id="csListStatus" name="csListStatus" value="${ cs.csStatus }">
	</c:forEach>
	
	<c:import url="../common/footer.jsp"/>
	<c:if test="${ empty loginUser }">
		<script type="text/javascript">
		$('#signBtn').click(function(){
			alert("로그인 후 수강 신청이 가능합니다.");
			document.location.href="loginForm.me";
		});
		</script>
	</c:if>
	<c:if test="${ !empty loginUser }">
		<script type="text/javascript">
		
		$('#signBtn').click(function(){
			var csListcNo = $('#csListcNo').val();
			var cNo = $('#CNO').val();
			var csListuNo = $('#csListuNo').val();
			var uNo = $('#uNo').val();
			var csListStatus = $('#csListStatus').val();
			var cTotal = $('#cTotal').val();
			var approvalCount = $('#approvalCount').val();
			var cDeadLine = $('#cDeadLine').val();
			var sd = $('#sd').val();
			var ed = $('#ed').val();
			var ld = $('#ld').val();
			var now = $('#now').val(); 
			console.log(now);
			
			if(csListcNo == cNo && csListuNo == uNo && csListStatus=='Y'){
				alert('중복 신청은 불가능합니다.');
			} else if( (now < ld && ed < now) || cDeadLine == 'Y' || approvalCount == cTotal || (now < ed && cDeadLine=='Y')){
				alert('마감된 프로그램은 신청이 불가능합니다.');
			} else if((now < ld && now < sd) && (cDeadLine =='N' && now < ld)){
				alert('프로그램 신청 기간이 아닙니다.');
			} else{
				window.open('cSign.cu?cNo='+cNo, 'programSignPage', 'width=800, height=500, top=100, left=300,location=no');
			}
		});
		</script>
	</c:if>
</body>
</html>