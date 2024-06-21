<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	#write_btn{
		width: 90px;
		height: 50px;
		background-color: #64FE2E;
		cursor: pointer;
		color: white;
		text-align: center;
		align-content: center;
		border-radius: 20px;
		font-size:20px;
	}
	#write_btn:hover{
		background-color: #9FF781;
		transform: scale(1.04);
	}
</style>
<script>
	window.onload = function(){
		const writeBtn = document.getElementById('write_btn');
		writeBtn.onclick = function(){
			location.href='insert.do';
		};
	};
</script>
</head>
<body>
<div class="container my-5">
	<h2>게시판 목록</h2>
	<div class="float-end my-3">
		<div id="write_btn">글 쓰기</div>
	</div>
	<c:if test="${count == 0 }">
		<div class="border rounded-5 text-center fw-bold">표시할 내용이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table class="table table-hover text-center">
		<tr class="table-dark">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="board" items="${list}">
		<tr class="table-light">
			<td><a href="detail.do?num=${board.num}" class="text-decoration-none text-dark">${board.num}</a></td>
			<td><a href="detail.do?num=${board.num}" class="text-decoration-none text-dark">${board.title}</a></td>
			<td><a href="detail.do?num=${board.num}" class="text-decoration-none text-dark">${board.writer}</a></td>
			<td><a href="detail.do?num=${board.num}" class="text-decoration-none text-dark">${board.reg_date}</a></td>
		</tr>
		</c:forEach>
	</table>
	<div class="text-center">${page}</div>
	</c:if>
</div>
</body>
</html>