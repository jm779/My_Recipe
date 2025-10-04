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
							<button type="button">추가</button>
						</div>
					</div>

					<div>
						<img src="" alt="">
						<div>
							<button type="button">추가</button>
						</div>
					</div>
				</div>
				
				<fieldset id="steps">
					<legend style="font-weight: bold">요리순서</legend>
					<div class="step">
						<h2>STEP</h2>
						<button type="button" class="minus" onclick="removeBtn(this)" >
							<span class="line">-</span>
						</button>
						<input type="text" name="steps[0].content" placeholder="조리내용을 적어보세요!"/>
						<img src="" alt="이미지 추가">
						<div>
							<div>
								<label>재료</label>
								<input type="text" name="steps[0].ingredient" placeholder="재료" />
								<button type="button" onclick="addIngre(this)">+</button>
							</div>
							<div>
								<input type="text" name="steps[0].tools" placeholder="도구" />
								<button type="button" onclick="addTools(this)">+</button>
							</div>
							<div>
								<input type="text" name="steps[0].tip" placeholder="팁" />
								<button type="button" onclick="addTip(this)">+</button>
							</div>
						</div>
					</div>	
				</fieldset>

				<div id="steps-container">
					<button type="button" id="add_step_btn" >step 추가하기</button>
				</div>
				
				<div>
					<button id="send" type="submit">제출</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>