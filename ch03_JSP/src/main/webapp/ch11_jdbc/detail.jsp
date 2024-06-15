<%@page import="kr.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.*" %>
<%@ page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<style>
	#btn_group{
		float:right;
	}
	.btn {
		float:left;
		margin:3px;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container border">
		<h1 class="text-center">상품 상세 정보</h1>
		<hr width="100%" size="1" noshade="noshade">
		<%
			int num = Integer.parseInt(request.getParameter("num"));
			DecimalFormat format = new DecimalFormat("###,###");	
		
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			
			try{
				conn = DBUtil.getConnection();
				sql = "SELECT * FROM product WHERE num=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,num);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){ //글 정보 유효
		%>
					<b>상품번호</b>: <%= rs.getInt("num") %><br>
					<b>상품명</b>: <%= rs.getString("name") %><br>
					<b>상품가격</b>: <%= format.format(Integer.parseInt(rs.getString("price"))) %><br>
					<b>상품수량</b>: <%= rs.getInt("stock") %><br>
					<b>상품원산지</b>: <%= rs.getString("origin") %><br>
					<b>상품등록일</b>: <%= rs.getDate("reg_date") %><br>
		<%
				}
			} catch(Exception e){
				e.printStackTrace();
			} finally{
				DBUtil.executeClose(rs, pstmt, conn);
			}
		%>
		<hr width="100%" size="1" noshade="noshade">
		<div id="btn_group">
			<input type="button" value="수정" onclick="location.href='updateForm.jsp?num=<%= num %>'" class="btn btn-primary">
			<input type="button" value="삭제" onclick="location.href='delete.jsp?num=<%= num %>'" class="btn btn-danger">
			<input type="button" value="목록" onclick="location.href='select.jsp'" class="btn btn-success">
		</div>
	</div>
</body>
</html>