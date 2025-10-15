<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="${pageContext.request.contextPath}/js/profile_pop.js" ></script>
</head>
<body>
	<div id="profile_box">
		<img id="profile_img" src="${pageContext.request.contextPath}/resources/image/profile.png" alt="profile">
	
		<section id="profile_menu">
			<a href="${pageContext.request.contextPath}/member/mypage">마이페이지</a>
			<a href="${pageContext.request.contextPath}/js/add.js">알림</a>
			<a href="${pageContext.request.contextPath}/member/mypage">회원정보 수정</a>
			<a href="${pageContext.request.contextPath}/member/login">로그아웃</a>
			<div class="line"></div>
			<div><button class="plus"></button></div>
			<p>팔로워</p><p>팔로잉</p>
		</section>
	</div>
	
	
</body>
</html>