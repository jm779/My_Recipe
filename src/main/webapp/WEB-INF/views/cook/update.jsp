<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>요리수정페이지</title>
</head>
<body>
	<div class="container my-5">
	<jsp:include page="../include/head.jsp" />
	<jsp:include page="../include/footer.jsp" />
		<div>
			<form method="post" action="${pageContext.request.contextPath}/cook/update/${item.recipeid}">
				<div class="mb-3">
					<label class="mb-2" ><strong>레시피 제목</strong></label> 
					<input type="text" name="recipetitle" class="form-control" value="${item.recipetitle}"/>
				</div>

				<div class="mb-3">
					<label class="mb-2"><strong>레시피 소개</strong></label>
					<input type="text" name="comment" class="form-control" value="${item.comment}"/>
				</div>

				<div class="mb-3">
					<label for="cook-url" class="mb-2"><strong>레시피 동영상 링크</strong></label>
					<input type="url" id="cook-url" name="link" placeholder="https://example.com"
						class="form-control" value="${item.link}" />
				</div>

				<div>
					<fieldset id="steps" class="mb-1">
						<legend class="fw-bold" style="font-weight: bold;">요리순서</legend>
									
						<div class="step border p-3 mb-3">			
							<c:forEach var="stepitem" items="${steps}" varStatus="status">
								<div class="step p-3 mb-3">
									<h5>STEP ${status.index + 1}</h5>
									
									<button type="button" class="btn btn-danger btn-sm mb-2" onclick="removeBtn(this)">+</button>
	          						<button type="button" class="btn btn-danger btn-sm mb-2" onclick="removeBtn(this)">-</button>
									
									<input type="text" name="steps[${status.index}].content" value="${stepitem.content}" 
										placeholder="조리내용을 적어보세요!" class="form-control mb-2"/> 
									
									<div class="mb-2">
										<input type="text" name="steps[${status.index}].ingredient"
											value="${stepitem.ingredient}" placeholder="재료" class="form-control mb-2" /> 
										<input type="text" name="steps[${status.index}].tools"
											value="${stepitem.tools}" placeholder="도구" class="form-control mb-2" /> 
										<input type="text" name="steps[${status.index}].tip" 
											value="${stepitem.tip}" placeholder="팁" class="form-control mb-2" />
									</div>
								</div>
							</c:forEach>
						</div>
					</fieldset>
				</div>
				<div>
					<button type="button" id="add_step_btn" class="btn btn-secondary">step 추가</button>
				</div>
				<div>
					<button id="send" type="submit" class="justify-content-center">수정완료</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
