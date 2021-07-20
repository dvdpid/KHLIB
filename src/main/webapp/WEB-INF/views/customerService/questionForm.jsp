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
      href="${contextPath}/resources/css/customerFAQ.css"
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
    	margin:0px 5px;
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
      <form action="insertQuestion.cm" method="post">
      	<table>
      		<tr>
      			<td>제목 : </td>
      			<td><input type="text" name="qTitle" /></td>
      		</tr>
      		<tr>
      			<td>내용</td>
      		</tr>
      		<tr>
      			<td colspan="2">
      				<textarea name="qContent" rows="30" cols="80"></textarea>
      			</td>
      		</tr>
      		<tr>
      			<td colspan="2">
      				<div id="buttons">
      				<input type="submit" value="등록"/>&nbsp;<input type="reset" value="초기화" />
      				</div>
      			</td>
      		</tr>
      	</table>
      	
      </form>
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
