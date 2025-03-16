<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	@font-face {
	    font-family: 'Freesentation-9Black';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/Freesentation-9Black.woff2') format('woff2');
	    font-weight: 900;
	    font-style: normal;
	}
</style>
</head>
<body style="font-family: 'Freesentation-9Black'">
	<div class="container my-5">
		<h2 class="fw-bold">글 쓰기</h2>
		<hr>
		<form:form action="insert.do" modelAttribute="boardVO" cssClass="form-control">
			<ul class="list-unstyled">
				<li>
					<form:label path="writer">작성자</form:label>
					<form:input path="writer" cssClass="form-control"/>
					<form:errors path="writer" cssClass="text-danger"/>
				</li>
				<li>
					<form:label path="title">제목</form:label>
					<form:input path="title" cssClass="form-control"/>
					<form:errors path="title" cssClass="text-danger"/>
				</li>
				<li>
					<form:label path="passwd">비밀번호</form:label>
					<form:password path="passwd" cssClass="form-control"/>
					<form:errors path="passwd" cssClass="text-danger"/>
				</li>
				<li>
					<form:label path="content">내용</form:label>
					<form:textarea path="content" cssClass="form-control"/>
					<form:errors path="content" cssClass="text-danger"/>
				</li>
			</ul>
			<div class="text-center">
				<form:button class="btn btn-lg btn-primary">등록</form:button>
				<input type="button" value="목록" class="btn btn-lg btn-light" onclick="location.href='list.do'">
			</div>
		</form:form>
	</div>
</body>
</html>