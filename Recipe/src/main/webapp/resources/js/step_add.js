// STEP 삭제
window.removeBtn = function (btn) {
  const stepElement = btn.closest(".step");
  if (stepElement) {
    stepElement.remove();
    renumberSteps();
  }
};

// STEP 번호 및 name 속성 재정렬
function renumberSteps() {
  const steps = document.querySelectorAll(".step");
  steps.forEach((step, index) => {
    const title = step.querySelector(".step-title");
    if (title) title.textContent = "STEP " + (index + 1);

    const content = step.querySelector(".step-content");
    if (content) content.name = `steps[${index}].content`;

    step.querySelectorAll(".step-ingredient").forEach((el) => {
      el.name = `steps[${index}].ingredient`;
    });

    step.querySelectorAll(".step-tools").forEach((el) => {
      el.name = `steps[${index}].tools`;
    });

    step.querySelectorAll(".step-tip").forEach((el) => {
      el.name = `steps[${index}].tip`;
    });

    step.querySelectorAll(".step-file-input").forEach((el) => {
      el.name = `stepFiles[${index}]`;
    });
  });
}

// STEP 이미지 미리보기
function bindStepImagePreview(stepElement) {
  const fileInput = stepElement.querySelector(".step-file-input");
  const previewContainer = stepElement.querySelector(".file-list");
  const photoBtn = stepElement.querySelector(".step-photo-btn");

  if (!fileInput || !previewContainer || !photoBtn) return;

  photoBtn.addEventListener("click", () => {
    fileInput.value = "";
    fileInput.click();
  });

  fileInput.addEventListener("change", () => {
    const file = fileInput.files[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = function (e) {
      previewContainer.innerHTML = "";
      const img = document.createElement("img");
      img.src = e.target.result;
      img.style.width = "100%";
      img.style.height = "250px";
      img.style.objectFit = "contain";
      img.style.marginTop = "10px";
      previewContainer.appendChild(img);
    };
    reader.readAsDataURL(file);
  });
}

// 재료/도구/팁 버튼 연결
function bindStepControls(stepElement) {
  const ingreDiv = stepElement.querySelector(".ingre_input");
  const toolsDiv = stepElement.querySelector(".tools_input");
  const tipDiv = stepElement.querySelector(".tip_input");

  const addIngreBtn = stepElement.querySelector("#add_ingre");
  const deleteIngreBtn = stepElement.querySelector("#delete_ingre");
  const addToolsBtn = stepElement.querySelector("#add_tools");
  const deleteToolsBtn = stepElement.querySelector("#delete_tools");
  const addTipBtn = stepElement.querySelector("#add_tip");
  const deleteTipBtn = stepElement.querySelector("#delete_tip");

  if (addIngreBtn) {
    addIngreBtn.addEventListener("click", () => {
      const inputCol = document.createElement("div");
      inputCol.className = "col-3 mb-2";
      const input = document.createElement("input");
      input.type = "text";
      input.placeholder = "재료";
      input.className = "form-control";
      inputCol.appendChild(input);
      ingreDiv.appendChild(inputCol);
    });
  }

  if (deleteIngreBtn) {
    deleteIngreBtn.addEventListener("click", () => {
      const cols = ingreDiv.getElementsByClassName("col-3");
      if (cols.length > 1) ingreDiv.removeChild(cols[cols.length - 1]);
      else alert("최소 하나의 재료를 적어주세요!");
    });
  }

  if (addToolsBtn) {
    addToolsBtn.addEventListener("click", () => {
      const inputCol = document.createElement("div");
      inputCol.className = "col-3 mb-2";
      const input = document.createElement("input");
      input.type = "text";
      input.placeholder = "도구";
      input.className = "form-control";
      inputCol.appendChild(input);
      toolsDiv.appendChild(inputCol);
    });
  }

  if (deleteToolsBtn) {
    deleteToolsBtn.addEventListener("click", () => {
      const cols = toolsDiv.getElementsByClassName("col-3");
      if (cols.length > 1) toolsDiv.removeChild(cols[cols.length - 1]);
      else alert("최소 하나의 도구를 적어주세요!");
    });
  }

  if (addTipBtn) {
    addTipBtn.addEventListener("click", () => {
      const inputCol = document.createElement("div");
      inputCol.className = "col-3 mb-2";
      const input = document.createElement("input");
      input.type = "text";
      input.placeholder = "팁";
      input.className = "form-control";
      inputCol.appendChild(input);
      tipDiv.appendChild(inputCol);
    });
  }

  if (deleteTipBtn) {
    deleteTipBtn.addEventListener("click", () => {
      const cols = tipDiv.getElementsByClassName("col-3");
      if (cols.length > 1) tipDiv.removeChild(cols[cols.length - 1]);
      else alert("최소 하나의 팁을 적어주세요!");
    });
  }
}

// 초기화 및 STEP 추가
window.addEventListener("load", () => {
  const addBtn = document.querySelector("#add_step_btn");
  const stepsContainer = document.querySelector("#steps");
  const template = document.querySelector("#step-template");

  // STEP 1 포함 전체에 기능 적용
  document.querySelectorAll(".step").forEach((step) => {
    bindStepControls(step);
    bindStepImagePreview(step);
  });

  // STEP 추가 버튼
  if (addBtn) {
    addBtn.addEventListener("click", function () {
      const newStep = template.content.cloneNode(true);
      stepsContainer.appendChild(newStep);
      renumberSteps();

      const addedStep = stepsContainer.lastElementChild;
      bindStepControls(addedStep);
      bindStepImagePreview(addedStep);
    });
  }
});