window.addEventListener("load", () => {
    const btn = document.querySelector("#btn-check");
    btn.addEventListener("click", () => {
        const userid = document.querySelector("input[name='userid']").value;
        fetch(`/member/idCheck?userid=${userid}`)
            .then(res => res.text())
            .then(result => alert(result));
    });
});