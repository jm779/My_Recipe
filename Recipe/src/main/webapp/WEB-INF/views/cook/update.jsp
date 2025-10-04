<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/head.jsp" />
<title>요리상세페이지</title>
</head>
<body>
	<div>
		<div>
			<form method="post" action="${pageContext.request.contextPath}/cook/update/${item.recipeid}">
				<div>
					<label>레시피 제목</label>
					<input type="text" name="recipetitle" value="${item.recipetitle}"/>
				</div>

				<div>
					<label>레시피 소개</label>
					<input type="text" name="comment" value="${item.comment}"/>
				</div>

				<div>
					<label for="cook-url">레시피 동영상 링크</label>
					<input type="url" id="cook-url" name="link" placeholder="https://example.com" value="${item.link}"/>
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
					<section class="steps">
						<div class="step">
							<p>STEP</p>
							<button class="minus">
								<a class="line"></a>
							</button>
							<input type="text" placeholder="조리내용을 적어보세요!" />
							<img src="" alt="이미지 추가">
							<div>
								<input type="text" placeholder="재료" />
								<input type="text" placeholder="도구" />
								<input type="text" placeholder="팁" />
							</div>
						</div>
					</section>
				</div>	
				<div><button type="button" id="add_step_btn">step 추가하기</button></div>
				<div><button id="send" type="submit">수정완료</button></div>
			</form>
		</div>

		<!-- 요리 목록 테이블 만들기 -->
<!-- 		<table class="table table-sm" border="1"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>요리명</th> -->
<!-- 					<th>코멘트</th> -->
<!-- 					<th>재료</th> -->
<!-- 					<th>요리내용</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<%-- 				<c:forEach var="cook" items="${list}"> --%>
<!-- 					<ul> -->
<%-- 						<li>${cook.recipeid}</li> --%>
<%-- 						<li>${cook.recipetitle}</li> --%>
<%-- 						<li>${cook.comment}</li> --%>
<%-- 						<li>${cook.link}</li> --%>
<!-- 					</ul> -->
<%-- 				</c:forEach> --%>
<%-- 				<c:if test="${empty list}"> --%>
<!-- 					<tr> -->
<!-- 						<td colspan="4">요리 정보가 없습니다.</td> -->
<!-- 					</tr> -->
<%-- 				</c:if> --%>
<!-- 			</tbody> -->
<!-- 		</table> -->
	</div>
</body>
</html>
