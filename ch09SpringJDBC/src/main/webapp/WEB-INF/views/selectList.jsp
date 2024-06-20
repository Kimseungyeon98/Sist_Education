<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	
	@font-face {
	    font-family: 'Freesentation-9Black';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/Freesentation-9Black.woff2') format('woff2');
	    font-weight: 900;
	    font-style: normal;
	}

	#write_btn{
		background-color: #9575CD;
		font-size: 20px;
		color: white;
		border: 1px solid #B39DDB;
		border-radius: 50px;
		width: 140px;
		height: 50px;
		cursor: pointer;
	}
	#write_btn:hover{
		background-color: #B39DDB;
		transform: scale(1.1);
	}
	
</style>
<script>
	window.onload = function(){
		const write_btn = document.getElementById('write_btn');
		write_btn.onclick=function(){
			location.href='insertForm.do';
		};
	};
</script>
</head>
<body style="font-family: 'Freesentation-9Black'">
	<div class="container my-5">
		<h2 class="fw-bold">게시판 목록</h2>
		<div class="d-flex justify-content-end">
			<div id="write_btn" class="text-center fw-bold d-flex align-items-center justify-content-center">
				<div>글 쓰기</div>
			</div>
		</div>
		<hr>
		<c:if test="${count==0}">
			<div class="text-center border rounded-3">
				표시할 내용이 없습니다.
			</div>
		</c:if>
		<c:if test="${count!=0}">
			<table class="table table-hover text-center">
				<thead class="table-dark">
					<tr>
						<th>#</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${list}">
						<tr>
							<td><a class="text-decoration-none text-dark fw-bold" href="detail.do?num=${board.num}">${board.num}</a></td>
							<td><a class="text-decoration-none text-dark fw-bold" href="detail.do?num=${board.num}">${board.title}</a></td>
							<td><a class="text-decoration-none text-dark fw-bold" href="detail.do?num=${board.num}">${board.writer}</a></td>
							<td><a class="text-decoration-none text-dark fw-bold" href="detail.do?num=${board.num}">${board.reg_date}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>