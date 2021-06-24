<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 현황</title>
<link rel="stylesheet" href="resources/css/roomMain.css" type="text/css">
</head>
<body>
	<c:import url="../common/menubar.jsp"></c:import>
	
<!-- 사이드 부분 -->
	<div class="left">
		<div class="sideTitle">
			<h2 id="sideMainTitle">열람실</h2>
			<h4 id="sideSubTitle" style="color:lightgray;">Kh Library</h4>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton1">
				<img id="sideImg1" src="resources/images/laptop-solid.svg"/>
				열람실 현황
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='';">
			<h3 id="sideButton2">
				<img id="sideImg2" src="resources/images/user-check-solid.svg"/>
				내 자리
			</h3>
		</div>
		<div class="sideButton" onclick="location.href='';">
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
			열람실 현황</p>
		</div>
		<div class="level">
			<div id="level1">제 1 열람실</div>
			<div class="seat">
				<div id="seat1">
					<div id="fullSeat"></div>
					<p>사용중</p>
				</div>
				<div id="seat2">
					<div id="emptySeat"></div>
					<p>사용 가능</p>
				</div>
			</div>
		</div>
		<div id="outstanding">잔여석(13/48)</div>
		<div id="seatView">
			<table id="seatView1">
				<tr>
					<td id="full">1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
				</tr>
				<tr>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td id="full">8</td>
				</tr>
				<tr>
					<td>9</td>
					<td id="full">10</td>
					<td>11</td>
					<td>12</td>
				</tr>
				<tr>
					<td>13</td>
					<td>14</td>
					<td>15</td>
					<td>16</td>
				</tr>
				<tr>
					<td>17</td>
					<td>18</td>
					<td id="full">19</td>
					<td>20</td>
				</tr>
				<tr>
					<td>21</td>
					<td>22</td>
					<td>23</td>
					<td>24</td>
				</tr>
			</table>
			<table id="seatView2">
				<tr>
					<td>25</td>
					<td id="full">26</td>
					<td>27</td>
					<td id="full">28</td>
				</tr>
				<tr>
					<td id="full">29</td>
					<td>30</td>
					<td>31</td>
					<td>32</td>
				</tr>
				<tr>
					<td>33</td>
					<td>34</td>
					<td id="full">35</td>
					<td>36</td>
				</tr>
				<tr>
					<td id="full">37</td>
					<td>38</td>
					<td>39</td>
					<td>40</td>
				</tr>
				<tr>
					<td>41</td>
					<td>42</td>
					<td id="full">43</td>
					<td id="full">44</td>
				</tr>
				<tr>
					<td id="full">45</td>
					<td id="full">46</td>
					<td>47</td>
					<td>48</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>