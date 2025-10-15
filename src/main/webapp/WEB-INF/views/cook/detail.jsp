<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>요리상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container my-5">
	<jsp:include page="../include/head.jsp" />
	<jsp:include page="../include/footer.jsp" />
		<div class="container my-5 justify-content-center">
			<div>
				<div class="mb-3">
					<label class="mb-2"><strong>레시피 제목</strong></label> 
					<div><p>${item.recipetitle}</p></div>
				</div>

				<div class="mb-3">
					<label class="mb-2"><strong>레시피 소개</strong></label>
					<div><p>${item.comment}</p></div> 
				</div>

				<div class="mb-3">
					<label for="cook-url" class="mb-2"><strong>레시피 동영상 링크</strong></label>
					<div><p>${item.link}</p></div>
				</div>
					<%--<input type="url" id="cook-url" name="link" placeholder="https://example.com" value="${item.link}"/> --%>
			</div>
	
				<fieldset id="steps" class="mb-4">
			        <legend class="fw-bold">요리순서</legend>
			        
			        <c:forEach var="step" items="${item.steps}" varStatus="status">
			        	<div class="step border p-3 mb-3">
			        		<h4>STEP_ ${status.index + 1}</h4>
			        		<p><strong>내용: </strong>${step.content}</p>
			        		<p><strong>재료: </strong>${step.ingredient}</p>
			        		<p><strong>도구: </strong>${step.tools}</p>
			        		<p><strong>팁: </strong>${step.tip}</p>
			        	</div>
			        </c:forEach>	
			   </fieldset>
			</div>
		</div>
	</div>
</body>
</html>