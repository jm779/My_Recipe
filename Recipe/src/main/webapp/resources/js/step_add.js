window.addEventListener("load", () => {
    let stepCount = document.querySelectorAll(".step").length;

    const addBtn = document.querySelector("#add_step_btn");
    const stepsContainer = document.querySelector("#steps");
    const template = document.querySelector("#step-template");

    addBtn.addEventListener("click", function () {
        stepCount++;

        const newStep = template.content.cloneNode(true);

        // step 제목 변경
        const title = newStep.querySelector(".step-title");
        if (title) title.textContent = "STEP " + stepCount;

        // name 변경
        const content = newStep.querySelector(".step-title");
        if (content) content.name = `steps[${stepCount}].content`;

        const ingredient = newStep.querySelector(".step-title");
        if (ingredient) ingredient.name = `steps[${stepCount}].ingredient`;

        const tools = newStep.querySelector(".step-title");
        if (tools) tools.name = `steps[${stepCount}].tools`;

        const tip = newStep.querySelector(".step-title");
        if (tip) tip.name = `steps[${stepCount}].tip`;

        stepsContainer.appendChild(newStep);
    });
});