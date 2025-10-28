<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/check_id.js"></script>
</head>

<body class="d-flex flex-column min-vh-100">
	<header class="py-3 border-bottom">
	  <div class="container">
	    <div class="d-flex justify-content-between align-items-center">
	      <div class="d-flex align-items-center gap-2">
	        <a href="/">
	          <img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="logo" style="height:50px;">
	        </a>
	        <h2 class="mb-0">RecipeTime</h2>
	      </div>
	
	      <form action="search" method="get" class="d-flex gap-2">
	        <input type="text" name="query" placeholder="검색내용" class="form-control"/>
	        <button type="submit" class="btn btn-primary" style="width: 100px;">검색</button>
	      </form>
	    </div>
	  </div>
	</header>

	<main class="flex-grow-1">
		<div class="my-2 mt-5" style="margin: 0 auto;">
				<div class="d-flex justify-content-center">
					
					<form method="post" class="container" style="max-width: 600px;">
						<h3 class="text-center mb-4">회원가입</h3>
						
		                <div class="row mb-3">
							  <label class="col-sm-3 col-form-label">아이디:</label>
							  <div class="col-sm-5">
							    <input type="text" name="userid" class="form-control" style="display: block; width: 300px; margin-right: 20px;"
							    	placeholder="아이디 입력"/>
							  </div>
							  <div class="col-sm-3">
							    <button id="check_btn" type="button" class="btn btn-secondary w-100">중복확인</button>
							  </div>
						 </div>
		
							<div class="row mb-3">
								<div><label class="col-sm-3 col-form-label">비밀번호:</label></div>
								<div>
									<input type="password" name="userpassword" class="form-control" 
										placeholder="새 비밀번호"/>
								</div>
							</div>
							
							<div class="row mb-3">
								<div><label class="col-sm-3 col-form-label">이름:</label></div>
								<div>
									<input type="text" name="name" class="form-control" 
										placeholder="성명"/>
								</div>
							</div>
							
							<div class="row mb-3">
								<div><label class="col-sm-3 col-form-label">이메일:</label></div>
								<div>
									<input type="text" name="email" class="form-control" 
										placeholder="이메일"/>
								</div>
							</div>
								
							<div class="row mt-4">
								<div class="col-sm-6">
									<button class="btn btn-primary w-100">가입하기</button>
								</div>
								<div class="col-sm-6">
									<a href="."><button type="button" class="btn btn-outline-secondary w-100">취소</button></a>
								</div>
							</div>
					</form>
			</div>
		</div>
	</main>
<jsp:include page="../include/footer.jsp" />
</body>
</html>