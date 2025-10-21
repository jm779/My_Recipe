<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>요리 상세 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-2">
<jsp:include page="../include/head.jsp" />
</div>

<div class="container my-5" style="max-width: 800px;">
    <div class="d-flex text-center mb-4">
        <a href="${pageContext.request.contextPath}/">
            <img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="icon" style="height: 60px;">
        </a>
        <h4 style="margin-left: 12px; margin-top: 10px;">레시피 상세 정보</h4>
    </div>

    <form>
        <div class="mb-3">
            <label class="form-label"><strong>레시피 제목</strong></label>
            <input type="text" class="form-control" value="${item.recipetitle}" readonly />
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>레시피 소개</strong></label>
            <input type="text" class="form-control" value="${item.comment}" readonly />
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>레시피 동영상 링크</strong></label>
            <input type="url" class="form-control" value="${item.link}" readonly />
        </div>

        <!-- 요리 순서 STEP -->
        <fieldset id="steps" class="mb-1">
            <legend class="fw-bold">요리순서</legend>
            
            <c:forEach var="step" items="${item.steps}" varStatus="status">
                <div class="step border p-3 mb-3">
                    <h5>STEP ${status.index + 1}</h5>

                    <input type="text" value="${step.content}" class="form-control mb-2" readonly />


                    <c:if test="${not empty step.imagepath}">
                        <div class="mb-2">
                            <img src="${step.imagepath}" alt="요리 이미지" style="max-width: 100%; height: auto;" />
                        </div>
                    </c:if>

                    <div class="mb-2">
                        <label><strong>재료</strong></label>
                        <input type="text" value="${step.ingredient}" class="form-control" readonly />
                    </div>

                    <div class="mb-2">
                        <label><strong>도구</strong></label>
                        <input type="text" value="${step.tools}" class="form-control" readonly />
                    </div>

                    <div class="mb-2">
                        <label><strong>팁</strong></label>
                        <input type="text" value="${step.tip}" class="form-control" readonly />
                    </div>
                </div>
            </c:forEach>
        </fieldset>
    </form>
</div>

<jsp:include page="../include/footer.jsp" />
</body>
</html>