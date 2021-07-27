<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bkGroupList.css?ver=1.0" type="text/css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">독서 모임</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='bkgroup.bg';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				독서 모임
			</h3>
		</div>
		
		<div class="sideButton" id="side">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/clipboard-list-solid.svg"/>
				신청 내역
			</h3>
		</div>
		<c:if test="${ !empty loginUser }">
		
			<div class="sideButton" onclick="location.href='bkGroupMyWrite.bg'">
				<h3 id="sideButton3">
					<img id="sideImg3" src="resources/images/clipboard-list-solid.svg"/>
					게시글 내역
				</h3>
			</div>
		
			<div class="sideButton" onclick="location.href='bkgroupInsertForm.bg';">
				<h3 id="sideButton2">
					<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
					모임 등록
				</h3>
			</div>
		</c:if>
	</div>
	
	<!-- 검색 부분 -->
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/laptop-solid.svg"/>
			독서 모임</p>
		</div>
		<div id="searchDiv">
			<table id="searchTable">
				<tr>
					<td>
						<select id="bksearch">
						<option value="name">모임명</option>
						<option value="place">장소</option>
						<option value="book">책 제목</option>
					</select>
					</td>
					<td><input type="search" name="bksearchContent" id="bksearchContent" placeholder="입력해주세요"></td>
				</tr>
			</table>
			<button id="bksearchBtn" onclick="searchGroup();">조회</button>
		</div>
	</div>	
	
	<script>
		function searchGroup(){
			var search = $('#bksearch').val();
			var searchContent = $('#bksearchContent').val();
			
			console.log(search);
			console.log(searchContent);
			
			location.href="search.bg?search=" + search + "&searchContent=" + searchContent;
		}
	</script>
	
	<br><br>
	
	<!-- 리스트 부분 -->
	<div id="bkgroupListOuter">
		<c:if test="${ empty gList && empty fList }">
			<div align="center">등록된 프로그램이 없습니다.</div>
		</c:if>
		
		<c:set var="now" value="<%= new java.util.Date() %>" />
		<c:set var="sysDate"><fmt:formatDate value="${ now }" pattern="yyyy-MM-dd" /></c:set>
		
		
		<c:if test="${ !empty gList || !empty fList}">
		<div id="listDiv">
			<c:forEach var="g" items="${ gList }" >
				<div class="bkgroupListDiv" onclick="location.href='${ contextPath }/gDetail.bg?gNo='+ ${ g.gNo } + '&page=' + ${ pi.currentPage }">
					<table class="list" id="listTable">
		          	<c:forEach var="gs" items="${ gsList }">
			           	<c:if test="${ g.gNo eq gs.gNo }">
				           	<tr>
				           		<td colspan="3">
				           			모집인원 현황 : ${ gs.memberCount } / ${ g.gTotal}
				           		</td>
				           	</tr>
			           	</c:if>
		          	</c:forEach>
		            <tr>
		            	<td style="border-right: 1px solid lightgray;" width="60px">모임명</td>
		               <td style="vertical-align: middle;">
						<input id="gNo" type="hidden" value="${ g.gNo }">
		               		<b>&nbsp;${ g.gName }</b> 
		               </td>
		            </tr>
		            <tr>
		               <td colspan="2" height="220px;" align="center">
		               		<c:forEach var="gs" items="${ gsList }">
					           	<c:if test="${ ((g.gNo eq gs.gNo) && (g.gTotal eq gs.memberCount)) || ((g.gNo eq gs.gNo) && g.gDeadline == 'Y') || (g.gNo eq gs.gNo) && (g.gDate < sysDate)}">
				               		<em>마감</em>
					           	</c:if>
				          	</c:forEach>
		               		<c:forEach var="f" items="${ fList }" >
		               			<c:if test="${ g.gNo eq f.gNo }">
							   		<div class="img">
							           	<img class="bkImg" src="${ contextPath }/resources/guploadFiles/${ f.changeName }">
							           	<input type="hidden" value="${ g.gbTitle }">
							     	</div>
						     	</c:if>
					     	</c:forEach>
		               </td>
		            </tr>
		            <tr>
		               <td colspan="3" height="80">
		            			<c:forTokens var="intro" items="${ g.gIntro }" delims="/" varStatus="s">
		            				<c:if test="${ s.index eq 0 }">
		            					${ intro }
		            				</c:if>
		            			</c:forTokens>
		               </td>
		            </tr>
		            <tr>
		               <td colspan="3" height="80">
		                  <c:forTokens var="addr" items="${ g.gPlace }" delims="/" varStatus="status">
						 <c:if test="${ status.index eq 0 }">
							${ addr }
						 </c:if>
						 <c:if test="${ status.index eq 1 }">
							${ addr }
						 </c:if>
						 </c:forTokens> | ${ g.gDate }
		               </td>
		            </tr>
		         </table>
		      </div>
			</c:forEach>
		</div>		
		</c:if>
		
		<table id="boTab">
			<tr>
				<td colspan="6" align="right">
	 				<c:if test="${ !empty loginUser }">
						&nbsp; &nbsp; &nbsp;
						<button id="wirteBtn" onclick="location.href='bkgroupInsertForm.bg';">글쓰기</button>
	 				</c:if>
				</td>
			</tr>
		
		<c:if test="${ !empty gList || !empty fList }">
			
			<tr align="center" height="20">
				<td colspan="6">
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						<div class="pageBtn">&lt;</div>
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="bkgroup.bg">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<div class="pageBtn"><a href="${ before }">&lt;</a></div>
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<div class="currentpageBtn"><b>${ p }</b></div>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="bkgroup.bg">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<div class="pageBtn"><a href="${ pagination }">${ p }</a></div>
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<div class="pageBtn">&gt;</div>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="bkgroup.bg">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<div class="pageBtn"><a href="${ after }">&gt;</a></div>
					</c:if>
					
				</td>
			</tr>
		
			</c:if>		
		</table>
		
		<br><br><br><br>
		
		<input type="hidden" id="currentPage" value="${ pi.currentPage }">
		<input type="hidden" id="loginUser" value="${ loginUser }">
	</div>		
	
	<br><br>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$(function(){
			$('.bkgroupListDiv').mouseover(function(){
				$(this).css({"background":"lightgray", "color":"white", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"none", "color":"black"});
			});
		});
		
		var loginUser = document.getElementById('loginUser').value;
		
		$('#side').on('click', function(){
			if(!loginUser){
				alert('로그인 후 이용 가능합니다.');
				location.href="${contextPath}/loginForm.me";
			} else {
				location.href="${contextPath}/bkgroupMyPage.bg";
			}
		});
		
	</script>
	
	
</body>
</html>