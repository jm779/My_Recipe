<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="${pageContext.request.contextPath}/js/add.js"></script>
</head>
<body>
	<div>
		<div>
			<h1>기본 정보</h1>
		</div>
		<div>
			<img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="icon">
		</div>
		<div>
			<form method="post" action="${pageContext.request.contextPath}/cook/add">
				<div>
					<label>레시피 제목</label>
					<input type="text" name="recipetitle"/>
				</div>

				<div>
					<label>레시피 소개</label>
					<input type="text" name="comment" />
				</div>

				<div>
					<label for="cook-url">레시피 동영상 링크</label>
					<input type="url" id="cook-url" name="link" placeholder="https://example.com" />
				</div>
				<div>
					<div>
						<img src="" alt="">
						<div>
							<button type="button">추가버튼</button>
						</div>
					</div>

					<div>
						<img src="" alt="">
						<div>
							<button type="button">추가버튼</button>
						</div>
					</div>
				</div>
				
				<div>
					<h2>요리순서</h1>
					<div class="step_template">
						<div class="step">
							<h2>STEP</h2>
							<button class="minus" type="button">
								<a class="line"></a>
							</button>
							<input type="text" placeholder="조리내용을 적어보세요!" class="description" />
							<img src="" alt="이미지 추가">
							<div>
								<input type="text" placeholder="재료" />
								<input type="text" placeholder="도구" />
								<input type="text" placeholder="팁" />
							</div>
							<button class="plus">추가</button>
						</div>
					</div>
				</div>	
				
				<div id="steps-container">
					<button type="button" id="add_step_btn" >step 추가하기</button>
				</div>
				
				<div>
					<button id="send" type="submit" >제출</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>