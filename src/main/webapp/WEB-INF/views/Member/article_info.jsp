<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>:::일정리스트:::</h1>
	
		<table border="0" align="center">
			<caption>::: 일정 :::</caption>
			<c:forEach var="vo" items="${list}">
				<tr>
					<th>제목<th>
					<td>${vo.title}</td>
				</tr>
				<tr>
					<th>작성자<th>
					<td>${user.id}</td>
				</tr>
				<tr>
					<th>내용<th>
					<td>${vo.content}</td>
				</tr>
			</c:forEach>
		</table>
	<input type= "button" value="메인으로" onclick="location.href='main.do'">
</body>
</html>