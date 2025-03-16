<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
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
		<h2>${board.title}</h2>
		<ul class="list-unstyled">
			<li>글번호 : ${board.num}</li>
			<li>작성자 : ${board.writer}</li>
			<li>작성일 : ${board.reg_date}</li>
		</ul>
		<hr width="80%">
		<p>
			${board.content}
		</p>
		<div class="text-center">
			<button class="btn btn-primary" onclick="location.href='update.do?num=${board.num}'">수정</button>
			<button class="btn btn-danger" onclick="location.href='delete.do?num=${board.num}'">삭제</button>
			<button class="btn btn-secondary" onclick="location.href='list.do'">목록</button>
		</div>
	</div>
</body>
</html>