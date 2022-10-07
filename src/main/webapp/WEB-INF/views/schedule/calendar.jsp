<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<!-- jquery datepicker -->
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- jquery datepicker 끝 -->

<meta http-equiv="content-type" content="text/html"; charset="utf-8">
<link href="${path}/resources/css/main.css" rel="stylesheet" type="text/css">
<script src="${path}/resources/js/board.js"></script>
<script type="text/javaScript" language="javascript"></script>
<script src="https://www.lgkids.co.kr/es_all/plugins/jscolor-2.0.5/jscolor.js"></script>
<style TYPE="text/css">	/* calendar 기본 style */
/* 배경색 */
html {
	background-color: #EFEFEF;
}

body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-size: 9pt;
	color: #747474;
}

th {
	font-size: 9pt;
	color: #000000;
}

select {
	font-size: 9pt;
	color: #747474;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

a:link {
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
}

a:visited {
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
}

a:active {
	font-size: 9pt;
	color: red;
	text-decoration: none;
}

a:hover {
	font-size: 9pt;
	color: red;
	text-decoration: none;
}

.day {
	width: 100px;
	height: 30px;
	font-weight: bold;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

.sat {
	color: #0030DB;
}

.sun {
	color: #ED0000;
}

.today_button_div {
	float: right;
}

/* 버튼 */
.buttonstyle {
	border: 1px solid #A0D9E2;
	color: #A0D9E2;
	background-color: white;
	margin-bottom: 7px;
	font-weight: bold;
	border-radius: 5px;
	font-size: 10pt;
}

.buttonstyle:hover {
	box-shadow: 0px 15px 20px rgba(131, 131, 131, 0.4);
	transform: translateY(-5px);
	background-color: #A0D9E2;
	color: white;
}

.buttonstyle:focus {
	background-color: #A0D9E2;
	color: white;
	border: 3px solid #c9c9c9;
}

/* 캘린더 사이즈 */
.calendar {
	width: 80%;
	margin: auto;
}

/* 년/월 */
.navigation {
	margin-top: 30px;
	margin-bottom: 5px;
	text-align: center;
	font-size: 25px;
	vertical-align: middle;
}

/* 캘린더 꾸미기 */
.calendar_body {
	width: 100%;
	background-color: #FFFFFF;
	border: 1px solid #A0D9E2;
	margin-bottom: 50px;
	border-collapse: collapse;
}

/* 캘린더 꾸미기 */
.calendar_body .today {
	border: 1px solid #A0D9E2;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .date {
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.date {
	margin-bottom: 10px;
}

.sat {
	margin-bottom: 10px;
}

.sun {
	margin-bottom: 10px;
}

/* 캘린더 꾸미기 */
.calendar_body .sat_day {
	border: 1px solid #A0D9E2;
	height: 120px;
	background-color: white;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sat_day .sat {
	color: #0030DB;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

/* 캘린더 꾸미기 */
.calendar_body .sun_day {
	border: 1px solid #A0D9E2;
	height: 120px;
	background-color: white;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sun_day .sun {
	color: #ED0000;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

/* 캘린더 꾸미기 */
.calendar_body .normal_day {
	border: 1px solid #A0D9E2;
	height: 120px;
	background-color: white;
	vertical-align: top;
	text-align: left;
}

.before_after_month {
	margin: 10px;
	font-weight: bold;
}

.before_after_year {
	font-weight: bold;
}

.this_month {
	margin: 10px;
}

.schdule_add_button {
	float: right;
}
/*
      *   게시판 이동 모달
      */
#mask_board_move {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

.normal_move_board_modal {
	display: none;
	position: fixed;
	z-index: 10000;
	left: 25% !important;
	top: 15% !important;
	width: 50% !important;
	height: 60% !important;
	border-radius: 12px !important;
	background-color: white !important;
}

.normal_move_board_modal .top {
	background-color: #A0D9E2;
	width: 100%;
	height: 13%;
	border-radius: 12px 12px 0px 0px;
}

.normal_move_board_modal .top .close a {
	float: right;
	cursor: pointer;
	color: white;
	font-size: 25px;
	font-weight: bold;
	padding-top: 5px;
	padding-right: 20px;
}

.normal_move_board_modal .top .subject {
	float: left;
	margin-left: 10px;
	margin-top: 20px;
	font-size: 30px;
	font-weight: bold;
	color: white;
	padding-left: 20px;
}

.normal_move_board_modal .bottom {
	width: 100%;
	height: 15%;
	vertical-align: middle;
}

.normal_move_board_modal .bottom .info {
	padding: 10px 15px 10px 15px;
	text-align: left;
	font-size: 12px;
	color: red;
	margin-left: 50px;
}

.normal_move_board_modal .bottom .contents {
	margin: 20px 50px 20px 50px;
	text-align: center;
}

.normal_move_board_modal .bottom .contents .board_select {
	width: 240px;
	height: 40px;
	font-size: 15px;
}

.normal_move_board_modal ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

.normal_move_board_modal ul li {
	text-align: left;
	padding: 5px;
	height: 30px;
}

.normal_move_board_modal ul li .text_subject {
	width: 10%;
	height: 100%;
	float: left;
	font-size: 18px;
	vertical-align: middle;
	margin-top: 3px;
}

.normal_move_board_modal ul li .text_desc {
	height: 25px;
	width: 90%;
	float: left;
}

.normal_move_board_modal ul li .text_area_desc {
	width: 90%;
	float: left;
}

.normal_move_board_modal ul li .text_type1 {
	height: 100% !important;
	width: 100%;
	border: 1px solid #A0D9E2;
}

.normal_move_board_modal ul li .textarea_type1 {
	width: 100%;
	font-size: 18px;
	border: 1px solid #A0D9E2;
}

.normal_move_board_modal ul .button_li {
	padding-top: 40px;
	width: 100%;
}

.normal_move_board_modal .bottom .contents .board_move_go {
	width: 100% !important;
	height: 40px;
	font-size: 15px;
}

.date_subject {
	margin: 0px;
	margin-bottom: 5px;
	margin-left: 12px;
	font-size: 12px;
	font-weight: bold;
	border: none;
}

.date_subject:hover {
	border: 1px solid #A0D9E2 !important;
	border-radius: 7px;
}

.radio {
	margin-top: 12px;
	border: 1px solid #A0D9E2;
}

.colorbox {
	margin-top: 5px;
	border: 1px solid #A0D9E2;
}

/********************************일정 삭제 관리***************************************/
#mask_board_manage {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

.normal_manage_board_modal {
	display: none;
	position: fixed;
	z-index: 10000;
	left: 25% !important;
	top: 15% !important;
	width: 50% !important;
	height: 60% !important;
	border-radius: 12px !important;
	background-color: white !important;
}

.normal_manage_board_modal .top {
	background-color: #A0D9E2;
	width: 100%;
	height: 13%;
	border-radius: 12px 12px 0px 0px;
}

.normal_manage_board_modal .top .close a {
	float: right;
	cursor: pointer;
	color: white;
	font-size: 25px;
	font-weight: bold;
	padding-top: 5px;
	padding-right: 20px;
}

.normal_manage_board_modal .top .subject {
	float: left;
	margin-left: 10px;
	margin-top: 20px;
	font-size: 30px;
	font-weight: bold;
	color: white;
	padding-left: 20px;
}

.normal_manage_board_modal .bottom {
	width: 100%;
	height: 15%;
	vertical-align: middle;
}

.normal_manage_board_modal .bottom .info {
	padding: 10px 15px 10px 15px;
	text-align: left;
	font-size: 12px;
	color: red;
	margin-left: 50px;
}

.normal_manage_board_modal .bottom .contents {
	margin: 20px 50px 20px 50px;
	text-align: center;
}

.normal_manage_board_modal .bottom .contents .board_select {
	width: 240px;
	height: 40px;
	font-size: 15px;
}

.normal_manage_board_modal ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

.normal_manage_board_modal ul li {
	text-align: left;
	padding: 5px;
	height: 30px;
}

.normal_manage_board_modal ul li .text_subject {
	width: 10%;
	height: 100%;
	float: left;
	font-size: 18px;
	vertical-align: middle;
	margin-top: 3px;
}

.normal_manage_board_modal ul li .text_desc {
	height: 25px;
	width: 90%;
	float: left;
}

.normal_manage_board_modal ul li .text_area_desc {
	width: 90%;
	float: left;
}

.normal_manage_board_modal ul li .text_type1 {
	height: 100% !important;
	width: 100%;
	border: 1px solid #A0D9E2;
}

.normal_manage_board_modal ul li .textarea_type1 {
	width: 100%;
	font-size: 18px;
	border: 1px solid #A0D9E2;
}

.normal_manage_board_modal ul .button_li {
	padding-top: 40px;
	width: 100%;
}

.normal_manage_board_modal .bottom .contents .board_manage_go {
	width: 45% !important;
	height: 40px;
	font-size: 15px;
	margin: 0 auto;
}

.managebutton {
	width: 60%;
	margin: 0 auto;
	display: flex;
}
</style>
<style> /* 자바스크립트 레이어 팝업 */
	/*popup*/
    .popup_layer {position:fixed;top:0;left:0;z-index: 10000; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.4); }
    /*팝업 박스*/
    .popup_box{position: relative;top:50%;left:50%; overflow: auto; height: 600px; width:375px;transform:translate(-50%, -50%);z-index:1002;box-sizing:border-box;background:#fff;box-shadow: 2px 5px 10px 0px rgba(0,0,0,0.35);-webkit-box-shadow: 2px 5px 10px 0px rgba(0,0,0,0.35);-moz-box-shadow: 2px 5px 10px 0px rgba(0,0,0,0.35);}
    /*컨텐츠 영역*/
    .popup_box .popup_cont {padding:50px;line-height:1.4rem;font-size:14px; }
    .popup_box .popup_cont h2 {padding:15px 0;color:#333;margin:0;}
	.popup_box .popup_cont p{ border-top: 1px solid #666;padding-top: 30px;}
    /*버튼영역*/
    .popup_box .popup_btn {display:table;table-layout: fixed;width:100%;height:70px;background:#ECECEC;word-break: break-word;}
    .popup_box .popup_btn a {position: relative; display: table-cell; height:70px;  font-size:17px;text-align:center;vertical-align:middle;text-decoration:none; background:#ECECEC;}
    .popup_box .popup_btn a:before{content:'';display:block;position:absolute;top:26px;right:29px;width:1px;height:21px;background:#fff;-moz-transform: rotate(-45deg); -webkit-transform: rotate(-45deg); -ms-transform: rotate(-45deg); -o-transform: rotate(-45deg); transform: rotate(-45deg);}
    .popup_box .popup_btn a:after{content:'';display:block;position:absolute;top:26px;right:29px;width:1px;height:21px;background:#fff;-moz-transform: rotate(45deg); -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); -o-transform: rotate(45deg); transform: rotate(45deg);}
    .popup_box .popup_btn a.close_day {background:#5d5d5d;}
    .popup_box .popup_btn a.close_day:before, .popup_box .popup_btn a.close_day:after{display:none;}
    /*오버레이 뒷배경*/
    .popup_overlay{position:fixed;top:0px;right:0;left:0;bottom:0;z-index:1001;;background:rgba(0,0,0,0.5);}
    /*popup*/
</style>

<script>	/* 자바스크립트 레이어 팝업 */
	//팝업 띄우기
    function openPop() {
    	document.getElementById("popup_layer").style.display = "block";
    }
    //팝업 닫기
    function closePop() {
    	document.getElementById("popup_layer").style.display = "none";
	}
</script>
<script>
	var idx;
	var num;
	var subject;
	var desc;
	var date;
	var share;
	var mycolor;
</script>
	<script> /* schedule_show */
		function info(f) {
			location.href='schedule_show.do?schedule_idx='+f.schedule_idx.value;
		}
	</script>
	<style> <!-- header -->
		* {margin:0 auto;}
		header {width:100%; height:100px; background-color:white; display:block; margin-bottom:5%; border: 3px #A0D9E2 solid;}
		header #logo{width:3%; height:40%; float:left; margin-top: 1.0%;}
		header #calendar, header #cashbook, header #history, header #logout, header #calendar_list 
		{width:3%; height:40%; float:left; margin-top: 2%;}
		#logo {margin-left:15%; width:3%;}
		#logo img {max-width:100%;}
		#calendar {margin-left: 30%;width:3%;}
		#cashbook, #history, #calendar_list {margin-left:5%;width:3%;}
		#logout {margin-left:10%;width:3%;}
	</style>
</head>
<body>
	<header>
		<div id="logo"><a href="calendar.do?m_id=${user.id}"><img src="${path}/resources/picture/schedule.png"></a></div>
		<div id="calendar"><a href="calendar.do?m_id=${user.id}">Calendar</a></div>
		<div id="calendar_list"><a href="calendar_list.do?m_id=${user.id}">ScheduleList</a></div>
		<div id="cashbook"><a href="list.do?id=${user.id}">CashBook</a></div>
		<div id="history"><a href="history.do?id=${user.id}">History</a></div>
		<div id="logout"><a	href="login_form.do">LogOut</a></div>
	</header>
	
	<form name="calendarFrm" id="calendarFrm" action="schedule_show.do" method="POST">
	
		<input type="hidden" name="year" value="${today_info.search_year}" />
		<input type="hidden" name="month" value="${today_info.search_month-1}" />
		<script>
		 /* 스케줄 등록시 등록완료 팝업창 */
			var message = "${message}";
			console.log(message);
			if (message != "") {
				alert(message);
			}
		</script>
		<div class="calendar">

			<!--날짜 네비게이션  -->
			<div class="navigation">
				<a class="before_after_year"
					href="./calendar.do?m_id=${user.id}&year=${today_info.search_year-1}&month=${today_info.search_month-1}">
					&lt;&lt; <!-- 이전해 -->
				</a>
				<a class="before_after_month"
					href="./calendar.do?m_id=${user.id}&year=${today_info.before_year}&month=${today_info.before_month}">
					&lt; <!-- 이전달 -->
				</a>
				
				 <span class="this_month"> &nbsp;${today_info.search_year}. <c:if
						test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span>
				
				<a class="before_after_month"
					href="./calendar.do?m_id=${user.id}&year=${today_info.after_year}&month=${today_info.after_month}">
					<!-- 다음달 --> &gt;
				</a> 
				<a class="before_after_year"
					href="./calendar.do?m_id=${user.id}&year=${today_info.search_year+1}&month=${today_info.search_month-1}">
					<!-- 다음해 --> &gt;&gt;
				</a>
			</div>
			<div class="today_button_div">
				<button type="button" class="buttonstyle"
					onclick="location.href='calendar.do?m_id=${user.id}'"
					style="height: 30px; width: 80px;">Today</button>
					<!-- onclick="javascript:location.href='/calendar.do'" 이게 안되서 수정 -->
			
				<button type="button"
						onclick="javascript:openPop()"
						class="buttonstyle board_move openMask_board_move pointer"
						style="height: 30px; width: 130px;">Add Schedule</button>
			</div>
			<table class="calendar_body">

				<thead>
					<tr bgcolor="#A0D9E2">
						<td class="day sun">Sun</td>
						<td class="day">Mon</td>
						<td class="day">Tue</td>
						<td class="day">Wed</td>
						<td class="day">Thu</td>
						<td class="day">Fri</td>
						<td class="day sat">Sat</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="dateList" items="${dateList}" varStatus="date_status">
						<input type="hidden" name="id" value="${dateList.id}">
							<c:choose>
								<c:when test="${dateList.value=='today'}">
									<c:if test="${date_status.index%7==0}">
										<tr>
									</c:if>
									<td class="today">
										<div class="date">
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<td class="sat_day">
										<div class="sat">
								</c:when>
								<c:when test="${date_status.index%7==0}">
					</tr>
					<tr>
						<td class="sun_day">
							<div class="sun">
								</c:when>
								<c:otherwise>
									<td class="normal_day">
										<div class="date">
								</c:otherwise>
								</c:choose>
								${dateList.date}
							</div>
							<div>
								<!-- 달력에 일정 띄우고 클릭 시 수정/삭제 창 띄우는 코드 -->
								<c:forEach var="scheduleList" items="${dateList.schedule_data_arr}" varStatus="schedule_data_arr_status">
									<input type="hidden" name= "schedule_idx" value="${scheduleList.schedule_idx}"></input>
									<a	href="schedule_show.do?schedule_idx=${scheduleList.schedule_idx}"
										onclick="window.open(this.href, '_blank', 'width=550,height=600,left=680%, top=200%, toolbars=no,scrollbars=no'); return false; s_function();"
										class="date_subject"
										style="color: ${scheduleList.schedule_mycolor}">${scheduleList.schedule_subject}</a>
									<br>
								</c:forEach>
							</div>
						</td>
						</c:forEach>
				</tbody>
			</table>
	</form>
	<div id="mask_board_move"></div>
	
	<%-- 여기부터 일정추가 영역 --%>
	<div class="normal_move_board_modal popup_layer" id="popup_layer">
		<script>
			$(function() {
				$("#testDatepicker")
					.datepicker({
						dateFormat : "yy-mm-dd",
						changeMonth : true,
						changeYear : true,
						dayNames : [ '월요일', '화요일', '수요일', '목요일',
							 		'금요일', '토요일', '일요일' ],
						dayNamesMin : [ '월', '화', '수', '목', '금',
										'토', '일' ],
						monthNamesShort : [ '1', '2', '3', '4',
											'5', '6', '7', '8', '9', '10',
											'11', '12' ]
					});
			});
			function scheduleAdd() {
				var schedule_add_form = document.schedule_add;
				
				var test = schedule_add_form.schedule_desc.value;	// 데이터 타입 확인
				
				if (schedule_add_form.schedule_date.value == ""
						|| schedule_add_form.schedule_date.value == null) {
					alert("날짜를 입력해주세요.");
					schedule_add_form.schedule_date.focus();
					return false;
				} else if (schedule_add_form.schedule_subject.value == ""
						|| schedule_add_form.schedule_subject.value == null) {
					alert("제목을 입력해주세요.");
					schedule_add_form.schedule_date.focus();
					return false;
				}
				//location.href = "schedule_add.do?m_id=${user.id}";
				schedule_add_form.submit();
			}
		</script>
		<div class="top" style="">
			<div class="close" ><a id="x" href="javascript:closePop();">x</a></div>
			<div class="subject">Add Schedule</div>
		</div>

		<div class="bottom">
			<div class="info" style="text-align:center;">* 순번은 해당 날짜안에서 순서대로 입력이 됩니다.<br>(하루에 최대 4개의 스케줄만
				등록할 수 있습니다.)</div>
			<form name="schedule_add"  method="POST" action="schedule_add.do?m_id=${user.id}">
				<input type="hidden" name="year" value="${today_info.search_year}" />
				<input type="hidden" name="month" value="${today_info.search_month-1}" />
				<input type="hidden" name="id" value="${user.id}" />
				<div class="contents">
					<ul>
						<li>
							<div class="text_subject">순번 :</div>
							<div class="text_desc">
								<input type="text" name="schedule_num" class="text_type1" />
							</div>
						</li>
						<li>
							<div class="text_subject">날짜 :</div>
							<div class="text_desc">
								<input type="text" name="schedule_date" class="text_type1"
									id="testDatepicker" readonly="readonly" />
							</div>
						</li>
						<li>
							<div class="text_subject">제목 :</div>
							<div class="text_desc">
								<input type="text" name="schedule_subject" class="text_type1" />
							</div>
						</li>
						<li style="margin-bottom: 70px;">
							<div class="text_subject">내용 :</div>
							<div class="text_area_desc">
								<textarea name="schedule_desc" class="textarea_type1" rows="5"></textarea>
							</div>
						</li>
						<li>
							<div class="text_subject">공유 :</div> <input class="radio"
							type="radio" name="schedule_share" value="1" checked="checked">공개
							<input type="radio" name="schedule_share" value="2">비공개
						</li>
						<li>
							<div class="text_subject">색상 :</div> <input class="colorbox"
							type='color' name='schedule_mycolor' value='' />
						</li>
						<li class="button_li">
							<button type="button" class="buttonstyle board_move_go pointer"
								onclick="scheduleAdd();">Add</button>
						</li>
					</ul>
				</div>
			</form>
		</div>
	</div>
	<%-- 여기까지 일정추가 영역 --%>
	
</body>
</html>














































