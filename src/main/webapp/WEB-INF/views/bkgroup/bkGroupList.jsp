<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bkGroupList.css" type="text/css">
</head>
<body>
<!-- list 주석 추가 -->
	<c:import url="../common/menubar.jsp"/>
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">독서 모임</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				독서 모임
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
				독서 모임 등록
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton3">
				<img id="sideImg3" src="resources/images/clipboard-list-solid.svg"/>
				신청 내역
			</h3>
		</div>
	</div>
	
	<!-- 검색 부분 -->
	<div class="gklist">
		<table id="bkgroupSearchTable">
			<tr>
				<td height="50px;">
					<select id="bksearch">
						<option>모임명</option>
						<option>장소</option>
					</select>
				</td>
				<td width="380px">
					<input type="text" name="bksearchContent" id="bksearchContent" placeholder="검색" style="width: 100%;">
				</td>
				<td>
					<button id="bksearchBtn">검색</button>
				</td>
			</tr>
		</table>
	</div>	
	
	<hr style="width: 65%;">
	
	<!-- 리스트 부분 -->
	<div id="bkgroupListOuter">
		<!-- 여기 반복해서 리스트 보여주기 -->
		<div class="bkgroupListDiv">
			<table class="list">
            <tr>
               <td style="vertical-align: bottom;">모임명(AA)</td>
               <td width="167px;" height="220px;">
                  <img class="bkImg" src="resources/images/book1.jpg" >
               </td>
            </tr>
            <tr>
               <td colspan="2"><p>모임설명</p></td>
            </tr>
            <tr>
               <td colspan="2">
                  <strong>장소 | 날짜</strong>
               </td>
            </tr>
         </table>
      </div>
      
      <div class="bkgroupListDiv">
         
         <table class="list">
            <tr>
               <td style="vertical-align: bottom;">모임명(AA)</td>
               <td width="167px;" height="220px;">
               <em>마감</em>
                  <div class="img">
                     <img class="bkImg" src="resources/images/book1.jpg" >
                  </div>
                  
               </td>
            </tr>
            <tr>
               <td colspan="2"><p>모임설명</p></td>
            </tr>
            <tr>
               <td colspan="2">
                  <strong>장소 | 날짜</strong>
               </td>
            </tr>
         </table>
		</div>
		
		
		
	</div>		
	
	
	
	
<!-- 페이징 처리 -->
	<table>
		<tr align="center" height="20" id="buttonTab">
			<td colspan="6">
			
			</td>
		</tr>
	</table>	
	
	<br>
	
	<c:import url="../common/footer.jsp"/>
	
	
</body>
</html>