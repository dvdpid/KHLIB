<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 회원 </title>
<link href="<c:url value="/resources/css/admin/admin.css?ver=3.0"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/admin/style.css?ver=3.0"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/admin/admin_search.css"/>" rel='stylesheet' />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<script src="resources/js/admin.js" defer></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.ubtn{
		align-content: right;
	}
</style>
</head>
<body>
<!-- 헤더부분 -->
<c:import url="../common/admin_header.jsp"></c:import>
	
	
<!-- 사이드 부분 -->
<c:import url="../common/admin_side.jsp"></c:import>
	
<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/icon1.png"/>
			회원 관리</p>
		</div>
		<div class="empty" style="height:50px;"></div>
		<h3 align="left">회원 목록</h3><br>
		<div class="search-box" style="float:right; margin-right: 75px;">
    	  <input type="text" class="search-txt" id="searchValue" name="" placeholder="아이디 검색">
     		 <a class="search-btn" onclick="searchUser();">
        		<i class="fas fa-search"></i>
    		  </a>
  		</div>
	<script>
		function searchUser(){
			var searchContent = $('#searchValue').val();
			
			console.log(searchContent);
			
			location.href="searchUser.ad?searchContent=" + searchContent;
		}
	</script>
		<div>
			<table class="type1">
				<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>생일</th>
					<th>성별</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>주소</th>
					<th>체크</th>
				</tr>
				</thead>
				<tbody>
				<c:if test="${ empty list }">
					<tr>
						<td colspan="10"> 회원이 없습니다. </td>
					</tr>
				</c:if>
				
				<c:if test="${ not list.isEmpty() }">
				<c:forEach var="u" items="${list }">
				<tr class="list">
					<td>${u.no }</td>
					<td class="subject"><a href="#a">${u.id }</a></td>
					<td><a href="#a">${u.name }</a></td>
					<td>${u.nickname }</td>
					<td>${u.birthday }</td>
					<td>${u.gender }</td>
					<td>${u.phone }</td>
					<td>${u.email }</td>
					<td>${u.address }</td>
					<td><input type="radio" name="userCk" value="${u.no }"></td>
				</tr>
				</c:forEach>
				</c:if>
				<tr align="center" height="20" id="buttonTab">
				<td colspan="10">
				<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="user.ad">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="user.ad">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="user.ad">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a>
					</c:if>
					</td>
				</tr>
				</tbody>
			</table>
			<div class="ubtn">
				<input type="submit" class="btn1" value="회원 삭제" style="float:right; margin-right: 75px;">
			</div>
			<div class="empty" style="height:50px;"></div>
			<div class="empty" style="height:50px;"></div>
		</div>
		<h3 align="left">관리자 목록</h3><br>
		<div class="search-box" style="float:right; margin-right: 75px;">
    	  <input type="text" class="search-txt" id="searchValue2" name="" placeholder="아이디 검색">
     		 <a class="search-btn" onclick="searchAdminUser();">
        		<i class="fas fa-search"></i>
    		  </a>
  		</div>
	<script>
		function searchAdminUser(){
			var searchContent = $('#searchValue2').val();
			
			console.log(searchContent);
			
			location.href="searchAdminUser.ad?searchContent=" + searchContent;
		}
	</script>
		<div>
			<table class="type1">
				<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>생일</th>
					<th>성별</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>주소</th>
					<th>체크</th>
				</tr>
				</thead>
				<tbody>
				<c:if test="${ empty alist }">
					<tr>
						<td colspan="10"> 관리자가 없습니다. </td>
					</tr>
				</c:if>
				
				<c:if test="${ not alist.isEmpty() }">
				<c:forEach var="au" items="${alist }">
				<tr class="list2">
					<td>${au.no }</td>
					<td class="subject"><a href="#a">${au.id }</a></td>
					<td><a href="#a">${au.name }</a></td>
					<td>${au.nickname }</td>
					<td>${au.birthday }</td>
					<td>${au.gender }</td>
					<td>${au.phone }</td>
					<td>${au.email }</td>
					<td>${au.address }</td>
					<td><input type="radio" name="adminCk" value="${ au.no }"></td>
				</tr>
				
				</c:forEach>
				</c:if>
				
				<tr align="center" height="20" id="buttonTab">
				<td colspan="10">
				<!-- [이전] -->
					<c:if test="${ api.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ api.currentPage > 1 }">
						<c:url var="before" value="user.ad">
							<c:param name="page" value="${ api.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ api.startPage }" end="${ api.endPage }">
						<c:if test="${ p eq api.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						
						<c:if test="${ p ne api.currentPage }">
							<c:url var="pagination" value="user.ad">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ api.currentPage >= api.maxPage }">
						[다음]
					</c:if>
					<c:if test="${ api.currentPage < api.maxPage }">
						<c:url var="after" value="user.ad">
							<c:param name="page" value="${ api.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a>
					</c:if>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
		<div class="ubtn">
				<input type="submit" class="btn2" value="관리자 삭제" style="float:right; margin-right: 75px;">
		</div>
	</div>
		<script>
	        $('.btn1').on('click', function () {
	        	var no = $('input:radio[name=userCk]:checked').val();
	        	if(no == undefined){
					alert("체크를 해주세요");    		
	        	} else{
	        		window.open("userDeleteForm.ad?no="+no, 'userSignPage', 'width=800, height=500, top=100, left=300,location=no');
	        	}
			});
        </script>
        <script>
	        $('.btn2').on('click', function () {
	        	var no = $('input:radio[name=adminCk]:checked').val();
	        	
	        	if(no == undefined){
					alert("체크를 해주세요");    		
	        	} else{
	        		window.open("adminDeleteForm.ad?no="+no, 'userSignPage', 'width=800, height=500, top=100, left=300,location=no');
	        	}
			});
        </script>
     <script>
		$(function(){
			$('.list').mouseover(function(){
				$(this).css({"background":"#EEEEEE", "color":"white", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"none", "color":"black"});
			});
		});
	</script>
	 <script>
		$(function(){
			$('.list2').mouseover(function(){
				$(this).css({"background":"#EEEEEE", "color":"white", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"none", "color":"black"});
			});
		});
	</script>
</body>
</html>