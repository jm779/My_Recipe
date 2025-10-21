<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-2">
        <jsp:include page="../include/head.jsp" />

        <div class="container my-4">
            <h3 class="text-center mb-4">내가 작성한 레시피</h3>

            <div class="row">
                <c:forEach var="cook" items="${list}">
                    <c:if test="${cook.userid eq userid}">
                        <div class="col-md-6 mb-4">
                            <form class="border p-4 h-100">
                                <div class="mb-3">
                                    <label class="form-label"><strong>레시피 제목</strong></label>
                                    <input type="text" name="recipetitle" class="form-control" value="${cook.recipetitle}" readonly />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label"><strong>레시피 소개</strong></label>
                                    <input type="text" name="comment" class="form-control" value="${cook.comment}" readonly />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label"><strong>레시피 동영상 링크</strong></label>
                                    <input type="url" name="link" class="form-control" value="${cook.link}" readonly />
                                </div>

                                <div class="text-end">
                                    <a href="${pageContext.request.contextPath}/cook/detail/${cook.recipeid}" class="btn btn-outline-secondary btn-sm">상세</a>
                                    <a href="${pageContext.request.contextPath}/cook/update/${cook.recipeid}" class="btn btn-outline-primary btn-sm">수정</a>
                                    <a href="${pageContext.request.contextPath}/member/delete/${cook.recipeid}" class="btn btn-outline-danger btn-sm btn-delete">삭제</a>
                                </div>
                            </form>
                        </div>
                    </c:if>
                </c:forEach>
            </div>

            <c:if test="${empty list}">
                <div class="alert alert-info text-center">작성한 레시피가 없습니다.</div>
            </c:if>
        </div>
    </div>

    <jsp:include page="../include/footer.jsp" />
</body>
</html>