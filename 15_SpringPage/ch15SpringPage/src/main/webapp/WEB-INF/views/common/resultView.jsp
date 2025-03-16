<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<title>${accessTitle}</title>
</head>
<body>
	<div class="page-one">
		<h2>${accessTitle}</h2>
		<div class="result-display">
			<div class="align-center">
				${accessMsg}
				<p>
				<input type="button" value="${accessBtn}" onclick="location.href='${accessUrl}'">
			</div>
		</div>
	</div>
</body>
</html>