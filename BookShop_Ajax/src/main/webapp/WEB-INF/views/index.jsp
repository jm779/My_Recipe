<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<div>
			<h1>BookShop</h1>		             
		</div>
		
		<c:if test="${sessionScope.member == null}">
			<div>
				<div><a href="login">로그인</a></div>
			</div>
			<div>
				<div><a href="signup">회원가입</a></div>
			</div>
		</c:if>
		
		
		<c:if test="${sessionScope.member != null}">
			<div>
				<div>${sessionScope.member.name}(${sessionScope.member.id})님 환영합니다.</div>
				<div><a href="logout">로그아웃</a></div>
			</div>
		</c:if>
		
		<div>
			<div><a href="html/book.html">도서관리</a></div>
			<div><a href="customer/list">고객관리</a></div>
			<div><a href="orders/list">주문관리</a></div>
			<div><a href="member/list">사용자관리</a></div>
		</div>
		
		<div>
			<div><a href="member/list">사용자관리</a></div>
		</div>
	</div>


</body>
</html>