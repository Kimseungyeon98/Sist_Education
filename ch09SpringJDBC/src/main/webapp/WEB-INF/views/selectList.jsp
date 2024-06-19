<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container my-5">
		<h2 class="fw-bold">게시판 목록</h2>
		<div class="text-end">
			<input type="button" class="btn btn-lg btn-warning text-white" value="글쓰기" onclick="location.href='insertForm.do'">
		</div>
		<hr>
		<table class="table table-hover text-center">
			<thead class="table-dark">
				<tr>
					<th>#</th><th>제목</th><th>내용</th><th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td><td></td><td></td><td></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>