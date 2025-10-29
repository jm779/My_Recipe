const appendImage = uploadFile => {
    const {title, uuid, filename} = uploadFile;

    const ul = document.querySelector("ul");

    const li = document.createElement("li");

    const div_1 = document.createElement("div");
    div_1.textContent = title;
    li.append(div_1);

    const div_2 = document.createElement("div");
    const img = document.createElement("img");
    img.setAttribute("src", `upload/${uuid}_${filename}`);
    div_2.append(img);
    li.append(div_2);

    ul.append(li);
};


window.addEventListener("load", () => {
    document.getElementById("upload").addEventListener("click", e => {
        const formData = new FormData();

        const title = document.querySelector("input[name='title']");
        const uploadFile = document.querySelector("input[name='uploadFile']");

        console.dir(uploadFile);

        formData.append("title", title.value);
        formData.append("uploadFile", uploadFile.files[0]);

        fetch("upload/ajax", {
            method: "POST",
            body: formData
        }).then(resp => {
            if(resp.ok)
                return resp.json();
        }).then(result => {
            if(result) {           
                alert("업로드 완료");
                appendImage(result);
            }
        }).catch(err => alert(err));
    });
});