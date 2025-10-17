window.addEventListener("load", () => {
    const ingreDiv = document.getElementById("ingre_input");
    const toolsDiv = document.getElementById("tools_input");
    const tipDiv = document.getElementById("tip_input");

    document.getElementById("add_ingre").addEventListener("click", function() {
        const ingre_input = document.createElement("input");
        ingre_input.setAttribute("type", "text");
        ingre_input.setAttribute("name", "steps[0].ingredient");
        ingre_input.setAttribute("placeholder", "재료");
        ingre_input.setAttribute("class", "form-control mt-2");
        ingreDiv.appendChild(ingre_input);
    });

    document.getElementById("delete_ingre").addEventListener("click", function() {
        const ingre_inputs = ingreDiv.getElementsByTagName("input");
        if (ingre_inputs.length > 1) {
            ingreDiv.removeChild(ingre_inputs[ingre_inputs.length - 1]);
        } else {
            alert("최소 하나의 재료를 적어주세요!");
        }
    });

    document.getElementById("add_tools").addEventListener("click", function() {
        const tools_input = document.createElement("input");
        tools_input.setAttribute("type", "text");
        tools_input.setAttribute("name", "steps[0].tools");
        tools_input.setAttribute("placeholder", "도구");
        tools_input.setAttribute("class", "form-control mt-2");
        toolsDiv.appendChild(tools_input);
    });

    document.getElementById("delete_tools").addEventListener("click", function() {
        const tools_inputs = toolsDiv.getElementsByTagName("input");
        if (tools_inputs.length > 1) {
            toolsDiv.removeChild(tools_inputs[tools_inputs.length - 1]);
        } else {
            alert("최소 하나의 도구를 적어주세요!");
        }
    });

    document.getElementById("add_tip").addEventListener("click", function() {
        const tip_input = document.createElement("input");
        tip_input.setAttribute("type", "text");
        tip_input.setAttribute("name", "steps[0].tip");
        tip_input.setAttribute("placeholder", "팁");
        tip_input.setAttribute("class", "form-control mt-2");
        tipDiv.appendChild(tip_input);
    });

    document.getElementById("delete_tip").addEventListener("click", function() {
        const tip_inputs = tipDiv.getElementsByTagName("input");
        if (tip_inputs.length > 1) {
            tipDiv.removeChild(tip_inputs[tip_inputs.length - 1]);
        } else {
            alert("최소 하나의 팁을 적어주세요!");
        }
    });
})