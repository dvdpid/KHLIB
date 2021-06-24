<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
@charset "UTF-8";

	body{ margin: 0; }
	
	a{ text-decoration: none; }
	
	#header{
		font-weight: bold;
		background-color: rgb(212, 129, 91);
		font-size: 10px;
		color: white;
	}
	
	.wrapper{
		width: 100%;
		min-height: 30px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.logo{
		font-size: 15px;
		font-weight: 900;
		margin-left: 60px;
		color: black;
	}
	
	.lists{ display: flex; margin-right: 60px; }
	
	.lists li{ list-style-type:none; }
	
	.lists li a{
		color: white;
		padding: 10px 20px;
	}
	
	.lists li a:hover{ background: rgb(159, 101, 74); }
	
	#top{
		font-weight: bold;
		border-bottom: 2px solid lightgray;
		font-size: 13px;
	}
	
	#topWrapper{ min-height: 50px; }
	
	.topLists{ display: flex; margin-right: 60px; margin-top: 0; margin-bottom: 0;}
	
	.topLists li{ list-style-type:none;}
	
	.topLists li a{
		display:block;
		color: black;
		padding: 17px 20px;
	}
	
	.topLists li a:hover{
		background: rgba(212, 129, 91, 0.5);
		color:white;
	}
	
	.toggleBtn{
		display:none;
	}
	
	.left{ float: left; width: 25%; }
	
	.sideTitle{
		background: rgb(212, 129, 91);
		color: white;
		align-items: center;
		margin: 30px 30px 15px 30px;
		padding: 30px 30px;
	}
	
	.sideButton{
		background: lightgray;
		color: black;
		text-align: center;
		margin: 15px 30px 15px 30px;
		padding: 10px 25px;
	}
	
	.main{ float: right; width: 75%; text-align: center; }
	
	.mainTitle{
		font-weight: 900;
		border-bottom: 2px solid lightgray;
		font-size: 30px;
		margin: 25px 60px 0px 60px;
		padding: 0px 0px 13px 0px;
	}
	
	.mainTitle p{ text-align: left; width: 70%; margin: 0;}

	#titleImg1{ 
		width: 25px; height: auto; vertical-align:middle;
		padding-bottom: 7px;
		margin-right: 10px;
	}
	
	.infoSpace{ margin: 0px 60px 0px 60px; }
	
	#infoTable{
		border-top: 2px solid lightgray;
		border-bottom: 2px solid lightgray;
		border-left: none;
		border-right: none;
		border-collapse: collapse;
		width: 100%;
		font-size:10px;
	}
	
	td{
		border: 1px solid lightgray;
		border-left: none;
		border-right: none;
		border-collapse: collapse;
		padding: 10px 25px;
	}
	
	.sideButton{
		text-align: left;
		padding-left : 30px;
		cursor: pointer;
	}
	
	.sideButton a{ color: black; }
	
	#infoImg1 { width: 100%; height: auto; }
	
	.sideButton img{
		width: auto; height: 30px; vertical-align:middle;
		padding-bottom: 7px;
		margin-right: 5px;
	}
	
	.sideButton a{
		display:block;
		color: black;
		padding: 17px 20px;
	}
	
	.sideButton:hover{
		background: gray;
	}
	
	
@media screen and (max-width: 1035px){
	#topWrapper{
		align-items: flex-start;
		padding: 8px 24px;
		min-height: 20px;
	}
	
	.topLists{
		display:none;
		flex-direction: column;
		align-items:center;
		width: 100%;
	}
	
	.logo { white-space: nowrap;}
	
	.topLists li, .topLists li a{ text-align:center; width: 100%; margin-right: 150px;}
	
	.toggleBtn{
		display:block;
		position: absolute;
		right: 45px;
		border: none;
		background: none;
		align-items: center;
	}
	
	.topLists.active{ 
		display: flex;
		flex-direction: column;
		align-items:center;
		width: 100%;
		margin: 26px 60px 0px 0px;
	}
	
	.left{ display: none; }
	.main{ width: 100%; }
	
}


/* 페이징 */
.pagination {
  text-align: cente;
  display: inline-block;
  
}

.pagination a {
  text-align: cente;
  color: black;
  float: center;
  padding: 8px 16px;
  text-decoration: none;
}


/*게시판*/
   body{
        line-height:2em;        
}
    ul, li{ 
        list-style:none;
        text-align:center;
        padding:0;
        margin:0;
}

    #mainWrapper{
        width: 200px;
        margin: 0 auto; /*가운데 정렬*/
    }

    #mainWrapper > ul > li:first-child {
        text-align: center;
        font-size:14pt;
        height:40px;
        vertical-align:middle;
        line-height:30px;
}

    #ulTable {margin-top:10px;}
    

    #ulTable > li:first-child > ul > li {
        font-weight:bold;
        text-align:center;
}

    #ulTable > li > ul {
        clear:both;
        padding:0px auto;
        position:relative;
        min-width:40px;
}
    #ulTable > li > ul > li { 
        float:left;
        font-size:10pt;
        border-bottom:1px solid silver;
        vertical-align:baseline;
}    

    #ulTable > li > ul > li:first-child               {width:10%;} /*번호 열 크기*/
    #ulTable > li > ul > li:first-child +li           {width:45%;} /*제목 열 크기*/
    #ulTable > li > ul > li:first-child +li+li        {width:20%;} /*작성자 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li     {width:15%;} /*작성일 열 크기*/


    #divPaging {
          clear:both; 
        margin:0 auto; 
        width:220px; 
        height:50px;
}

    #divPaging > div {
        float:left;
        width: 30px;
        margin:0 auto;
        text-align:center;
}

    #liSearchOption {clear:both;}
    #liSearchOption > div {
        margin:0 auto; 
        margin-top: 30px; 
        width:auto; 
        height:100px;

}

    .left {
        text-align : left;
}

/*검색창*/
.search { padding: 20px 0;border-top:1px solid #ccc; border-bottom: 1px solid #ccc; text-align: center; font-size: 0;}
.search * { margin: 0 5px; height: 53px; border: 1px solid #ccc;}
.search select { width: 148px;}
.search input { width:258px;}
.search button { width:150px; border: none; background: rgb(212, 129, 91); color:#fff;}


</style>

<meta charset="UTF-8">
<title>게시판 리스트</title>
<link rel="stylesheet" href="resources/css/roomInfo.css" type="text/css">
<script src="resources/js/menubar.js" defer></script>
</head>
<body>
<!-- 헤더부분 -->
	<c:import url="../common/menubar.jsp"/>
	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">자유게시판</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
	</div>

<!-- 메인 부분 -->	
	<div class="main">
		<div class="mainTitle">
			<p>자유게시판</p>
		</div>
			<div class="row">
			  <div class="leftcolumn">
			    <div class="card">
			            <!-- 게시판 목록  -->
			                <ul id ="ulTable">
			                    <li>
			                        <ul>
			                            <li>번호</li>
			                            <li>제목</li>
			                            <li>작성자</li>
			                            <li>작성일</li>
			                        </ul>
			                    </li>
			                    <!-- 게시물이 출력될 영역 -->
			                    <li>
			                        <ul>
			                            <li>6</li>
			                            <li class="left">[후기] 문화마당 신청</li>
			                            <li>고양이</li>
			                            <li>2021-06-01</li>
			                        </ul>
			                    </li> 
			                                       
			                     <li>
			                        <ul>
			                            <li>5</li>
			                            <li class="left">[수다] 에어컨 온도</li>
			                            <li>메로나</li>
			                            <li>2021-06-01</li>
			                        </ul>
			                    </li>                   
			                    
			                    <li>
			                        <ul>
			                            <li>4</li>
			                            <li class="left">[후기] 바늘과 가죽의 시 -구병모</li>
			                            <li>메로나</li>
			                            <li>2021-06-01</li>
			                        </ul>
			                    </li>
			
			                    <li>
			                        <ul>
			                            <li>3</li>
			                            <li class="left">[수다] 텀블러 사용</li>
			                            <li>홍차</li>
			                            <li>2021-06-05</li>
			                        </ul>
			                    </li>
			
			                    <li>
			                        <ul>
			                            <li>2</li>
			                            <li class="left">[수다] 우산이 없어요</li>
			                            <li>호랑이</li>
			                            <li>2021-06-11</li>
			                        </ul>
			                    </li>
			
			                    <li>
			                        <ul>
			                            <li>1</li>
			                            <li class="left">[후기] 6월 독서모임</li>
			                            <li>바밤바</li>
			                            <li>2021-06-13</li>
			                        </ul>
			                    <li>                                        
			                </ul>
			         
			
					<!-- 페이징 -->
					<div class="pagination" align="center">
					  <a href="#">&laquo;</a>
					  <a href="#">1</a>
					  <a href="#">2</a>
					  <a href="#">3</a>
					  <a href="#">4</a>
					  <a href="#">5</a>
					  <a href="#">6</a>
					  <a href="#">&raquo;</a>
					</div>
					
				 <div class="search">
				    <select>
				      <option>제목</option>
				      <option>작성자</option>
				      <option>수다</option>
				      <option>후기</option>
				    </select>
				    <input type="search">
				    <button>검색</button>
				</div>
					
			</div>     
	  </div>
	 </div>
  </div>
</body>
</html>