<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>묻고답하기</title>
    <link
      rel="stylesheet"
      href="${contextPath}/resources/css/customerFAQ.css?ver=1.0"
      type="text/css"
    />
    <script src="resources/js/roomInfo.js" defer></script>
    <script
      src="https://code.jquery.com/jquery-3.6.0.js"
      integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
      crossorigin="anonymous"
    ></script>
  </head>
  <style>
    .clickme {
      text-align: left;
      padding: 1em 0em;
    }
    .answer {
      text-align: left;
    }
    .qHead {
      width: 40px;
      height: 40px;
      display: inline-block;
      text-align: center;
      vertical-align: middle;
      color: white;
      border-radius: 50%;
      background-color: rgb(212, 129, 91);
      line-height: 40px;
    }
    
    form {
    	padding: 0px 1em;
    }
    
    table {
    	border: 0px;
    	margin: 0px auto;
    }
    
    td {
    	border: none;
    	text-align: left;
    }
    
    #buttons {
    	text-align: center;
    }
    
    input {
    	margin:0px 0px;
    }
  </style>

  <body>
    <!-- 헤더부분 -->
<c:import url="../common/menubar.jsp"></c:import>

    <!-- 사이드 부분 -->
    <div class="left">
      <div class="sideTitle">
        <h2 id="sideMainTitle">고객센터</h2>
        <h4 id="sideSubTitle" style="color: lightgray">Kh Library</h4>
      </div>
      <div class="sideButton" onclick="location.href='${contextPath}/customer.cm';">
        <h3 id="sideButton1">
          <img id="sideImg1" src="resources/images/laptop-solid.svg" />
          자주하는 질문
        </h3>
      </div>
      <div class="sideButton" onclick="location.href='${contextPath}/qna.cm';">
        <h3 id="sideButton2">
          <img id="sideImg2" src="resources/images/user-check-solid.svg" />
          묻고답하기
        </h3>
      </div>
    </div>    
    <!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p><img id="titleImg1" src="resources/images/user-check-solid.svg"/>질문게시판등록</p>
		</div>
		<br>
		<!-- 게시판 작성 수정 부분 -->
	<div class="board-list">
		<div class="board-upload">
			<div align="center">
				<form action="insertQuestion.cm" method="post">
					<table id="writeTable">
						<tr>
							<th height="40px">제목 </th>
							<td>
								<input type="text" height="40px" size="50" name="qTitle" required></td>  
							<th>작성자</th>
							<td>	
								<input type="hidden" name="bWriter" value="${ loginUser.nickname }">
								${ loginUser.nickname }
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea name="qContent" id="qContent" rows="20" cols="80" required></textarea></td>
						</tr>
						
						<tr>
							<td colspan="4" style="border-top: 1px solid lightgray;"></td>
						</tr>						
						<tr>
							<td colspan="4" style="text-align: center">
								<input type="submit" class="buttons" value="등록 하기"> &nbsp;
								<button class="buttons" onclick="location.href='qna.cm'">목록으로</button>
							</td>
						</tr>
						
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
    <script>
      $(document).ready(function () {
        $(".clickme").each(function (i, el) {
          console.log(el);
          $(this).click(function () {
            $(this)
              .next()
              .slideToggle("slow", function () {
                // Animation complete.
              });
          });
        });
      });
    </script>
  </body>
</html>
