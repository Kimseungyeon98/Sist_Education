<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring MVC</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>

	#link_btn {
		width:110px;
		height:60px;
		background-color:#ff0000;
		cursor:pointer;
		color:white;
	}
	#link_btn:hover {
		background-color:#c4302b;
		color:black;
	}
	#icon {
		font-size:45px;
	}
	
	#outline_box {
		width:auto;
		height:auto;
		border:solid 2px #AED581;
	}
	#logo_name {
		font-size:50px;
		letter-spacing:-5px;
	}
	#logo_country {
		font-size:30px;
	}
	#logo_name,#logo_country {
		cursor:pointer;
	}
	
	
	#alert_box {
	    display: none;
	    position: fixed;
	    top: 20%;
	    right: 50%;
    	transform: translateX(50%);
	    padding: 15px;
	    background-color: #AED581;
	    color: white;
	    border-radius: 5px;
	    opacity: 1;
	    transition: opacity 1s ease-out;
	    height: 10%;
	    z-index: 1000
	}
</style>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center">
			<div id="link_btn" class="d-flex justify-content-center align-items-center border rounded-4 my-5 ms-5 fw-bold">
				<i id="icon" class="bi bi-caret-right-fill"></i>
			</div>
			<div class="d-flex justify-content-start align-items-center m-0 p-0">
				<p id="logo_name" class="fw-bold m-0">YouTube</p>
			</div>
			<div class="d-flex">
				<p id="logo_country" class="mt-4">KR</p>
			</div>
		</div>
	</div>
	<div class="container">
		<ul class="list-unstyled px-5">
			<li><a href="${pageContext.request.contextPath}/hello.do">HelloController</a></li>
			<li><a href="${pageContext.request.contextPath}/search/internal.do?query=서울!">SearchController - internal.do</a></li>
			<li><a href="${pageContext.request.contextPath}/search/external.do?query=제주&pageNumber=20">SearchController - external.do</a></li>
			<li><a href="${pageContext.request.contextPath}/article/newArticle.do">newArticleController</a></li>
			<li><a href="${pageContext.request.contextPath}/cookie/make.do">CookieController - make.do</a></li>
			<li><a href="${pageContext.request.contextPath}/cookie/view.do">CookieController - view.do</a></li>
			<li><a href="${pageContext.request.contextPath}/search/main.do">GameSearchController</a></li>
			<li><a href="${pageContext.request.contextPath}/account/create.do">CreateAccountController</a></li>
			<li><a href="${pageContext.request.contextPath}/login/login.do">LoginController</a></li>
			<li><a href="${pageContext.request.contextPath}/report/submitReport.do">SubmitReportController</a></li>
			<li><a href="${pageContext.request.contextPath}/member/write.do">MemberWriteController</a></li>
			<li><a href="${pageContext.request.contextPath}/file.do">DownloadController</a></li>
			<li><a href="${pageContext.request.contextPath}/pageRanksExcel.do">PageRanksController - pageRanksExcel.do</a></li>
			<li><a href="${pageContext.request.contextPath}/pageJson.do">PageRanksController - pageJson.do</a></li>
		</ul>
	</div>
	<div id="alert_box" class="p-3 m-3 rounded-5 border text-center">
		경고합니다!
	</div>
	<div class="text-center">
		<button class="btn btn-lg btn-primary" onclick="alert_danger()">버튼</button>
	</div>
	<script>
		window.onload = function(){
			/* 유튜브 로고 */
			const link_btn = document.getElementById('link_btn');
			link_btn.onclick = function(){
				alert('유튜브~!');
			};
			
			const logo_name = document.getElementById('logo_name');
			logo_name.onclick = function(){
				alert('유튜브~!');
			};
			
			const logo_country = document.getElementById('logo_country');
			logo_country.onclick = function(){
				alert('유튜브~!');
			};
		};

		
		/* 알림창(fade out) */
		const alertBox = document.getElementById('alert_box');
		function alert_danger() {
			alertBox.style.display = 'block';
			alertBox.style.opacity = '1';

		    // 3초 후에 알림창이 사라지도록 설정
		    setTimeout(() => {
		        fadeOut(alertBox);
		    }, 1000);
		};
		function fadeOut(element) {
		    let op = 1;  // 초기 불투명도
		    const timer = setInterval(() => {
		        if (op <= 0.1) {
		            clearInterval(timer);
		            element.style.display = 'none';
		        }
		        element.style.opacity = op;
		        op -= 0.1;
		    }, 100);
		};
	</script>
</body>
</html>