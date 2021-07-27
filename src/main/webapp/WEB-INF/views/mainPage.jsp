<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="UTF-8">
<title>홈페이지</title>
<link rel="stylesheet" href="resources/css/common/mainPage.css" type="text/css">
<link rel="stylesheet" href="resources/css/common/lightslider.css" type="text/css">
</head>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="resources/js/lightslider.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- <script type="text/javascript" src="resources/js/lightslider.js"></script> -->
<script>
	$(document).ready(function() {
	    $('#autoWidth').lightSlider({
	        autoWidth:true,
	        loop:true,
	        onSliderLoad: function() {
	            $('#autoWidth').removeClass('cS-hidden');
	        } 
	    });  
	  });
</script>
</head>
<body>
	<c:import url="common/menubar.jsp"></c:import>
	
		<div class="leftArea">
			<div class="searchArea">
				<form id="searchForm" action="bookSearch.bk">
				<select name="searchCondition">
					<option value="title">도서명</option>
					<option value="writer">저자</option>
					<option value="company">출판사</option>
				</select>
				<input type="text" name="searchValue" placeholder="검색할 도서 정보를 입력하세요."><button id="searchBtn">검색</button>
				</form>
			</div>
			
			<div class="noticeArea">
				<div id="noticeTitle"><span>공지사항</span><button id="noticeBtn" onclick="location.href='noticeList.nt';">+ 더보기</button></div>
				<div id="noticeTable"><table id="noticeTableArea" style="table-layout:fixed;"></table></div>
			</div>
			
			<div class="bookArea">
				<div id="bookTitle"><span>이 달의 추천 도서</span><button id="bookBtn" onclick="location.href='recommend.bk';">+ 더보기</button></div>
				<div id="bookList">
					<div class="container"><ul id="autoWidth" class="cS-hidden"></ul></div>
				</div>
			</div>
		</div>
		
		<div class="rightArea">
			<div class="Mainbutton">
				<button id="button1">열람실 현황</button>
				<button id="button2">문화 마당</button>
				<button id="button3">독서 모임</button>
			</div>
			<div class="buttonViewArea">
				<div id="viewArea1">
					<div id="seatView">
						<div id="seatView1" onclick="alert('열람실로 이동합니다.'); location.href='room.ro';"></div>
						<div id="seatView2" onclick="alert('열람실로 이동합니다.'); location.href='room.ro';"></div>
					</div>
				</div>
				<div id="viewArea2" style="display: none;">
					<div id="cultureView"><table id="cultureArea" style=" width: 90%; table-layout:fixed;"></table></div>
				</div>
				<div id="viewArea3" style="display: none;">
					<div id="bkView"><table id="bkArea" style=" width: 90%; table-layout:fixed;"></table></div>
				</div>
			</div>
			<div class="groupArea">
				<c:import url="test.jsp"></c:import>
			</div>
		</div>
		<br><br>
  <c:import url="common/footer.jsp"/>

<script type="text/javascript">

	$(function(){
		
		getNoticeArea();	
		getBookArea();
		
		function getNoticeArea(){
			$.ajax({
				url: 'notice.mp',
				async: false,
				success: function(data){
					$noticeTableArea = $('#noticeTableArea');
					$noticeTableArea.html('');
					
					var $thtr = $('<tr>');
					var $noth = $('<th>').text('No.');
					var $titleth = $('<th>').text('Title');
					var $dateth = $('<th>').text('Date');
					
					$thtr.append($noth);
					$thtr.append($titleth);
					$thtr.append($dateth);
					$noticeTableArea.append($thtr);
					
					for(var key in data){
						var $tr = $('<tr>');
						var txt = '<input type="hidden" id="nNo" value="'+data[key].nNo+'">';
						var $noTd = $('<td>').text(data[key].nNo);
						var $titleTd = $('<td>').text(data[key].nTitle);
						var $dateTd = $('<td>').text(data[key].nDate);
						
						$tr.append(txt);
						$tr.append($noTd);
						$tr.append($titleTd);
						$tr.append($dateTd);
						$noticeTableArea.append($tr);
					}
					
					$('#noticeTableArea td').on({'mouseenter':function(){
						$(this).parent().css({'background':'rgba(224, 224, 224, 0.8)', 'cursor':'pointer'});
					}, 'mouseout':function(){
						$(this).parent().css('background', 'none');
					}, 'click':function(){
						var nNo = $(this).parent().children().eq(0).val();
						location.href='ndetail.nt?nNo=' + nNo + '&page=' + 1; 
					}});
				},
				error: function(data){
					console.log(data);
					alert("notice 에러");
				}
			});
		}
	
		
		function getBookArea(){
			$.ajax({
				url: 'book.mp',
				async: false,
				success: function(data){
					for(var key in data){
						$('#autoWidth').append(
						'<li class="item-a">'
						+ '<div class="box">'
						+ '<input type="hidden" id="bNo" value="'+data[key].bNo+'">'
						+ '<a href="detail.bk?bNo='+data[key].bNo+'">'
						+ '<img id="bookImg" src="resources/bkuploadFiles/'+data[key].renameFileName+'" class="model">'
						+ '</a></div></li>');
					}
				},
				error: function(data){
					console.log(data);
					alert("book 에러");
				}
			});
		}
		
	});
	
	$(document).ready(function(){
		$('#viewArea1').show();
		$('#viewArea2').hide();
		$('#viewArea3').hide();
		$.ajax({
			url: 'room.mp',
			dataType:'json',
			success: function(data){
				var str1 = "";
				var str2 = "";
				$seatView1 = $('#seatView1').html('');
				$seatView2 = $('#seatView2').html('');
				
				for(var i = 0; i < 24; i++){
					if(data[i].rStatus == 'N'){
						str1 += '<div class="empty">'
						+ data[i].rNo + '</div>';
					} else if(data[i].rStatus == 'Y'){
						str1 += '<div class="full">'
						+ data[i].rNo + '</div>';
					}
				}
				$seatView1.append(str1);
				
				for(var i = 24; i < 48; i++){
					if(data[i].rStatus == 'N'){
						str2 += '<div class="empty">'
						+ data[i].rNo + '</div>';
					} else if(data[i].rStatus == 'Y'){
						str2 += '<div class="full">'
						+ data[i].rNo + '</div>';
					}
				}
				$seatView2.append(str2);
			},
			error: function(){
				alert("room 에러");
			}
			
		});
	});

	$('#button1').click(function(){
		$('#viewArea1').show();
		$('#viewArea2').hide();
		$('#viewArea3').hide();
		$.ajax({
			url: 'room.mp',
			dataType:'json',
			success: function(data){
				var str1 = "";
				var str2 = "";
				$seatView1 = $('#seatView1').html('');
				$seatView2 = $('#seatView2').html('');
				
				for(var i = 0; i < 24; i++){
					if(data[i].rStatus == 'N'){
						str1 += '<div class="empty">'
						+ data[i].rNo + '</div>';
					} else if(data[i].rStatus == 'Y'){
						str1 += '<div class="full">'
						+ data[i].rNo + '</div>';
					}
				}
				$seatView1.append(str1);
				
				for(var i = 24; i < 48; i++){
					if(data[i].rStatus == 'N'){
						str2 += '<div class="empty">'
						+ data[i].rNo + '</div>';
					} else if(data[i].rStatus == 'Y'){
						str2 += '<div class="full">'
						+ data[i].rNo + '</div>';
					}
				}
				$seatView2.append(str2);
			},
			error: function(){
				alert("room 에러");
			}
			
		});
	});
	
	$('#button2').click(function(){
		$('#viewArea2').show();
		$('#viewArea1').hide();
		$('#viewArea3').hide();
		
		$.ajax({
			url: 'culture.mp',
			dataType:'json',
			success: function(data){
				$cultureArea = $('#cultureArea');
				$cultureArea.html('');
				
				var $thtr = $('<tr>');
				var $titleth = $('<th>').text('제목');
				var $insth = $('<th>').text('강사');
				var $dateth = $('<th>').text('수강 날짜');
				var $timeth = $('<th>').text('수강 시간');
				
				$thtr.append($titleth);
				$thtr.append($insth);
				$thtr.append($dateth);
				$thtr.append($timeth);
				$cultureArea.append($thtr);
				
				for(var key in data){
					var $tr = $('<tr>');
					var txt = '<input type="hidden" id="cNo" value="'+data[key].cNo+'">';
					var $titleTd = $('<td>').text(data[key].cTitle);
					var $instructorTd = $('<td>').text(data[key].cInstructor);
					var $dateTd = $('<td>').text(data[key].cDate);
					var $timeTd = $('<td>').text(data[key].cTime);
					
					$tr.append(txt);
					$tr.append($titleTd);
					$tr.append($instructorTd);
					$tr.append($dateTd);
					$tr.append($timeTd);
					$cultureArea.append($tr);
				}
				
				$('#cultureArea td').on({'mouseenter':function(){
					$(this).parent().css({'background':'rgba(212, 129, 91, 0.5)', 'cursor':'pointer'});
				}, 'mouseout':function(){
					$(this).parent().css('background', 'none');
				}, 'click':function(){
					var cNo = $(this).parent().children().eq(0).val();
					location.href='cDetail.cu?cNo=' + cNo + '&page=' + 1;
				}});
			}, fail:function(){
				alert("cu 에러");
			}, error: function(){
				alert("cu 에러");
			}
		});
	});
	
	$('#button3').click(function(){
		$('#viewArea3').show();
		$('#viewArea1').hide();
		$('#viewArea2').hide();
		
		$.ajax({
			url: 'bk.mp',
			dataType:'json',
			success: function(data){
				$bkArea = $('#bkArea');
				$bkArea.html('');
				
				var $thtr = $('<tr>');
				var $nameth = $('<th>').text('모임명');
				var $writerth = $('<th>').text('작성자');
				var $dateth = $('<th>').text('모임 날짜');
				var $titleth = $('<th>').text('책 제목');
				
				$thtr.append($nameth);
				$thtr.append($writerth);
				$thtr.append($dateth);
				$thtr.append($titleth);
				$bkArea.append($thtr);
				
				for(var key in data){
					var $tr = $('<tr>');
					var txt = '<input type="hidden" id="gNo" value="'+data[key].gNo+'">';
					var $nameTd = $('<td>').text(data[key].gName);
					var $writerTd = $('<td>').text(data[key].gWriter);
					var $dateTd = $('<td>').text(data[key].gDate);
					var $titleTd = $('<td>').text(data[key].gbTitle);
					
					$tr.append(txt);
					$tr.append($nameTd);
					$tr.append($writerTd);
					$tr.append($dateTd);
					$tr.append($titleTd);
					$bkArea.append($tr);
				}
				
				$('#bkArea td').on({'mouseenter':function(){
					$(this).parent().css({'background':'rgba(212, 129, 91, 0.5)', 'cursor':'pointer'});
				}, 'mouseout':function(){
					$(this).parent().css('background', 'none');
				}, 'click':function(){
					var gNo = $(this).parent().children().eq(0).val();
					location.href='gDetail.bg?gNo=' + gNo + '&page=' + 1;
				}});
			},
			error: function(data){
				console.log(data);
				alert("bk 에러");
			}
		});
	});
	
	
</script>
</body>
</html>