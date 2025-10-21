<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="${pageContext.request.contextPath}/resources/js/img_add.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/step_add.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-2">
<jsp:include page="../include/head.jsp" />
</div>
	<div class="container my-5" style="max-width: 800px;">
		<div class="d-flex text-center mb-4">
			<a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="icon" style="height: 60px;"></a>
	      	<h3 style="margin-left: 12px; margin-top: 10px;">기본 정보</h3>
    	</div>

	    <form method="post" action="${pageContext.request.contextPath}/cook/add" enctype="multipart/form-data" > 
	      <div class="mb-3">
	        <label class="form-label"><strong>레시피 제목</strong></label>
	        <input type="text" name="recipetitle" class="form-control" placeholder="레시피 제목"/>
	      </div>
	
	      <div class="mb-3">
	        <label class="form-label"><strong>레시피 소개</strong></label>
	        <input type="text" name="comment" class="form-control" placeholder="간단한 소개를 적어보세요!"/>
	      </div>
	
	      <div class="mb-3">
	        <label for="cook-url" class="form-label"><strong>레시피 동영상 링크</strong></label>
	        <input type="url" id="cook-url" name="link" placeholder="https://example.com" class="form-control" />
	      </div>
	
	      <!-- 요리 순서 STEP -->
	      <fieldset id="steps" class="mb-1">
	        <legend class="fw-bold">요리순서</legend>
	          
	        <c:choose>
    			<c:when test="${not empty cook.steps}">
     				 <c:forEach var="step" items="${cook.steps}" varStatus="status">
					        <div class="step border p-3 mb-3">
					          	<h5>STEP ${status.index + 1}</h5>
					          	<button type="button" class="btn btn-danger btn-sm mb-2" onclick="removeBtn(this)">-</button>
								<input type="text" name="steps[${status.index}].content" placeholder="조리내용을 적어보세요!" class="form-control mb-2"/>
								
								<div>	
					          		<ul id="file"></ul>
					          		<button type="button" id="photo_btn">이미지 추가</button>
								</div>
								
						          <div class="mb-2">
						            <label><strong>재료</strong></label>
						            <div id="ingre_input" class="gap-2">
						              <input type="text" name="steps[${status.index}].ingredient" placeholder="재료" class="form-control" />
						            </div>
						            <button id="add_ingre" type="button" class="btn btn-outline-primary">+</button>
						            <button id="delete_ingre" type="button" class="btn btn-outline-primary">-</button>
						          </div>
						
						          <div class="mb-2">
						            <label><strong>도구</strong></label>
						            <div id="tools_input" class="gap-2">
						              <input type="text" name="steps[${status.index}].tools" placeholder="도구" class="form-control" />
						            </div>
						            <button id="add_tools" type="button" class="btn btn-outline-primary" onclick="addTools(this)">+</button>
					          	    <button id="delete_tools" type="button" class="btn btn-outline-primary" onclick="addTools(this)">-</button>
					          	 </div>
					
						          <div>
						            <label><strong>팁</strong></label>
						            <div id="tip_input" class="gap-2">
						              <input type="text" name="steps[${status.index}].tip" placeholder="팁" class="form-control" />
						            </div>
						            <button id="add_tip" type="button" class="btn btn-outline-primary" onclick="addTip(this)">+</button>
						            <button id="delete_tip" type="button" class="btn btn-outline-primary" onclick="addTip(this)">-</button>
						          </div>
					       </div>
					     </c:forEach>
					   </c:when>
					   
					   <c:otherwise>
				   		<div class="step border p-3 mb-3">
				   			<h5>STEP 1</h5>
					          	<button type="button" class="btn btn-danger btn-sm mb-2" onclick="removeBtn(this)">-</button>
								<input type="text" name="steps[0].content" placeholder="조리내용을 적어보세요!" class="form-control mb-2"/>
								
								<div>	
					          		<ul id="file"></ul>
					          		<button type="button" id="photo_btn">이미지 추가</button>
								</div>
								
						          <div class="mb-2">
						            <label><strong>재료</strong></label>
						            <div id="ingre_input" class="gap-2">
						              <input type="text" name="steps[0].ingredient" placeholder="재료" class="form-control" />
						            </div>
						            <button id="add_ingre" type="button" class="btn btn-outline-primary">+</button>
						            <button id="delete_ingre" type="button" class="btn btn-outline-primary">-</button>
						          </div>
						
						          <div class="mb-2">
						            <label><strong>도구</strong></label>
						            <div id="tools_input" class="gap-2">
						              <input type="text" name="steps[0].tools" placeholder="도구" class="form-control" />
						            </div>
						            <button id="add_tools" type="button" class="btn btn-outline-primary" onclick="addTools(this)">+</button>
					          	    <button id="delete_tools" type="button" class="btn btn-outline-primary" onclick="addTools(this)">-</button>
					          	 </div>
					
						          <div>
						            <label><strong>팁</strong></label>
						            <div id="tip_input" class="gap-2">
						              <input type="text" name="steps[0].tip" placeholder="팁" class="form-control" />
						            </div>
						            <button id="add_tip" type="button" class="btn btn-outline-primary" onclick="addTip(this)">+</button>
						            <button id="delete_tip" type="button" class="btn btn-outline-primary" onclick="addTip(this)">-</button>
						          </div>
				   			</div>
					   </c:otherwise> 
					</c:choose>
	      		</fieldset>
	
		      <div class="text-end mb-3">
		        <button type="button" id="add_step_btn" class="btn btn-secondary" >STEP 추가</button>
		      </div>
	
		      <div class="text-center">
		        <button id="send" type="submit" class="btn btn-success">제출</button>
		      </div>
	    </form>
	</div>
<script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
<jsp:include page="../include/footer.jsp" />
</body>
</html>