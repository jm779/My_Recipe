<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>레시피 등록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="../include/head.jsp" />
<main class="flex-grow-1">
  <div class="container my-5" style="max-width: 800px; margin-left: 430px;">
    <div class="d-flex text-center mb-4">
      <img src="${pageContext.request.contextPath}/resources/image/add_recipe_icon.png" alt="icon" style="height: 50px;">
      <h3 style="margin-left: 12px; margin-top: 10px;">레시피 작성하기</h3>
    </div>

    <form method="post" action="${pageContext.request.contextPath}/cook/add" enctype="multipart/form-data">
      <div class="mb-3">
        <label class="form-label"><strong>레시피 제목</strong></label>
        <input type="text" name="recipetitle" class="form-control" placeholder="레시피 제목"/>
      </div>

      <div class="mb-3">
        <label class="form-label"><strong>레시피 소개</strong></label>
        <input type="text" name="rcomment" class="form-control" placeholder="간단한 소개를 적어보세요!"/>
      </div>

      <!-- 대표사진 -->
      <div class="mb-3">
        <label class="form-label">대표사진</label>
        <div id="main_img_container" style="width: 500px; height: 300px; background-color: #e0e0e0; margin-bottom: 10px; position: relative; overflow: hidden;">
          <input type="file" name="mainfile" id="mainfile" style="display: none;" />
          <button id="main_img" type="button" style="width:50px; height:50px; border-radius: 40px; position: absolute; top: 35%; left: 43%;">
            <p style="font-size: 32px; padding-bottom: 10px;">+</p>
          </button>
        </div>
      </div>

      <div class="mb-3">
        <label for="cook-url" class="form-label"><strong>레시피 동영상 링크</strong></label>
        <input type="url" id="cook-url" name="link" placeholder="https://example.com" class="form-control" />
      </div>

      <fieldset id="steps" class="mb-1">
        <legend class="fw-bold">요리순서</legend>

        <!-- STEP 1 -->
        <div class="step border p-3 mb-3">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h5 class="step-title">STEP 1</h5>
            <button type="button" class="btn btn-danger btn-sm step_del_Btn">-</button>
          </div>

          <input type="text" name="steps[0].content" placeholder="조리내용을 적어보세요!" class="form-control mb-2"/>

          <div class="mb-2">
            <label><strong>이미지</strong></label>
            <ul id="file"></ul>
            <input type="file" name="stepFiles[]" class="step-file-input" style="display: none;" />
            <button type="button" class="btn btn-light btn-sm border-0 step-photo-btn">이미지 추가</button>
            <button type="button" class="btn btn-danger btn-sm mb-2">-</button>
          </div>

          <div class="mb-2">
            <label><strong>재료</strong></label>
            <div class="gap-2">
              <input type="text" name="steps[0].ingredient" placeholder="재료" class="form-control" />
            </div>
            <button type="button" class="btn btn-outline-primary">+</button>
            <button type="button" class="btn btn-outline-primary">-</button>
          </div>

          <div class="mb-2">
            <label><strong>도구</strong></label>
            <div class="gap-2">
              <input type="text" name="steps[0].tools" placeholder="도구" class="form-control" />
            </div>
            <button type="button" class="btn btn-outline-primary">+</button>
            <button type="button" class="btn btn-outline-primary">-</button>
          </div>

          <div>
            <label><strong>팁</strong></label>
            <div class="gap-2">
              <input type="text" name="steps[0].tip" placeholder="팁" class="form-control" />
            </div>
            <button type="button" class="btn btn-outline-primary">+</button>
            <button type="button" class="btn btn-outline-primary">-</button>
          </div>
        </div>
        <!-- STEP 템플릿 -->
        <template id="step-template">
          <div class="step border p-3 mb-3">
            <div class="d-flex justify-content-between align-items-center mb-2">
              <h5 class="step-title">STEP</h5>
              <button type="button" class="btn btn-danger btn-sm" onclick="removeBtn(this)">-</button>
            </div>

            <input type="text" class="form-control mb-2" placeholder="조리내용을 적어보세요!" />

            <div class="mb-2">
              <label><strong>이미지</strong></label>
              <ul class="file-list"></ul>
              <input type="file" class="step-file-input" style="display: none;" />
              <button type="button" class="btn btn-light btn-sm border-0 step-photo-btn">이미지 추가</button>
            </div>

            <div class="mb-2">
              <label><strong>재료</strong></label>
              <div class="ingre_input row gap-2">
                <input type="text" class="step-ingredient form-control" placeholder="재료" />
              </div>
              <button type="button" class="btn btn-outline-primary" id="add_ingre">+</button>
              <button type="button" class="btn btn-outline-primary" id="delete_ingre">-</button>
            </div>

            <div class="mb-2">
              <label><strong>도구</strong></label>
              <div class="tools_input row gap-2">
                <input type="text" class="step-tools form-control" placeholder="도구" />
              </div>
              <button type="button" class="btn btn-outline-primary" id="add_tools">+</button>
              <button type="button" class="btn btn-outline-primary" id="delete_tools">-</button>
            </div>

            <div class="mb-2">
              <label><strong>팁</strong></label>
              <div class="tip_input row gap-2">
                <input type="text" class="step-tip form-control" placeholder="팁" />
              </div>
              <button type="button" class="btn btn-outline-primary" id="add_tip">+</button>
              <button type="button" class="btn btn-outline-primary" id="delete_tip">-</button>
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
<jsp:include page="../include/footer.jsp" />
<script src="${pageContext.request.contextPath}/resources/js/main_img.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/step_add.js"></script>
</body>
</html>