window.addEventListener("load", () => {
    const container = document.querySelector("#main_img_container");
    const uploadBtn = document.querySelector("#main_img");
    const reselectBtn = document.querySelector("#reselect_img");
    const hint = container.querySelector("#img_change");
    const input = document.getElementById("mainfile");

    function triggerUpload(){
        input.click();
    }
    
    function previewImage(file){
        const reader = new FileReader();
            reader.onload = function (e) {
                const existingImg = container.querySelector("img.preview");
                if (existingImg) {
                    existingImg.remove();
                }

                const img = document.createElement("img");
                img.src = e.target.result;
                img.classList.add("preview");
                img.style.position = "absolute";
                img.style.top = "0";
                img.style.left = "0";
                img.style.width = "100%";
                img.style.height = "100%";
                img.style.objectFit = "cover";
                img.style.cursor = "pointer";
                img.style.zIndex = "1";

                img.addEventListener("click", () => {
                    uploadBtn.click();
                });

                container.appendChild(img);
                uploadBtn.style.display = "none";
                reselectBtn.style.display = "block";

                if (hint) {
                    hint.style.backgroundColor = "rgba(255, 255, 255, 0.6)";
                    hint.style.padding = "5px 10px";
                    hint.style.borderRadius = "5px";
                    hint.style.zIndex = "0";
                }
            };
            reader.readAsDataURL(file);
        }
    
        input.addEventListener("click", () => {
            const file = input.files[0];
            if(file){
                previewImage(file);
            }
        });

    uploadBtn.addEventListener("click", triggerUpload);
    reselectBtn.addEventListener("click", triggerUpload);

    //초기, 기존 이미지가 있으면 버튼 상태 조정
    const existingImg = container.querySelector("img.preview");
    if (existingImg) {
        uploadBtn.style.display = "none";
        reselectBtn.style.display = "block";
    }
});