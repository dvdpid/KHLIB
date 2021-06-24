<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>고객센터</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/customerService.css" type="text/css">
    <script src="resources/js/roomInfo.js" defer></script>
</head>

<body>
<c:import url="../common/menubar.jsp"></c:import>

    <!-- 사이드 부분 -->
    <div class="left">
        <div class="sideTitle">
            <h2 id="sideMainTitle">도서게시판</h2>
            <h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
        </div>
        <div class="sideButton" onclick="location.href='';">
            <h3 id="sideButton1">
                <img id="sideImg1" src="resources/images/laptop-solid.svg" />
                도서검색
            </h3>
        </div>
        <div class="sideButton" onclick="location.href='';">
            <h3 id="sideButton2">
                <img id="sideImg2" src="resources/images/user-check-solid.svg" />
                신착도서
            </h3>
        </div>
        <div class="sideButton" onclick="location.href='';">
            <h3 id="sideButton3">
                <img id="sideImg3" src="resources/images/clipboard-list-solid.svg" />
                추천도서
            </h3>
        </div>
    </div>

    <!-- 메인 부분 -->
    <div class="main">
        <div class="wrapper">
            <div class="boardTitle" style="font-weight: bold; font-size: 2rem; text-align:left;">묻고답하기</div>
            <table>
                <thead>
                    <tr>
                        <td class="numberColumn">번호</td>
                        <td class="titleColumn">제목</td>
                        <td class="authorColumn">작성자</td>
                        <td class="dateColumn">작성일</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="numberColumn">30</td>
                        <td class="titleColumn">KH도서관 이름 공모 결과</td>
                        <td class="authorColumn">관리자</td>
                        <td class="dateColumn">2021-05-31</td>
                    </tr>
                    <tr>
                        <td class="numberColumn">29</td>
                        <td class="titleColumn">전자책 문의</td>
                        <td class="authorColumn">MANGO</td>
                        <td>2021-05-30</td>
                    </tr>
                    <tr>
                        <td class="numberColumn">28</td>
                        <td class="titleColumn">방역시간</td>
                        <td class="authorColumn">짱절미</td>
                        <td>2021-05-28</td>
                    </tr>
                    <tr>
                        <td class="numberColumn">27</td>
                        <td class="titleColumn">큐레이션 추천</td>
                        <td class="authorColumn">남나눔</td>
                        <td>2021-05-28</td>
                    </tr>
                    <tr>
                        <td class="numberColumn">26</td>
                        <td class="titleColumn">정회원 문의</td>
                        <td class="authorColumn">강건강</td>
                        <td>2021-05-27</td>
                    </tr>
                    <tr>
                        <td class="numberColumn">25</td>
                        <td class="titleColumn">오픈 시간 문의</td>
                        <td class="authorColumn">담다디</td>
                        <td>2021-05-10</td>
                    </tr>
                    <tr>
                        <td class="numberColumn">24</td>
                        <td class="titleColumn">열람실 기계음 소리</td>
                        <td class="authorColumn">문미미</td>
                        <td>2021-05-01</td>
                    </tr>
                    <tr>
                        <td class="numberColumn">23</td>
                        <td class="titleColumn">도서 반납 문의</td>
                        <td class="authorColumn">박병부</td>
                        <td>2021-04-31</td>
                    </tr>
                    <tr>
                        <td class="numberColumn">22</td>
                        <td class="titleColumn">4월 신착 도서 대출</td>
                        <td class="authorColumn">신수수</td>
                        <td>2021-04-23</td>
                    </tr>
                    <tr>
                        <td class="numberColumn">21</td>
                        <td class="titleColumn">도서관에서 만난 후기 대출 지연</td>
                        <td class="authorColumn">양원영</td>
                        <td>2021-04-19</td>
                    </tr>
                </tbody>
            </table>
            <div id="pagination">
                <div class="arrow pageButton">&lt;</div><div class="pageNumber activeNumber  pageButton">1</div><div class="pageNumber  pageButton">2</div><div class="pageNumber  pageButton">3</div><div class="arrow  pageButton">&gt;</div>		
            </div>
        </div>
    </div>
</body>

</html>