<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>레시피 등록</title>
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
        <h3 style="margin-left: 12px; margin-top: 10px;">레시피 작성하기</h3>
      </div>

      <form method="post" action="${pageContext.request.contextPath}/cook/add" enctype="multipart/form-data"
      		style="position: relative;">
        <div class="mb-3">
          <label class="form-label"><strong>레시피 제목</strong></label>
          <input type="text" name="recipetitle" class="form-control" placeholder="레시피 제목"/>
        </div>

        <div class="mb-3">
          <label class="form-label"><strong>레시피 소개</strong></label>
          <input type="text" name="comment" class="form-control" placeholder="간단한 소개를 적어보세요!"/>
        </div>
       
    	<!-- 대표사진 -->
    	<div class="mb-3">
    		<label class="form-label">대표사진</label>
    			<c:if test="${not empty item.mainimagepath}">
	    			<div class="img_box">
						<img src="${pageContext.request.contextPath}${item.mainimagepath}" alt="대표사진" />
					</div>
    			</c:if>
    	</div>
    	
		<div id="main_img_container" style="width: 450px; height: 250px; background-color: #e0e0e0; margin-bottom: 10px; position: relative; overflow: hidden;">	  
		  <!-- 숨겨진 대표 이미지 업로드 input -->
		  <input type="file" name="mainfile" id="mainfile" style="display: none;" />
		  
		  
		  <!-- 안내 문구 (이미지 아래) -->
		  <div id="img_change" style="position: absolute; bottom: 10px; right: 23px; margin-bottom: 30px;
		  		color: #555; font-size: 14px; z-index: 0;">
		    	이미지를 선택 후 재클릭 시, 다른 이미지로 변경이 가능합니다.
		  </div>
		  <!-- 대표사진 업로드 버튼 -->
		  <button id="main_img" type="button" style="width:50px; height:50px; border-radius: 40px; position: absolute; top: 35%; left: 43%; z-index: 2;">
		    <p style="font-size: 32px; padding-bottom: 10px;">+</p>
		  </button>
		  <!-- 재선택 버튼 (초기에는 숨김) -->
		  <button id="reselect_img" type="button" style="position: absolute; bottom: 10px; right: 10px; z-index: 3; display: none;" class="btn btn-sm btn-light">
		    이미지 클릭 시, 사진 재선택
		  </button>	
		  <!-- 대표사진 안내텍스트 -->
		  <div class="d-flex" style="width: 110px; height: 35px; position: absolute; top: 10px; left: 10px; background-color: gray; justify-content: center; padding-top: 5px; z-index: 4;">
		    <img src="${pageContext.request.contextPath}/resources/image/camera.png" alt="camera_icon"
		      style="width: 20px; height: 20px; margin-top: 2px;">
		    <p style="color: #fff; margin-left: 7px;">대표사진</p>     
		  </div>
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
                	<h5 class="step-title">STEP ${status.index + 1}</h5>
                  	<div class="d-flex">
	                  	<button type="button" class="btn btn-danger btn-sm mb-2 step_del_Btn">
	                  	 -</button>
                  	</div>	
                  <input type="text" name="steps[${status.index}].content" placeholder="조리내용을 적어보세요!" class="form-control mb-2"/>

                  <div>
                    <ul id="file"></ul>
                    <button type="button" class="photo_btn">이미지 추가</button>
                  </div>

                  <div class="mb-2">
                    <label><strong>재료</strong></label>
                    <div id="ingre_input" class="row gap-2">
                    	<div class="col-3 mb-2">
                      		<input type="text" name="steps[${status.index}].ingredient" placeholder="재료" class="form-control" />
                    	</div>
                    </div>
                    <button id="add_ingre" type="button" class="btn btn-outline-primary">+</button>
                    <button id="delete_ingre" type="button" class="btn btn-outline-primary">-</button>
                  </div>

                  <div class="mb-2">
                    <label><strong>도구</strong></label>
                    <div id="tools_input" class="row gap-2">
                    	<div class="col-3 mb-2">
                      		<input type="text" name="steps[${status.index}].tools" placeholder="도구" class="form-control" />
                    	</div>
                    </div>
                    <button id="add_tools" type="button" class="btn btn-outline-primary" onclick="addTools(this)">+</button>
                    <button id="delete_tools" type="button" class="btn btn-outline-primary" onclick="addTools(this)">-</button>
                  </div>

                  <div>
                    <label><strong>팁</strong></label>
                    <div id="tip_input" class="row gap-2">
                    	<div class="col-3 mb-2">
                      		<input type="text" name="steps[${status.index}].tip" placeholder="팁" class="form-control" />
                    	</div>
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

				<!-- STEP 이미지 업로드 input 추가 -->
				<input type="file" name="stepFiles[]" class="form-control mb-2" />
				
                <div>
                  <ul id="file"></ul>
                  <button type="button" id="photo_btn">이미지 추가</button>
                  <button id="delete_img" type="button" class="btn btn-danger btn-sm mb-2">-</button>
                </div>

                <div class="mb-2">
                  <label><strong>재료</strong></label>
                  <div id="ingre_input" class="gap-2">
                    <input type="text" name="steps[].ingredient" placeholder="재료" class="form-control" />
                  </div>
                  <button id="add_ingre" type="button" class="btn btn-outline-primary">+</button>
                  <button id="delete_ingre" type="button" class="btn btn-outline-primary">-</button>
                </div>

                <div class="mb-2">
                  <label><strong>도구</strong></label>
                  <div id="tools_input" class="gap-2">
                    <input type="text" name="steps[].tools" placeholder="도구" class="form-control" />
                  </div>
                  <button id="add_tools" type="button" class="btn btn-outline-primary" onclick="addTools(this)">+</button>
                  <button id="delete_tools" type="button" class="btn btn-outline-primary" onclick="addTools(this)">-</button>
                </div>

                <div>
                  <label><strong>팁</strong></label>
                  <div id="tip_input" class="gap-2">
                    <input type="text" name="steps[].tip" placeholder="팁" class="form-control" />
                  </div>
                  <button id="add_tip" type="button" class="btn btn-outline-primary" onclick="addTip(this)">+</button>
                  <button id="delete_tip" type="button" class="btn btn-outline-primary" onclick="addTip(this)">-</button>
                </div>
              </div>
            </c:otherwise>      
          </c:choose>
         <!-- step 추가 시, 추가 될 step -->
		  <template id="step-template">
			  <div class="step border p-3 mb-3">
			    <h5 class="step-title">STEP</h5>
			    <button type="button" class="btn btn-danger btn-sm mb-2" onclick="removeBtn(this)">-</button>
			
			    <!-- 조리 내용 -->
			    <input type="text" name="steps[].content" placeholder="조리내용을 적어보세요!" class="step-content form-control mb-2" />
			
			    <!-- 이미지 영역 -->
			    <div>
			      <ul class="file-list"></ul>
			      <button type="button" class="photo_btn">이미지 추가</button>
			      <button type="button" class="btn btn-danger btn-sm mb-2">-</button>
			    </div>
			
			    <!-- 재료 -->
			    <div class="mb-2">
			      <label><strong>재료</strong></label>
			      <div class="ingre-input row gap-2">
			        <input type="text" name="steps[].ingredient" placeholder="재료" class="step-ingredient form-control" />
			      </div>
			      <button type="button" class="btn btn-outline-primary">+</button>
			      <button type="button" class="btn btn-outline-primary">-</button>
			    </div>
			
			    <!-- 도구 -->
			    <div class="mb-2">
			      <label><strong>도구</strong></label>
			      <div class="tools-input row gap-2">
			        <input type="text" name="steps[].tools" placeholder="도구" class="step-tools form-control" />
			      </div>
			      <button type="button" class="btn btn-outline-primary" onclick="addTools(this)">+</button>
			      <button type="button" class="btn btn-outline-primary" onclick="addTools(this)">-</button>
			    </div>
			
			    <!-- 팁 -->
			    <div>
			      <label><strong>팁</strong></label>
			      <div class="tip-input row gap-2">
			        <input type="text" name="steps[].tip" placeholder="팁" class="step-tip form-control" />
			      </div>
			      <button type="button" class="btn btn-outline-primary" onclick="addTip(this)">+</button>
			      <button type="button" class="btn btn-outline-primary" onclick="addTip(this)">-</button>
			    </div>
			  </div>
		</template>

        </fieldset>

        <div class="text-end mb-3">
          <button type="button" id="add_step_btn" class="btn btn-secondary">STEP 추가</button>
        </div>

        <div class="text-center">
          <button id="send" type="submit" class="btn btn-success">제출</button>
          <a href="/member/mypage" class="btn btn-outline-secondary mx-2">목록</a>
        </div>
      </form>
    </div>
  </main>

  <script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
<jsp:include page="../include/footer.jsp" />
</body>

</html>