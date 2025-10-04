<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/head.jsp" />
<script src="${pageContext.request.contextPath}/js/delete.js"></script>
<title>요리상세페이지</title>
</head>
<body>
	<div>
		<div><h1>내가 작성한 레시피</h1></div>
		<section>
			<div>		
			</div>
		</section>
		<!-- 요리 목록 테이블 만들기 -->
<%-- 		<table class="table table-sm" border="1">
			<thead>
				<tr>
					<th>레시피번호</th>
					<th>레시피이름</th>
					<th>코멘트</th>
					<th>링크</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cook" items="${list}">
					<tr>
						<td>${cook.recipeid}</td>
						<td>${cook.recipetitle}</td>
						<td>${cook.comment}</td>
						<td>${cook.link}</td>
						<td>
							<a href="${pageContext.request.contextPath}/cook/detail/${cook.recipeid}">
								<button type="button" >상세</button>
							</a>
							<a href="${pageContext.request.contextPath}/cook/update/${cook.recipeid}">
								<button type="button" >수정</button>
							</a>
							<a href="${pageContext.request.contextPath}/cook/delete/${cook.recipeid}" class="btn-delete">
								<button type="button" >삭제</button>
							</a>	
						</td>
					</tr>
				</c:forEach>
				<c:if test="${empty list}">
					<tr>
						<td colspan="4">작성한 레시피가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table> --%>
		
		
		 <!-- 요리 목록 테이블 만들기 -->
		<table class="table table-sm" border="1">
			<thead>
				<tr>
					<th>레시피번호</th>
					<th>레시피이름</th>
					<th>코멘트</th>
					<th>링크</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cook" items="${list}">
					<c:if test="${cook.userid == userid}">
						<tr>
							<td>${cook.recipeid}</td>
							<td>${cook.recipetitle}</td>
							<td>${cook.comment}</td>
							<td>${cook.link}</td>
							<td>
								<a href="${pageContext.request.contextPath}/cook/detail/${cook.recipeid}">
									<button type="button" >상세</button>
								</a>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/cook/update/${cook.recipeid}">
									<button type="button" >수정</button>
								</a>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/cook/delete/${cook.recipeid}" class="btn-delete">
									<button type="button" >삭제</button>
								</a>	
							</td>
						</tr>
					</c:if>
				</c:forEach>
				<c:if test="${empty list}">
					<tr>
						<td colspan="4">요리 정보가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table> 
	</div>
</body>
</html>
