<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>자주하는 질문</title>
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
      <div>
        <span class="mainTitle">자주 하는 질문</span>
      </div>
      <div class="clickme">
        <span class="qHead">Q</span>
        <span class="questionTitle"><b>코로나19 관련 임시휴관 기간 중 도서 대출 방법</b></span>
      </div>
      <div class="answer" style="white-space: pre-wrap; display: none">
     ○ 도서 예약 시간은 어떻게 되나요? ☞ 예약 : 화~토 9:00 ~ 마감시 ※
        선착순이라 조기 마감되오니 이점 참고하시기 바라며 예약 마감후에는 다른
        도서관으로 도서예약하시거나 다음날 9시에 다시 신청해주시기 바랍니다. ※
        예약도서 신청 후 취소 및 변경은 자제 부탁드립니다. 
        ※ ○ 도서 예약 방법을 모르겠습니다 ☞ 도서관 홈페이지 로그인 후 원하는 도서를 검색하신 후, 도서
        정보 하단 ‘도서 예약 신청’ 버튼 클릭 
     ○ 도서 예약 시간인데 예약이 안 됩니다. 
             ☞ 신청자가 많아 제공할 수 있는 예약자 수를 초과한 경우 
         조기  마감될 수 있습니다. 이 경우, 도서관 소식(공지사항)을 통하여 안내드리고
         있으니 이 점 참고 바랍니다. 
     ○ 예약 도서 수령 시간은 어떻게 되나요? 
             ☞     신청하신 날 다음날에 수령 가능하십니다. 
     (단, 토요일 신청분은 화요일 수령/ 당일 수령 불가능) 예약하신 도서가 승인되면 
         배정 시간을 문자메시지로 보내드리니, 꼭 문자메시지를 확인하신 후 방문 부탁드립니다.
         되도록 배정시간에 맞춰 수령해주시길 부탁드립니다. ○ 아직 방문 전인데
         예약한 도서를 이미 대출한 것으로 나옵니다. ☞ 접촉을 최소화하며 도서를
         대출해드리기 위해 예약된 도서를 수령하실 날짜 기준으로 미리 도서관에서
         대출 처리하여, 대출상태의 도서를 바로 회원증 확인 후 수령하시도록 하고
         있습니다. 
     ○ 예약을 했으나 수령하러 가지 못했습니다. ☞ 수령일 당일에
         미수령하신 도서는 모두 예약취소, 대출취소 처리됩니다. 수령 기한 연장은
         불가능하며 수령이 가능하신 날을 고려 후 재신청 부탁드립니다. 원활한
         서비스 제공을 위하여 되도록 예약 후 미수령은 자제 부탁드립니다. ○
         딸림자료(부록)을 대출하고 싶습니다. ☞ 소독의 어려움으로 딸림자료(부록)은
         제공하지 않습니다.(4.1.신청부터) 
     ○ 예약한 도서는 어디서 수령할 수 있나요? ☞ 도서관 지상1층 주차장에 위치한 예약도서 수령처에서 수령
         가능합니다. 
     ○ 대출처리가 이미 되어있는데 수령 안내 문자메시지가 안 와요
            ☞ 간혹 휴대폰 번호가 바뀐 후 회원정보에 등록하지 않으셔서 예전 번호로
        메시지가 가는 경우가 있습니다. 031-324-4121로 전화 부탁드리며, 회원
        정보에 등록된 휴대폰 번호가 현재 사용하는 번호인지 확인 부탁드립니다. ○
        반납은 어떻게 하나요? ☞ 반납은 도서관 정문 좌측에 위치한 무인반납기에서
        가능합니다. 무인반납기는 휴관기간 동안 24시간 운영하며, 상호대차도서는
        타관반납함에 넣어주시기 바랍니다. (유아 및 어린이자료 불가) 직원-이용자
        간 접촉을 최소화하기 위하여 예약도서 수령처에서는 반납을 받지 않습니다.
      </div>
      <div class="clickme">
        <span class="qHead">Q</span><b>보존서고도서 어떻게 이용하나요?</b>
      </div>
      <div class="answer" style="white-space: pre-wrap; display: none">
        ■ 보존서고 자료는? 도서관 자료실 공간 부족으로 이용 빈도가 낮거나
              발행년이 오래된 자료는 보존서고에 보관하고 있으며 자료검색 시 소장처가
        ‘보존서고’인 경우 홈페이지에서 자료신청 후 이용하실 수 있습니다. 
        ■ 신청  및 이용방법 
        ○ 홈페이지 로그인 
        ○ 검색 후 보존서고도서 자료 신청 
        ○ 준비되면 도착 알림 SMS 통보 
        ○ 수신 후 자료실 방문하여 데스크에서
               보존서고 자료 이용 구분 이용방법 이용권수 이용가능시간 대출 대기기간
               비고 도서관별 보존서고 홈페이지 보존서고도서신청 1인 7권 평일4회
        (주말3회) 문자 수신 후 1일 이내 기한내 데스크 대출 (기한 경과시 자동
               취소) 공동서고 홈페이지 보존서고도서 상호대차신청 1인 2권 신청 후
               화.금요일로부터 3일 이내 대출 문자 수신후 3일 이내 기한내 데스크 대출
        (기한 경과시 자동 취소) 
        ■ 이용시간 
        □ 도서관별 보존서고 도서 : 평일 4회,
              주말 3회 지정된 시간부터 1일간 제공 서비스 대상 도서제공시각(평일)
              도서제공시각(주말) 전일 19:00 ~ 10:00 신청자료 11:00 11:00 10:00 ~ 13:00
              신청자료 14:00 14:00 13:00 ~ 16:00 신청자료 17:00 16:00 16:00 ~ 19:00
              신청자료 20:00 - ※ 디지털, 양지해밀, 이동꿈틀, 구갈희망누리도서관은
              보존서고 미운영 ※ 도서관 사정에 따라 도서 제공시간이 다르므로 꼭 해당
              도서관에서 확인해주세요. 
        □ 공동서고 도서 : 화, 금요일 문자 수신 후부터
        	3일간 제공 서비스대상 상호대차 도착일 대출가능일 목요일 18:00 ~ 월요일
        	18:00 신청자료 매주 화요일 오후 화, 수, 목요일 월요일 18:00 ~ 목요일
        	18:00 신청자료 매주 금요일 오후 금, 토, 일요일 
        ■ 신청 내역 확인
              나의도서관 > 보존서고도서 이용내역 > 자관보존서고신청에서 확인 단,
              도서의 처리 상태가 신청 단계인 경우에만 신청취소가 가능하며
              도서관담당자가 도서 처리를 시작한 경우(요청중, 입수)에는 신청취소가
              불가능합니다. 이런 경우 해당도서관 자료실로 문의해주셔야 취소가
              가능합니다. 
        ■ 유의사항 · 1인 신청 가능한 권수는 2권입니다. · 알림 통보
              후 기한 내에 이용하지 않을 경우에는 신청이 취소되며, 2회 누적시 이용이
              제한됩니다. · 보존서고 신청자료는 데스크에서만 대출·반납이 가능합니다.
      </div>
      <div class="clickme">
        <span class="qHead">Q</span> <b>DVD는 어떻게 이용하나요?</b>
      </div>
      <div class="answer" style="white-space: pre-wrap; display: none;">
        KH 도서관은 2019. 9월부터 비도서 관외대출을 시행합니다. 
              대출자격 : KH
              도서관 회원증 소지자 대출권수 및 기간 : 1인 2점, 7일간 (도서대출권수
        7권에 포함) * 예약, 반납연장, 상호대차, 타관반납 불가 대출정지 :
              연체일수 만큼 대출정지 유의사항 대출한 해당 자료실에서 반납 가능 (타
              도서관 자료 반납 불가) 본인 회원증 지참 후 대출 (영상물 등급에 따라 대출
              가능, 제한) DVD 파손 및 분실 시, 동일자료로 변상 대출자료의 상업적 이용
              금지 KH도서관 제1종합자료실에서 빌릴 수 있습니다.
      </div>
      <div class="clickme">
        <span class="qHead">Q</span> <b>도서관무료 와이파이는 어떻게 이용하나요?</b>
      </div>
      <div class="answer" style="white-space: pre-wrap; display: none">
        ① 휴대폰 무선네트워크(Wi-Fi) 설정에서 주변 Wi-Fi신호 검색 ②
        ‘khLib@secure’ SSID(식별ID) 선택 ③ 아이디 ‘khlib' 입력 ④ 비밀번호 ‘kh12'
        입력
      </div>
      <div class="clickme">
        <span class="qHead">Q</span> <b>대출 권수와 대출기간은 어떻게 되나요?</b>
      </div>
      <div class="answer" style="white-space: pre-wrap; display: none">
        - 대 상 : 1인 7권 각 14일간 대출 가능 - 대출기간 : 14일 - 대출권수 : 1인
        7권 - 대출제한도서 : 참고도서, 정기간행물, 비도서는 관외대출 불가
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
