<%@page import="kr.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 폼</title>
<style>
	li{
		list-style:none;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
	window.onload = function(){
		const myForm = document.getElementById('myForm');
		myForm.onsubmit = function(){
			const inputs = document.querySelectorAll('input[type="text"],input[type="number"]');
			
			for(let i=0; i<inputs.length; i++){
				if(inputs[i].value.trim()==''){
					const label = document.querySelector('label[for="'+inputs[i].id+'"]');
					alert(label.textContent+' 항목은 필수 입력!');
					inputs[i].value = '';
					inputs[i].focus();
					return false;
				}
			}
		};
	};

</script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		try{
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM PRODUCT WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
%>
			<div class="container border">
				<h1>상품 수정 폼</h1>
				<form action="update.jsp" method="post" id="myForm">
					<input type="hidden" name="num" value="<%= num %>">
					<ul>
						<li>
							<label for="name">상품명</label>
							<input type="text" id="name" name="name" value="<%= rs.getString("name") %>">
						</li>
						<li>
							<label for="price">가격</label>
							<input type="text" id="price" name="price" value="<%= rs.getString("price") %>">
						</li>
						<li>
							<label for="stock">수량</label>
							<input type="number" id="stock" name="stock" value="<%= rs.getInt("stock") %>">
						</li>
						<li>
							<label for="origin">원산지</label>
							<input type="text" id="origin" name="origin" value="<%= rs.getString("origin") %>">
						</li>
					</ul>
					<input type="submit" value="수정" class="btn btn-primary">
					<input type="button" value="목록" class="btn btn-success" onclick="location.href='select.jsp'">
				</form>
			</div>
<%
			}
			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.executeClose(rs, pstmt, conn);
		}
	
	%>
</body>
</html>