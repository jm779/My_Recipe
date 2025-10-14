window.addEventListener("load", () => {
    document.getElementById("photo_btn").addEventListener("click", function(){
        const ul = document.getElementById("file");

        const li = document.createElement("li");
        li.style.listStyle = "none";

        const input = document.createElement("input");
        input.setAttribute("type", "file");
        input.setAttribute("name", "file");
        input.setAttribute("accept", "image/**");

        input.addEventListener("change", () => {
            const file = input.file[0];
            if(file){
                const reader = new FileReader();
                reader.onload = function(e){
                    const img = document.createElement("img");
                    img.src = e.target.result;
                    img.style.width = "150px";
                    img.style.height = "100px";
                    img.style.display = "block";
                    li.appendChild(img);
                };
                reader.readAsDataURL(file);
            }
        });

        li.append(input);
        ul.append(li);

        input.click();
    });
});