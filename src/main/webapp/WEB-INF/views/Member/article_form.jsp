<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
	function send(f){
	/* 	f.action="Article.do?id="+${user.id};
		f.method="post"; */
		f.submit();
	}
</script>
</head>
<body>
	<form method="POST" action="Article.do?id=${user.id}">
		<input type="hidden" name="f_time" value="${f_time}">
		<table border="1" align="center">
			<caption>:::새 일정 쓰기:::</caption>
			<tr>
				<th>제목<th>
				<td><input name ="title"></td>
			</tr>
			<tr>
				<th>작성자<th>
				<td>${user.id}</td>
			</tr>
			<tr>
				<th>내용<th>
				<td><textarea name ="content" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type= "button" value="일정등록하기" onclick="send(this.form);">
				<input type= "button" value="메인으로" onclick="location.href='main.do'">
			</tr>
		</table>
	</form>
</body>
</html>