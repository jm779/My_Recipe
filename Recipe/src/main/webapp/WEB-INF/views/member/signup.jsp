<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<script src="${pageContext.request.contextPath}/resources/js/check_id.js"></script>
</head>
<body>
<div>
	<div><h3>회원가입</h3></div>
	<div>
		<form method="post">
		
			<div>
				<div><label>아이디:</label></div>
				<div>
					<input type="text" id="userid" name="userid" />
					<button type="button" id="checkBtn">중복확인</button>
				</div>
				<div id="checkResult" style="color:magenta; font-size:13px;"></div>
			</div>
		
			<div>
				<div><label>비밀번호:</label></div>
				<div><input type="password" name="userpassword" /></div>
			</div>
		
			<div>
				<div><label>비밀번호:</label></div>
				<div><input type="password" name="userpassword" /></div>
			</div>
			
			<div>
				<div><label>이름:</label></div>
				<div><input type="text" name="name" /></div>
			</div>
			
			<div>
				<div><label>이메일:</label></div>
				<div><input type="text" name="email" /></div>
			</div>
				
			<div>
				<div><button>가입하기</button></div>
				<div><a href="."><button type="button">취소</button></a></div>
			</div>
		</form>
	</div>	
</div>

</body>
</html>