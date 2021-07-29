<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화마당 이용안내</title>
<link rel="stylesheet" href="resources/css/cultureList.css?ver=2.0" type="text/css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<c:import url="../common/menubar.jsp"></c:import>
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
			<p><img id="titleImg1" src="resources/images/laptop-solid.svg"/>
			프로그램</p>
		</div>
		<div id="searchDiv">
			<table id="searchTable">
				<tr>
					<td>
						<select id="searchCondition" name="searchCondition">
							<option value="title">강좌명</option>
							<option value="instructor">강사명</option>
							<option value="place">장소</option>
							<option value="target">교육 대상</option>
						</select>
					</td>
					<td><input type="search" id="searchValue" placeholder="입력해주세요"></td>
				</tr>
			</table>
			<button id="searchBtn" onclick="searchCulture();">조회</button>
		</div>
		<div style="height: 30px;"></div>
		<div class="programList">
			<c:if test="${ empty cList || empty fList }">
				<div id="emptyList">등록된 프로그램이 없습니다.</div>
			</c:if>
			<c:if test="${ !empty cList || !empty fList }">
					<c:forEach var="c" items="${ cList }">
				<div class="thumbList" align="center" onclick="location.href='${ contextPath }/cDetail.cu?cNo=' + ${c.cNo} + '&page=' + ${ pi.currentPage }">
						<fmt:parseDate value="${ c.cStartDate }" var="cSDate" pattern="yyyy-MM-dd'T'HH:mm"/>
						<fmt:parseDate value="${ c.cEndDate }" var="cEDate" pattern="yyyy-MM-dd'T'HH:mm"/>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" var="sd" value="${ cSDate }"/>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" var="ed" value="${ cEDate }"/>
						<fmt:parseDate value="${ c.lDate }" var="clDate" pattern="yyyy-MM-dd'T'HH:mm"/>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" var="ld" value="${ clDate }"/>
						<jsp:useBean id="toDay" class="java.util.Date"/>
						<fmt:formatDate var="now" value="${ toDay }" pattern="yyyy-MM-dd HH:mm:ss"/>
					<div class="cultureListIMG">
						<c:forEach var="cs" items="${ csList }">
							<c:if test="${ ((c.cNo eq cs.cNo) && (c.cTotal eq cs.approvalCount)) || ((c.cNo eq cs.cNo) && c.cDeadLine == 'Y') || (c.cNo eq cs.cNo) && (ed < now && now < ld ) || (c.cNo eq cs.cNo) && (ld < now) }">
                                 <em>마감</em>
                            </c:if>
                        </c:forEach>
						<c:forEach var="f" items="${ fList }">
							<c:if test="${ c.cNo == f.cNo}">
								<img src="${ contextPath }/resources/CultureUploadFiles/${ f.changeName }">
							</c:if>
						</c:forEach>
						<p class="thumbTitle">${ c.cTitle }</p>
							<p class="thumbInfo">
								<span>일시 :</span> ${ ld }<br>
								<span>장소 :</span> ${ c.cPlace }
							</p>					
					</div>
				</div>
					</c:forEach>
			</c:if>
		</div>
		
		<c:if test="${ !empty cList || !empty fList }">
		<!-- 페이징 부분 -->
		<div class="pagingArea" align="center">
			<!-- [이전] -->
			<c:if test="${ pi.currentPage <= 1 }"><div class="pageBtn">&lt;</div></c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url value="${ loc }" var="blistBack"> <!-- loc : 현재 내 주소 -->
            		<c:param name="page" value="${ pi.currentPage - 1 }"/>
            		<c:if test="${ searchValue ne null }">
            			<c:param name="searchCondition" value="${ searchCondition }"/>
            			<c:param name="searchValue" value="${ searchValue }"/>
            		</c:if>
            	</c:url>
            	<div class="pageBtn"><a href="${ blistBack }">&lt;</a></div>
			</c:if>
			
			<!-- 페이지 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<div class="currentpageBtn"><b>${ p }</b></div>
				</c:if>
				
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="blistCheck" value="${ loc }">
            			<c:param name="page" value="${ p }"/>
            			<c:if test="${ searchValue ne null }">
	            			<c:param name="searchCondition" value="${ searchCondition }"/>
	            			<c:param name="searchValue" value="${ searchValue }"/>
	            		</c:if>
            		</c:url>
            		<div class="pageBtn"><a href="${ blistCheck }">${ p }</a></div>
				</c:if>
			</c:forEach>
			
			<!-- [다음] -->
			<c:if test="${ pi.currentPage >= pi.maxPage }"><div class="pageBtn">&gt;</div></c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url value="${ loc }" var="blistNext"> <!-- loc : 현재 내 주소 -->
            		<c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
            		<c:if test="${ searchValue ne null }">
            			<c:param name="searchCondition" value="${ searchCondition }"/>
            			<c:param name="searchValue" value="${ searchValue }"/>
            		</c:if>
            	</c:url>
            	<div class="pageBtn"><a href="${ blistNext }">&gt;</a></div>
			</c:if>
		</div>
	</c:if>
	</div>
	
	<script type="text/javascript">
		function searchCulture(){
			var searchCondition = $("#searchCondition").val();
			var searchValue = $("#searchValue").val();
			
			location.href="search.cu?searchCondition="+searchCondition+"&searchValue="+searchValue;
		}
	</script>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>