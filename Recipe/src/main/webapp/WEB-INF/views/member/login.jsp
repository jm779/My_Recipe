<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div>
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