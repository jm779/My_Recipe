<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
</head>
<body>
	<div>
		<header style="margin-bottom:20px;">
				<a href="">
					<img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="icon">
				</a>
				<h1>RecipeTime</h1>
		
				<div>
					<input type="text" placeholder="검색내용" />
					<button type="button">검색</button>
				</div>
		</header>
		<div><h3>LOGIN</h3></div>
		
			<c:if test="${not empty loginError}">
    			<p style="color:violet;">${loginError}</p>
			</c:if>
			
		<div>
			<form method="post">
			<div>
				<div><label>아이디:</label></div>
				<div><input type="text" name="userid"></input></div>
			</div>
		
			<div>
				<div><label>비밀번호:</label></div>
				<div><input type="password" name="userpassword"></input></div>
			</div>
			
			<div>
				<div><button>로그인</button></div>
				<div><a href="."><button type="button">취소</button></a></div>
			</div>
			</form>
		</div>	
	</div>
</body>
</html>