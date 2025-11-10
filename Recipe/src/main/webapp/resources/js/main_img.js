window.addEventListener("load", () => {
  const container = document.querySelector("#main_img_container");
  const uploadBtn = document.querySelector("#main_img");
  const input = document.getElementById("mainfile");

  function triggerUpload() {
    input.value = "";
    input.click();
  }

  function previewImage(file) {
    const reader = new FileReader();
    reader.onload = function (e) {
      const existingImg = container.querySelector("img.preview");
      if (existingImg) existingImg.remove();

      const img = document.createElement("img");
      img.src = e.target.result;
      img.classList.add("preview");
      Object.assign(img.style, {
        position: "absolute",
        top: "0",
        left: "0",
        width: "100%",
        height: "100%",
        objectFit: "contain",
        cursor: "pointer",
        zIndex: "1",
      });

      img.addEventListener("click", () => uploadBtn.click());
      container.appendChild(img);
    };
    reader.readAsDataURL(file);
  }

  input.addEventListener("change", () => {
    const file = input.files[0];
    if (file) previewImage(file);
  });

  uploadBtn.addEventListener("click", triggerUpload);
});