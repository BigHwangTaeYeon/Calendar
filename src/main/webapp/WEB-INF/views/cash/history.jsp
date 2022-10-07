<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">

		function del(f) {
			f.submit();
		}
		
		function modify(f) {
			f.submit();
			/* location.href='modity.do?idx='+f.idx.value; */
		}
		
	</script>
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
		#main {margin:5% 5% 5% 30%; width:90%; font-size: 13pt; font-family: 'Do Hyeon', sans-serif;}
		li {list-style: none;}
		
		#total {padding-left:200px; padding-top:50px;}
		.my-header, form {font-size: 11pt;}
		form {display:inline;}
		.button {margin-left:10px; border: 1px #A0D9E2 solid; border-radius: 30px; background: none; text-align: center; }
		
		.space {margin-left:30px;}
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

	<main>
		<div id="main">

	<c:forEach var="vo" items="${ m_list }" varStatus="cnt">
	<c:set var="count" value="${vo.idx}" />
	<fmt:parseDate var="dateFmt" value="${vo.day}" pattern="yyyy-MM"/>
	<fmt:formatDate var="date" pattern="MM" value="${dateFmt}" />
		<c:forEach var="month" begin="1" end="12">
			<c:if test="${date == month}"> 
				<c:if test="${vo.income != null}">
				        <ul>
					       	<li>
					       		<form method="POST" action="modify.do?idx=${vo.idx}&id=${user.id}">
								<script>
									var bottom = "";
									bottom += "수입내역 : <span class='text"+${vo.idx}+" text_content"+${vo.idx}+"'>${vo.content} </span><input type='hidden' name='content' class='change_text"+${vo.idx}+"' value='${vo.content}' />"
									bottom += "<span class='space'>금액 : </span><span class='text"+${vo.idx}+" text_income"+${vo.idx}+"'>${vo.income}</span><input type='hidden' name='income' class='change_text"+${vo.idx}+"' value='${vo.income}' />"
									bottom += "<span class='space'>날짜 : </span><span class='text"+${vo.idx}+" text_day"+${vo.idx}+"'>${vo.day}</span><input type='hidden' name='day' class='change_text"+${vo.idx}+"' value='${vo.day}' /> 입니다."
									
									bottom += "<input class='button' type='button' value='수정' class='change"+${vo.idx}+"' onclick='count(this.form)' />"
									bottom += "<input class='button' type='hidden' value='변경완료' onclick='modify(this.form);' class='change_button"+${vo.idx}+"' />"
									bottom += "<input class='button' type='hidden' value='취소' class='change_cancel"+${vo.idx}+" change_button"+${vo.idx}+"' />"

									document.write(bottom);
								</script>
							    </form>
							    <script>
							    	console.log('aa');
							    	$('.change'+${vo.idx}).click(function(){
							    		console.log('2');
										$('.change_text'+${vo.idx}).attr('type','text');
										$('.change_hidden'+${vo.idx}).attr('type','hidden');
										$('.change_button'+${vo.idx}).attr('type','button');
										$('.text'+${vo.idx}).empty();
							    	});
							    	$('.change_cancel'+${vo.idx}).click(function(){
							    		let temp_content = '${vo.content}'
								    	let temp_income = '${vo.income}'
									    let temp_day = '${vo.day}'
									    
										$('.change_text'+${vo.idx}).attr('type','hidden');
										$('.change_hidden'+${vo.idx}).attr('type','button');
										$('.change_button'+${vo.idx}).attr('type','hidden');
										$('.text_content'+${vo.idx}).append(temp_content);
										$('.text_income'+${vo.idx}).append(temp_income);
										$('.text_day'+${vo.idx}).append(temp_day);
							    	});
								</script>
									
							    <form method="POST" action="delete.do?idx=${vo.idx}&id=${param.id}">
								    <input type="hidden" name="idx" value="${vo.idx}" />
								    <input class='button' type="button" value="삭제" onclick="del(this.form);" />
							    </form>
							</li>
					    </ul>
				</c:if>
			</c:if>
		</c:forEach>
	</c:forEach>
	
	
	
	<c:forEach var="vo" items="${ m_list }">
	<fmt:parseDate var="dateFmt" value="${vo.day}" pattern="yyyy-MM"/>
	<fmt:formatDate var="date" pattern="MM" value="${dateFmt}" />
		<c:forEach var="month" begin="1" end="12">
			<c:if test="${date == month}">
				<c:if test="${vo.income == null}">
			        
				        <ul>
					       	<li>
					       		<form method="POST" action="modify.do?idx=${vo.idx}&id=${param.id}">
								<script>
									var bottom = "";
									bottom += "지출내역 : <span class='text"+${vo.idx}+" text_content"+${vo.idx}+"'>${vo.content}</span><input type='hidden' name='content' class='change_text"+${vo.idx}+"' value='${vo.content}' />"
									bottom += "<span class='space'>금액 : </span><span class='text"+${vo.idx}+" text_expense"+${vo.idx}+"'>${vo.expense}</span><input type='hidden' name='expense' class='change_text"+${vo.idx}+"' value='${vo.expense}' />"
									bottom += "<span class='space'>날짜 : </span><span class='text"+${vo.idx}+" text_day"+${vo.idx}+"'>${vo.day}</span><input type='hidden' name='day' class='change_text"+${vo.idx}+"' value='${vo.day}' /> 입니다."
									
									bottom += "<input type='hidden' name='idx' value='${vo.idx}' />"
									bottom += "<input class='button' type='button' value='수정' class='change"+${vo.idx}+"' onclick='count(this.form)' />"
									bottom += "<input class='button' type='hidden' value='변경완료' onclick='modify(this.form);' class='change_button"+${vo.idx}+"' />"
									bottom += "<input class='button' type='hidden' value='취소' class='change_cancel"+${vo.idx}+" change_button"+${vo.idx}+"' />"

									document.write(bottom);
								</script>
							    </form>
							    <script>
							    	$('.change'+${vo.idx}).click(function(){
										$('.change_text'+${vo.idx}).attr('type','text');
										$('.change_hidden'+${vo.idx}).attr('type','hidden');
										$('.change_button'+${vo.idx}).attr('type','button');
										$('.text'+${vo.idx}).empty();
							    	});
							    	$('.change_cancel'+${vo.idx}).click(function(){
							    		let temp_content = '${vo.content}'
								    	let temp_expense = '${vo.expense}'
									    let temp_day = '${vo.day}'
									    
										$('.change_text'+${vo.idx}).attr('type','hidden');
										$('.change_hidden'+${vo.idx}).attr('type','button');
										$('.change_button'+${vo.idx}).attr('type','hidden');
										$('.text_content'+${vo.idx}).append(temp_content);
										$('.text_expense'+${vo.idx}).append(temp_expense);
										$('.text_day'+${vo.idx}).append(temp_day);
							    	});
								</script>
									
							    <form method="POST" action="delete.do?idx=${vo.idx}&id=${param.id}">
								    <input type="hidden" name="expense" value="${vo.expense}" />
								    <input type="hidden" name="content" value="${vo.content}" />
								    <input type="hidden" name="idx" value="${vo.idx}" />
								    <input class='button' type="button" value="삭제" onclick="del(this.form);" />
							    </form>
							    
						    </li>
					    </ul>
					
				</c:if>
			</c:if>
		</c:forEach>
	</c:forEach>

	

			<c:set var = "total" value = "0" />
			<c:forEach var="result" items="${m_list}" varStatus="status">     
				<c:set var= "total_income" value="${total_income + result.income}"/>
				<c:set var= "total_expense" value="${total_expense + result.expense}"/>
			</c:forEach>
			
			<div id="total">
		        <p class="my-header">총 수입금액: <c:out value="${total_income}"/></p>
		        <p class="my-header">총 지출금액: <c:out value="${total_expense}"/></p>
			</div>
		</div>
	</main>

</body>
</html>