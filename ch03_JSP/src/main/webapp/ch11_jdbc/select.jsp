<%@page import="kr.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<table class="table table-hover text-center">
			<h1>상품 목록</h1>
			<input type="button" value="상품 등록" onclick="location.href='insertForm.jsp'" class="btn btn-primary" style="float:right;">
			<thead class="table-dark">
				<tr><th>상품번호</th><th>상품명</th><th>가격</th><th>수량</th><th>원산지</th><th>상품등록일</th></tr>
			</thead>
			<tbody>
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					DecimalFormat format = new DecimalFormat("###,###");
					
					try{
						conn = DBUtil.getConnection();
						sql =  "SELECT * FROM product ORDER BY REG_DATE DESC";
						pstmt = conn.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
						
						while(rs.next()){
%>
							<tr>
								<td><%= rs.getInt("num") %></td>
								<td><a href="detail.jsp?num=<%= rs.getInt("num") %>"><%= rs.getString("name") %></a></td>
								<td><%= format.format(Integer.parseInt(rs.getString("price"))) %></td>
								<td><%= rs.getInt("stock") %></td>
								<td><%= rs.getString("origin") %></td>
								<td><%= rs.getDate("reg_date") %></td>
							</tr>
<%
						}
					} catch(Exception e){
						e.printStackTrace();
					} finally{
						DBUtil.executeClose(rs, pstmt, conn);
					}
				
				%>
			</tbody>
		</table>
	</div>
</body>
</html>