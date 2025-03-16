<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container my-5">
	<h2>글 삭제</h2>
	<form:form action="delete.do" modelAttribute="boardVO">
		<form:hidden path="num"/>
		<ul class="list-unstyled">
			<li>
				<form:label path="passwd">비밀번호</form:label>
				<form:password path="passwd" cssClass="form-control"/>
				<form:errors path="passwd" cssClass="text-danger"/>
			</li>
		</ul>
		<div class="text-center">
			<input type="submit" value="삭제" class="btn btn-danger">
			<input type="button" value="목록" class="btn btn-light" onclick="location.href='list.do'">
		</div>
	</form:form>
	</div>
</body>
</html>