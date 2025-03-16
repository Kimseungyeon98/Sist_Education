<%@page import="kr.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String price = request.getParameter("price");
	int stock = Integer.parseInt(request.getParameter("stock"));
	String origin = request.getParameter("origin");
	

	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try{
		conn = DBUtil.getConnection();
		sql = "UPDATE product SET NAME=?, PRICE=?, STOCK=?, ORIGIN=? WHERE NUM=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, price);
		pstmt.setInt(3, stock);
		pstmt.setString(4, origin);
		pstmt.setInt(5, num);
		
		pstmt.executeUpdate();
%>
		<h2>상품 수정 완료</h2>
		<input type="button" value="목록으로" onclick="location.href='select.jsp'">
		<input type="button" value="상품 상세 조회" onclick="location.href='detail.jsp?num=<%= num %>'">
<%
		
	} catch(Exception e){
%>
		<h2>상품 수정 실패</h2>
		<input type="button" value="재수정" onclick="location.href='updateForm.jsp?num=<%= num %>'">
		<input type="button" value="목록으로" onclick="location.href='select.jsp'">
<%
		e.printStackTrace();
	} finally{
		DBUtil.executeClose(null, pstmt, conn);
	}
%>
</body>
</html>