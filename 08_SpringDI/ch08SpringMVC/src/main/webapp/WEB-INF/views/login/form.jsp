<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form:form action="login.do" modelAttribute="loginVO">
		<!-- 필드가 없는 에러메시지를 처리하기 위해 명시 -->
		<form:errors element="div"/>
		<br>
		아이디 : 	<form:input path="id"/>
				<form:errors path="id"/>
		<br>
		비밀번호 : 	<form:password path="passwd"/>
				<form:errors path="passwd"/>
		<br>
		<form:button>전송</form:button>
	</form:form>
</body>
</html>