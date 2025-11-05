window.addEventListener("load", () => {
    const mpBtn = document.getElementById("mp_move");
    const div = document.querySelector("#choose_help");

    mpBtn.addEventListener("click", function(event){
        event.preventDefault();
        div.style.display = "block";
    })

});