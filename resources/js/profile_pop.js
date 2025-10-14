window.addEventListener("load", () => {
    const profile_box = document.getElementById("profile_box");

    const profile_img = document.getElementById("profile_img");

    const profile_menu = document.getElementById("profile_menu");


    profileImg.addEventListener("click", function () {
    if (profile_menu.style.display === "none" || profile_menu.style.display === "") {
      profile_menu.style.display = "block";
    } else {
      profile_menu.style.display = "none";
    }
});

    document.addEventListener("click", function (event) {
        if (!container.contains(event.target)) {
        profileMenu.style.display = "none";
        }
    });
});