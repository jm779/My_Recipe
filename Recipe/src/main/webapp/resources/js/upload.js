window.addEventListener("load", () => {
    const ingreDiv = document.getElementById("ingre_input");
    const toolsDiv = document.getElementById("tools_input");
    const tipDiv = document.getElementById("tip_input");

    document.getElementById("add_ingre").addEventListener("click", function () {
        const inputCol = document.createElement("div");
        inputCol.className = "col-3 mb-2"; // 한 줄에 4개씩

        const input = document.createElement("input");
        input.type = "text";
        input.name = "steps[0].ingredient";
        input.placeholder = "재료";
        input.className = "form-control";

        inputCol.appendChild(input);
        ingreDiv.appendChild(inputCol);
    });


    document.getElementById("delete_ingre").addEventListener("click", function() {
        const cols = ingreDiv.getElementsByClassName("col-3");
        if (cols.length > 1) {
            ingreDiv.removeChild(cols[cols.length - 1]);
        } else {
            alert("최소 하나의 재료를 적어주세요!");
        }
    });

    document.getElementById("add_tools").addEventListener("click", function() {
        const inputCol = document.createElement("div");
        inputCol.className = "col-3 mb-2"; // 한 줄에 4개씩

        const input = document.createElement("input");
        input.type = "text";
        input.name = "steps[0].tools";
        input.placeholder = "도구";
        input.className = "form-control";

        inputCol.appendChild(input);
        toolsDiv.appendChild(inputCol);
    });

    document.getElementById("delete_tools").addEventListener("click", function() {
        const cols = toolsDiv.getElementsByClassName("col-3");
        if (cols.length > 1) {
            toolsDiv.removeChild(cols[cols.length - 1]);
        } else {
            alert("최소 하나의 도구를 적어주세요!");
        }
    });

    document.getElementById("add_tip").addEventListener("click", function() {
        const inputCol = document.createElement("div");
        inputCol.className = "col-3 mb-2";

        const input = document.createElement("input");
        input.type = "text";
        input.name = "steps[0].tip";
        input.placeholder = "팁";
        input.className = "form-control";

        inputCol.appendChild(input);
        tipDiv.appendChild(inputCol);
    });

    document.getElementById("delete_tip").addEventListener("click", function() {
        const cols = tipDiv.getElementsByClassName("col-3");
        if (cols.length > 1) {
            tipDiv.removeChild(cols[cols.length - 1]);
        } else {
            alert("최소 하나의 팁을 적어주세요!");
        }
    });
})