<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div>
				<label>레시피 제목</label>
				<p>${item.recipetitle}</p>
			</div>

			<div>
				<label>레시피 코멘트</label>
				<p>${item.comment}</p>
				<%--<input type="text" name="comment" value="${item.comment}"/> --%>
			</div>

			<div>
				<label>레시피 링크</label>
				<p>${item.link}</p>
				<%--<input type="url" id="cook-url" name="link" placeholder="https://example.com" value="${item.link}"/> --%>
			</div>

			<fieldset id="steps">
				<legend>요리순서</legend>

				<c:forEach var="stepitem" items="${steps}" varStatus="status">
					<div class="step">
						<h2>STEP ${status.index + 1}</h2>
						<input type="text" name="steps[${status.index}].content"
							value="${stepitem.content}" placeholder="조리내용을 적어보세요!" />

						<div>
							<label>재료</label> <input type="text"
								name="steps[${status.index}].ingredient"
								value="${stepitem.ingredient}" placeholder="재료" /> <label>도구</label>
							<input type="text" name="steps[${status.index}].tools"
								value="${stepitem.tools}" placeholder="도구" /> <label>팁</label> <input
								type="text" name="steps[${status.index}].tip"
								value="${stepitem.tip}" placeholder="팁" />
						</div>
					</div>
				</c:forEach>
			</fieldset>


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
