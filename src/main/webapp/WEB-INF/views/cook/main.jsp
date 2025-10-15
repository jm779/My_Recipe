<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<header>
		<div>
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="icon">
			</a>
		</div>

		<div>
			<input type="text" placeholder="검색내용" />
			<button type="button">검색</button>
		</div>

		<div>
			<a><img src="" alt="프로필사진">
			</a>
		</div>

		<div>
			<a href="${pageContext.request.contextPath}/cook/add">레시피 작성하기</a> 
			<button onclick="alert()">알림</button>
		</div>
	</header>

	<div class="body">
		<div>
			<button onclick="">수정</button>
			<button onclick="">삭제</button>
		</div>

		<div>
			<img src="" alt="요리메인이미지">
		</div>

		<div>
			<label>레시피 제목</label> <input type="text" placeholder="제목을 입력하세요"></input>
		</div>

		<div>
			<label>레시피 소개</label> <input type="text" placeholder="간단한 코멘트를 작성해보세요!"></input>
		</div>

		<div>
			<label>재료</label>
			<div class="ingredient">
				<input type="text" placeholder="메인재료를 간단히 적어보세요!">
			</div>
		</div>

		<div>
			<label>방법</label>
			<div class="method">
				<input type="text" placeholder="예)굽기, 삶기, 찌기 등등">
			</div>
		</div>


		<div>
			<label>요리 시간</label> <select>
				<option>30분 이하</option>
				<option>30분 이하 ~ 1시간 이내</option>
				<option>1시간 이상</option>
				<option>1시간 30분이상 ~ 2시간</option>
			</select>
		</div>

		<div>
			<label>난이도</label> <select>
				<option>상</option>
				<option>중</option>
				<option>하</option>
			</select>
		</div>

		<form method="post">
			<div id="ingredient-container">
				<div class="ingredient-row">
					<input type="text" name="ingre_name" placeholder="예)양파">
					<input type="number" name="amount" placeholder="예)2"> 
					<select name="ingredients[0].unit">
						<option value="개">개</option>
						<option value="g">g</option>
						<option value="ml">ml</option>
						<option value="컵">컵</option>
					</select> 
					<input type="text" name="tip" placeholder="예: 얇게 썰어주세요">
					<button type="button" class="remove-btn">삭제</button>
				</div>
			</div>
			<button type="button" id="add-ingre-btn">재료 추가</button>
			<button type="submit">저장</button>
		</form>
	</div>
</body>
</html>