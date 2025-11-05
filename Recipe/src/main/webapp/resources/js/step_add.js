window.removeBtn = function (btn) {
	        const stepElement = btn.closest(".step");
	        if (stepElement) {
	            stepElement.remove();
                renumberSteps();
	        }
};

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
  });
}



window.addEventListener("load", () => {
    let stepCount = document.querySelectorAll(".step").length;

    const addBtn = document.querySelector("#add_step_btn");
    const stepsContainer = document.querySelector("#steps");
    const template = document.querySelector("#step-template");

    addBtn.addEventListener("click", function () {
        // const stepCount = document.querySelectorAll(".step").length +  1;
        const newStep = template.content.cloneNode(true);
        stepsContainer.appendChild(newStep);
        renumberSteps();

        // step 제목 변경
        const title = newStep.querySelector(".step-title");
        if (title) title.textContent = "STEP " + stepCount;

        // name 변경
        const content = newStep.querySelector(".step-content");
        if (content) content.name = `steps[${stepCount}].content`;

        const ingredient = newStep.querySelector(".step-ingredient");
        if (ingredient) ingredient.name = `steps[${stepCount}].ingredient`;

        const tools = newStep.querySelector(".step-tools");
        if (tools) tools.name = `steps[${stepCount}].tools`;

        const tip = newStep.querySelector(".step-tip");
        if (tip) tip.name = `steps[${stepCount}].tip`;

        stepsContainer.appendChild(newStep);
    });
});