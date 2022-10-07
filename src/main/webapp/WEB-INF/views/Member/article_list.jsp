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
<script type="text/javascript">

	function info(f) {
		location.href='article_info.do?idx='+f.idx.value;
	}
	
</script>
</head>
<body>
<div>

	<h1>:::일정리스트:::</h1>
	<c:forEach var="vo" items="${list}">
		<form>
			<input type="hidden" name="idx" value="${vo.idx}">
			<div>${vo.idx}</div>
			<div>${vo.id}</div>
			<div>제목 : <input type="button" name="${vo.title}" onclick="info(this.form);"></div>
			<div><pre>${vo.content}</pre></div>
			<div>${vo.f_time}</div>
			<div>${vo.l_time}</div>
		</form>
	</c:forEach>

</div>
</body>
</html>