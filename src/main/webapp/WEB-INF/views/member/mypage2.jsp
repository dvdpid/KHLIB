<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 상세설명</title>
<link rel="stylesheet" href="resources/css/roomInfo.css" type="text/css">
<link rel="stylesheet" href="resources/css/mypage.css?ver=1.1" type="text/css">
<link href="<c:url value="/resources/css/admin/admin.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/admin/style.css"/>" rel='stylesheet' />
<script src="resources/js/roomInfo.js" defer></script>
<style>
  	.myTable { table-layout: auto; width: 100%; min-width: 320px; max-width: 100%; overflow: hidden; border: 0; border-collapse: collapse; background-color: #FAFAFA; margin: auto; margin-bottom: 20px; text-align: center; font-size: 0.7em }
  	.wiDe { min-width: 640px; }
  	.nArrow { max-width: 480px }
  	.myTable tr { height: 40px; }
  	.myTable td, th { border: 1px white solid; padding: 8px; }
  	.myTable th { background-color: #ffa775; color: whitesmoke; }
  	.headerOrange th { background-color: #F5F5F5; }
  	.headerGreen th { background-color: #81e281; }
	.headerBlue th { background-color: #7799ff; }
  	.myTable.headerH tr:nth-Child(odd) { background-color: #F0F0F0; }
	.myTable.headerH td, .myTable.headerH th { border-width: 0 1px; }
	.myTable.headerH tr:hover td { border-color: transparent; background-color: #E6E6E6; }
	.myTable.headerH tr:hover td:first-Child { border-left-color: white; }
	.myTable.headerH tr:hover td:last-Child { border-right-color: white; }
	.myTable.headerV { width: 50%; }
	.myTable.headerV td:nth-Child(odd) { background-color: #F0F0F0; }
	.myTable.headerHybrid tr:first-Child th:first-Child { background-color: transparent; } /* 복합 형식 1번 셀 */
	.myTable.headerHybrid td:hover { background-color: #E6E6E6; }
	.myTable caption { margin: 4px 0; }

  	.myTable { table-layout: auto; width: 100%; min-width: 320px; max-width: 100%; overflow: hidden; border: 0; border-collapse: collapse; background-color: #FAFAFA; margin: auto; margin-bottom: 20px; text-align: center; font-size: 0.6em } .wiDe { min-width: 640px; } .nArrow { max-width: 480px } .myTable tr { height: 40px; } .myTable td, th { border: 1px white solid; padding: 8px; } .myTable th { background-color: #ffa775; color: whitesmoke; } .headerOrange th { background-color: #F5F5F5; } .headerGreen th { background-color: #81e281; } .headerBlue th { background-color: #7799ff; } .myTable.headerH tr:nth-Child(odd) { background-color: #F0F0F0; } .myTable.headerH td, .myTable.headerH th { border-width: 0 1px; } .myTable.headerH tr:hover td { border-color: transparent; background-color: #E6E6E6; } .myTable.headerH tr:hover td:first-Child { border-left-color: white; } .myTable.headerH tr:hover td:last-Child { border-right-color: white; } .myTable.headerV { width: 50%; } .myTable.headerV td:nth-Child(odd) { background-color: #F0F0F0; } .myTable.headerHybrid tr:first-Child th:first-Child { background-color: transparent; } /* 복합 형식 1번 셀 */ .myTable.headerHybrid td:hover { background-color: #E6E6E6; } .myTable caption { margin: 4px 0; }
	.detailBtn { background-color: #ffa775; color: whitesmoke; border:none; float:right;}
	#titleImg2{
		width: 20px; height: 20px; vertical-align: top;


	}
	#infoname{
	font-size:14px;
	font-weight: bold;
	width: 30px;
	
	text-align: left;
}
td{
	text-align:center;
}
</style>
</head>
<body>
<!-- 헤더부분 -->

	<c:import url="../common/menubar.jsp"/>


	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">내 정보보기</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='memberCheck.me';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/info/notes.png"/>
				회원정보 수정
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='memberdelete.me';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/info/scissors.png"/>
				회원 탈퇴
			</h3>
		</div>

	</div>
	
<!-- 메인 부분 -->	
	
	
	<div class="centerText">
		<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/info/notes.png"/>
			${ loginUser.id } 님의 정보</p>
		</div>
			<div id="myinfo">
			
			<table id="searchTable" style="margin-left: 50px;">
				<tbody><tr>
					
					<td id="infoname">
					<img id="titleImg2" src="resources/images/info/edit.png"/>아이디</td>
					<td class="userinfot">${ loginUser.id }</td>
				</tr>
				<tr>
					<td id="infoname">
					<img id="titleImg2" src="resources/images/info/edit.png"/>이메일</td>
					<td class="userinfot">${ loginUser.email }</td>
				</tr>
				<tr>
					<td id="infoname">
					<img id="titleImg2" src="resources/images/info/edit.png"/>닉네임</td>
					<td class="userinfot">${ loginUser.nickname }</td>
				</tr>				
			</tbody>
			
			</table>
			<table id="searchTable" style="margin-left: -160px;">
			<tbody>
			<tr>
					<td id="infoname">
					<img id="titleImg2" src="resources/images/info/edit.png"/>성명</td>
					<td class="userinfot">${ loginUser.name }</td>
				</tr>
				<tr>
					<td id="infoname">
					<img id="titleImg2" src="resources/images/info/edit.png"/>휴대전화</td>
					<td class="userinfot">${ loginUser.phone }</td>
				</tr>
				<tr>
					<td id="infoname">
					<img id="titleImg2" src="resources/images/info/edit.png"/>주소</td>
					<td class="userinfot"><c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
						<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
							(${ addr })
						</c:if>
						<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
							${ addr }
						</c:if>
						<c:if test="${ status.index eq 1 }">
							${ addr }
						</c:if>
						<c:if test="${ status.index eq 2 }">
							${ addr }
						</c:if>
					</c:forTokens></td>
				</tr>					
			</tbody>	
				
			</table>
			
					</div>	
				<div>
			<div id="roominfo">
				<p id="infop" ><a href="room.ro"><img id="titleImg1" src="resources/images/info/add.png"/></a>열람실 예약 확인</p><div>
				<table id="myPage_myComment_table" class="myTable headerH">
				<c:if test="${ empty rlist }">
					<tr>
						<td colspan="4" id="nullTd">예약한 열람실이 없습니다..</td>
					</tr>
				</c:if>
				<c:if test="${ not rlist.isEmpty() }">
					<tr> 
						<th>열람실</th>
						<th>예약 좌석</th>
						<th>입실 시간</th>
						<th>퇴실여부</th>
					</tr>
				<c:forEach var="r" items="${rlist }">
				<c:if test="${ empty r.outTime }">
					<tr onclick="location.href='${ contextPath }/roomMypage.ro'">
						<td>${r.rNo }</td>
						<td>제1 열람실</td>
						<td><fmt:formatDate value="${r.inTime }" pattern="yyyy/MM/dd/H:mm"/></td>
						<td>X</td>
					</tr>
				</c:if>
				</c:forEach>
				</c:if>
				</table>
		</div>				
			</div>
			
			
			<div id="boardinfo">
				<p id="infop"><a href="board.bo"><img id="titleImg1" src="resources/images/info/add.png"/></a>내가 작성한 글</p>
				
				<table id="myPage_myComment_table" class="myTable headerH">
				<c:if test="${ empty blist }">
					<tr>
						<td colspan="2" id="nullTd">작성한 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ not blist.isEmpty() }">
					<tr> 
						<th>글 번호</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				<c:forEach var="b" items="${blist }" begin="0" end="2">
					<tr onclick="location.href='${ contextPath }/bDetail.ad?bNo=' + ${b.bNo}">
						<td>${b.bNo }</td>
						<td>${b.bTitle }</td>
						<td>${b.bDate }</td>
					</tr>
				</c:forEach>
				</c:if>
				</table>
					
			</div>
				<div class="empty" style="height:50px;"></div>
			<div id="bookinfo">
				<p id="infop"><a href="bkgroup.bg"><img id="titleImg1" src="resources/images/info/add.png"/></a>독서모임 신청 확인</p>	
				
				<table id="myPage_myComment_table" class="myTable headerH">
				<c:if test="${ empty gsList }">
					<tr>
						<td colspan="4" id="nullTd">신청한 그룹이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ not gsList.isEmpty() }">
					<tr> 
						<th>그룹 번호</th>
						<th>그룹 제목</th>
						<th>책 제목</th>
						<th>그룹 작성자</th>
					</tr>
				<c:forEach var="gs" items="${ gsList }" begin="0" end="2">
					<c:forEach var="g" items="${ gList }">
					<c:if test="${gs.gNo == g.gNo }">
					<tr onclick="location.href='${ contextPath }/gDetail.bg?gNo=' + ${g.gNo}">
						<td>${g.gNo }</td>
						<td>${g.gName }</td>
						<td>${g.gbTitle }</td>
						<td>${g.gWriter }</td>
					</tr>
					</c:if>
					</c:forEach>
				</c:forEach>
				</c:if>
				</table>
			</div>
			
			<div id="cultureinfo">
				<p id="infop"><a href="culture.cu"><img id="titleImg1" src="resources/images/info/add.png"/></a>문화마당 신청 확인</p>
				<table id="myPage_myComment_table" class="myTable headerH">
				<c:if test="${ empty csList }">
					<tr>
						<td colspan="4" id="nullTd">신청한 문화가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ not csList.isEmpty() }">
					<tr> 
						<th>문화 번호</th>
						<th>문화 제목</th>
						<th>강사 명</th>
						<th>대상</th>
					</tr>
				<c:forEach var="cs" items="${ csList }" begin="0" end="2">
					<c:forEach var="c" items="${ cList }">
					<c:if test="${cs.cNo == c.cNo }">
					<tr onclick="location.href='${ contextPath }/cDetail.cu?cNo=' + ${c.cNo}">
						<td>${c.cNo }</td>
						<td>${c.cTitle }</td>
						<td>${c.cInstructor }</td>
						<td>${c.cTarget }</td>
					</tr>
					</c:if>
					</c:forEach>
				</c:forEach>
				</c:if>
				</table>
					
			</div>
			</div>
				</div>
			</div>	
			
			
	<c:import url="../common/footer.jsp"/>
</body>
</html>