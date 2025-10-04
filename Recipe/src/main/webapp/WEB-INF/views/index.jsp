<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
</head>
<body>
	<div class="row">
		<header style="margin-bottom:20px;">
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="icon">
			</a>
			<h1>RecipeTime</h1>
	
			<div>
				<input type="text" placeholder="검색내용" />
				<button type="button">검색</button>
			</div>
			<c:if test="${sessionScope.member == null}">
				<div>
					<div>
						<a href="login">로그인</a>
					</div>
					<div>
						<a href="signup">회원가입</a>
					</div>
				</div>
			</c:if>

			<c:if test="${sessionScope.member != null}">
				<div>
					<div>
						<img id="profile_img" src="${pageContext.request.contextPath}/resources/image/profile.png" alt="profile">
					</div>
					<div>${sessionScope.member.name}(${sessionScope.member.userid})님 환영합니다.</div>
					<div>
						<a href="logout">로그아웃</a>
						<a href="goadd">레시피 등록</a>
						<a href="${pageContext.request.contextPath}/member/mypage">마이페이지</a>
					</div>
				</div>
			</c:if>
		</header>
	</div>
	
	<nav class="nav_bar">
		<ul>
			<li><a>추천 Recipe</a></li>
			<li><a>인기 Recipe</a></li>
			<li><a>Best Chef</a></li>
			<li><a>Help</a></li>
		</ul>	
	</nav>
	
	
	<div>
		<h3>Hot Recipe</h3>
		<a>더보기</a>
	</div>
	
	<section>
		<div>
			<img src="" alt="">
			<p></p>
		</div>
	</section>




</body>