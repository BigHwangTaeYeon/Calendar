<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		html {background-color: #EFEFEF;}
	</style>
	<style> <!-- header -->
		* {margin:0 auto;}
		header {width:100%; height:100px; background-color:white; display:block; margin-bottom:5%; border: 3px #A0D9E2 solid;}
		header #logo{width:3%; height:40%; float:left; margin-top: 1.0%;}
		header #calendar, header #cashbook, header #history, header #logout, header #calendar_list {width:3%; height:40%; float:left; margin-top: 2%;}
		#logo {margin-left:15%; width:3%;}
		#logo img {max-width:100%;}
		#calendar {margin-left: 30%;width:3%;}
		#cashbook, #history, #calendar_list {margin-left:5%;width:3%;}
		#logout {margin-left:10%;width:3%;}
		
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
		
		main {margin:10%; border: 10px #A0D9E2 solid; border-radius: 30px; width:78%; background-color:white;}
		#main {margin:5% 5% 5% 34%; width:30%;}
		
		#main #head {width:500px; text-align:center;}
		
		table, th, td {width:500px; text-align:left; font-family: 'Do Hyeon', sans-serif;}
		td{width:100px; text-align:center !important;  margin-left:0px; border: 1px black solid;}
		th{width:100px; text-align:center; border: 1px black solid;}
	</style>
</head>
<body>
<div>

	<header>
		<div id="logo"><a href="calendar.do?m_id=${user.id}"><img src="${path}/resources/picture/schedule.png"></a></div>
		<div id="calendar"><a href="calendar.do?m_id=${user.id}">Calendar</a></div>
		<div id="calendar_list"><a href="calendar_list.do?m_id=${user.id}">ScheduleList</a></div>
		<div id="cashbook"><a href="list.do?id=${user.id}">CashBook</a></div>
		<div id="history"><a href="history.do?id=${user.id}">History</a></div>
		<div id="logout"><a	href="login_form.do">LogOut</a></div>
	</header>
	
	
	<main>
		<div id="main">
			<div id="head">
				<h1>Schedule list</h1>
			</div>
			<table border="0">
				<tr>
					<th>순서</th>
					<th>제목</th>
					<th>내용</th>
					<th>날짜</th>
				</tr>
				<c:forEach var="dateList" items="${dateList}" varStatus="date_status">
					<input type="hidden" name="schedule_idx" value="${dateList.schedule_idx}">
					<input type="hidden" name="id" value="${dateList.id}">
						<tr>
							<td>${dateList.schedule_num}</td>
							<td>${dateList.schedule_subject}</td>
							<td>${dateList.schedule_desc}</td>
							<td>${dateList.schedule_date}</td>
						</tr>
				</c:forEach>
			</table>
		</div>
	</main>
	
</div>
</body>
</html>