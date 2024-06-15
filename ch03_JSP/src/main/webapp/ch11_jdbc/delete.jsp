<%@page import="kr.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제</title>
</head>
<body>
	<%	
		//POST 방식으로 전송된 데이터 인코딩 타입 지정
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try{
			conn = DBUtil.getConnection();
			sql = "DELETE FROM product WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
%>
			<h1>상품 삭제 성공</h1>
			<input type="button" value="목록으로" onclick="location.href='select.jsp'">
<%
		} catch(Exception e){
%>
			<h1>상품 삭제 성공</h1>
			<input type="button" value="목록으로" onclick="location.href='select.jsp'">
<%
			e.printStackTrace();
		} finally{
			DBUtil.executeClose(null, pstmt, conn);
		}
	%>
</body>
</html>