window.addEventListener("load", () => {
    
    document.getElementById("add_step_btn").addEventListener("click", function(){
        const fieldset = document.createElement("fieldset");

        fieldset.append(stepField);
    })


});