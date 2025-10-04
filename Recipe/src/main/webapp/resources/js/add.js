window.addEventListener("load", () => {
    document.getElementById("add_step_btn").addEventListener("click", function(){
        const template = document.getElementById(".step_template");

        const newSection = document.querySelector(".step");

        template.appendChild(newSection);
       
    });
});