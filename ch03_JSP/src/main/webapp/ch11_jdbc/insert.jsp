<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.util.DBUtil" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");	

	String name = request.getParameter("name");
	String price = request.getParameter("price");
	String stock = request.getParameter("stock");
	String origin = request.getParameter("origin");

	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try{
		conn = DBUtil.getConnection();
		sql = "INSERT INTO product (num, name, price, stock, origin, reg_date) VALUES (product_seq.nextval, ?, ?, ?, ?,SYSDATE)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, price);
		pstmt.setInt(3, Integer.parseInt(stock));
		pstmt.setString(4, origin);
		
		pstmt.executeUpdate();
%>
		<h2>상품 등록 완료</h2>
		<input type="button" value="목록으로" onclick="location.href='select.jsp'">
<%	
	} catch(Exception e){
%>
		<h2>상품 등록 실패</h2>
		<input type="button" value="상품 재등록" onclick="location.href='insertForm.jsp'">
		<input type="button" value="목록으로" onclick="location.href='select.jsp'">
<%	
		e.printStackTrace();
	} finally{
		DBUtil.executeClose(null, pstmt, conn);
	}
%>
</body>
</html>