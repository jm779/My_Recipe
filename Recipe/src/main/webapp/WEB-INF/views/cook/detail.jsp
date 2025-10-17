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
				
				    <div id="step_box" class="step border p-3 mb-3">
				        <c:forEach var="step" items="${item.steps}" varStatus="status">
				            <div class="step border p-3 mb-3">
				                <h5>STEP ${status.index + 1}</h5>
				
				                <!-- 조리내용 -->
				                <div class="mb-2">
				                    <label><strong>내용</strong></label>
				                    <input type="text" value="${step.content}" class="form-control" readonly />
				                </div>
				
				                <!-- 이미지 첨부 영역 (파일 없음 표시도 고려) -->
				                <%-- <div class="mb-2">
				                    <label><strong>이미지</strong></label>
				                    <ul id="file">
				                        <c:forEach var="img" items="${step.images}">
				                            <li><img src="${img.url}" alt="요리 이미지" width="100" /></li>
				                        </c:forEach>
				                    </ul>
				                </div> --%>
				
				                <!-- 재료 -->
				                <div class="mb-2">
				                    <label><strong>재료</strong></label>
				                    <input type="text" value="${step.ingredient}" class="form-control" readonly />
				                </div>
				
				                <!-- 도구 -->
				                <div class="mb-2">
				                    <label><strong>도구</strong></label>
				                    <input type="text" value="${step.tools}" class="form-control" readonly />
				                </div>
				
				                <!-- 팁 -->
				                <div class="mb-2">
				                    <label><strong>팁</strong></label>
				                    <input type="text" value="${step.tip}" class="form-control" readonly />
				                </div>
				            </div>
				        </c:forEach>
				    </div>
				</fieldset>

			</div>
		</div>
	</div>
<jsp:include page="../include/footer.jsp" />
</body>
</html>