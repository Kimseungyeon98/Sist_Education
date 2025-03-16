<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-5">
	<h2>글쓰기</h2>
	<form:form action="insert.do" modelAttribute="boardVO" cssClass="form-control">
		<ul class="list-unstyled">
			<li>
				<form:label path="writer" cssClass="form-label">작성자</form:label>
				<form:input path="writer" cssClass="form-control"/>
				<form:errors path="writer" cssClass="text-danger"/>
			</li>
			<li>
				<form:label path="title" cssClass="form-label">제목</form:label>
				<form:input path="title" cssClass="form-control"/>
				<form:errors path="title" cssClass="text-danger"/>
			</li>
			<li>
				<form:label path="passwd" cssClass="form-label">비밀번호</form:label>
				<form:password path="passwd" cssClass="form-control"/>
				<form:errors path="passwd" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="content" cssClass="form-label">내용</form:label>
				<form:textarea path="content" cssClass="form-control" cols="5" rows="20"/>
				<form:errors path="content" cssClass="error-color"/>
			</li>
		</ul>
		<div class="text-center">
			<form:button class="btn btn-primary">등록</form:button>
			<input type="button" value="목록" class="btn btn-secondary" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>
</body>
</html>