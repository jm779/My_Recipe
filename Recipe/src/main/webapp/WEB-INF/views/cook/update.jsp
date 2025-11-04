<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>레시피 수정</title>
  <script src="${pageContext.request.contextPath}/resources/js/img_add.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/main_img.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/step_add.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  
</head>

<!-- 푸터고정 -->
<body class="d-flex flex-column min-vh-100">

  <main class="flex-grow-1">
    <div class="container my-2">
      <jsp:include page="../include/head.jsp" />
    </div>

    <div class="container my-5" style="max-width: 800px;">
      <div class="d-flex text-center mb-4">
        <a href="${pageContext.request.contextPath}/">
          <img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="icon" style="height: 60px;">
        </a>
        <h3 style="margin-left: 12px; margin-top: 10px;">레시피 수정</h3>
      </div>

      <form method="post" action="${pageContext.request.contextPath}/cook/update/${item.recipeid}" enctype="multipart/form-data">
        <div class="mb-3">
          <label class="form-label"><strong>레시피 제목</strong></label>
          <input type="text" name="recipetitle" class="form-control" value="${item.recipetitle}" />
        </div>

        <div class="mb-3">
          <label class="form-label"><strong>레시피 소개</strong></label>
          <input type="text" name="comment" class="form-control" value="${item.comment}" />
        </div>

		<!-- 대표사진 -->
		<div class="mb-3">
			<label><strong>대표사진</strong></label>
			<div id="main_img_container" class="img_box" style="width: 450px; height: 250px; background-color: #e0e0e0; margin-bottom: 10px; position: relative; overflow: hidden;">	  
			  <c:if test="${not empty item.mainimagepath}">
	    		<img src="${pageContext.request.contextPath}${item.mainimagepath}" class="preview"
	         		style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; z-index: 1; cursor: pointer;" />
	  		  </c:if>
			  <input type="file" name="mainfile" id="mainfile" style="display: none;" />
			  <!-- 대표사진 업로드 버튼 -->
			  <button id="main_img" type="button" style="width:50px; height:50px; border-radius: 40px; position: absolute; top: 35%; left: 43%; z-index: 2;">
			    <p style="font-size: 32px; padding-bottom: 10px;"></p>
			  </button>
			  <!-- 재선택 버튼 (초기에는 숨김) -->
			  <button id="reselect_img" type="button" style="position: absolute; bottom: 10px; right: 10px; z-index: 3; display: none;" class="btn btn-sm btn-light">
			    사진 다시 선택                
			  </button>	
			  <!-- 대표사진 안내텍스트 -->
			  <div class="d-flex" style="width: 110px; height: 35px; position: absolute; top: 10px; left: 10px; background-color: gray; justify-content: center; padding-top: 5px; z-index: 4;">
			    <img src="${pageContext.request.contextPath}/resources/image/camera.png" alt="camera_icon" 
			      style="width: 20px; height: 20px; margin-top: 2px;">
			    <p style="color: #fff; margin-left: 7px;">대표사진</p>          
			  </div>
			</div>
		</div>
		
        <div class="mb-3">
          <label for="cook-url" class="form-label"><strong>레시피 동영상 링크</strong></label>
          <input type="url" id="cook-url" name="link" class="form-control" value="${item.link}" />
        </div>

        <!-- 요리 순서 STEP -->
        <fieldset id="steps" class="mb-1">
          <legend class="fw-bold">요리순서</legend>

          <c:forEach var="step" items="${steps}" varStatus="status">
            <div class="step border p-3 mb-3">
              <h5>STEP ${status.index + 1}</h5>
              <button type="button" class="btn btn-danger btn-sm mb-2" onclick="removeBtn(this)">-</button>

              <input type="text" name="steps[${status.index}].content" class="form-control mb-2" value="${step.content}" placeholder="조리내용을 적어보세요!" />
              <input type="hidden" name="steps[${status.index}].imagepath" value="${step.imagepath}" />

              <div>
                <ul id="file"></ul>
                <input type="file" name="file[${status.index}]" id="fileInput${status.index}" multiple style="display: none;" />
                <img src="${pageContext.request.contextPath}${step.imagepath}" alt="요리 이미지" style="width: 250px;" height="250px;" />
                <button type="button" id="photo_btn">이미지 변경</button>
              </div>

              <div class="mb-2">
                <label><strong>재료</strong></label>
                <div id="ingre_input" class="gap-2">
                  <input type="text" name="steps[${status.index}].ingredient" class="form-control" value="${step.ingredient}" placeholder="재료" />
                </div>
                <button id="add_ingre" type="button" class="btn btn-outline-primary">+</button>
                <button id="delete_ingre" type="button" class="btn btn-outline-primary">-</button>
              </div>

              <div id="tools_input" class="mb-2">
                <label><strong>도구</strong></label>
                <div class="gap-2">
                  <input type="text" name="steps[${status.index}].tools" class="form-control" value="${step.tools}" placeholder="도구" />
                </div>
                <button id="add_tools" type="button" class="btn btn-outline-primary" onclick="addTools(this)">+</button>
                <button id="delete_tools" type="button" class="btn btn-outline-primary" onclick="addTools(this)">-</button>
              </div>

              <div>
                <label><strong>팁</strong></label>
                <div id="tip_input" class="gap-2">
                  <input type="text" name="steps[${status.index}].tip" class="form-control" value="${step.tip}" placeholder="팁" />
                </div>
                <button id="add_tip" type="button" class="btn btn-outline-primary" onclick="addTip(this)">+</button>
                <button id="delete_tip" type="button" class="btn btn-outline-primary" onclick="addTip(this)">-</button>
              </div>
            </div>
          </c:forEach>
        </fieldset>

        <div class="text-end mb-3">
          <button type="button" id="add_step_btn" class="btn btn-secondary">STEP 추가</button>
        </div>

        <div class="text-center">
          <button id="send" type="submit" class="btn btn-success">수정 완료</button>
        </div>
      </form>
    </div>
  </main>
  <script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
<jsp:include page="../include/footer.jsp" />
</body>
</html>