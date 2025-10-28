window.addEventListener("load", () => {
    document.querySelector("#check_btn").addEventListener("click", function(){
        const input = document.querySelector("input[name='userid']"); 
        const userId = input.value.trim();

        if (userId === "") {
            alert("아이디를 입력해주세요.");
            input.focus();
            return;
        }

        fetch(`/check_id/${userId}`)
            .then(response => response.text())
            .then(result => {
                console.log("서버 응답:", result);
                

                if (result === "OK") {
                    alert("사용 가능한 아이디 입니다.");
                } else if (result === "FAIL"){
                    alert("이미 사용 중인 아이디입니다.");
                } else {
                    alert("예상치 못한 응답: " + result);
                }
            })
            .catch(error => {
                console.error("중복확인 요청 실패:", error);
                alert("서버 오류가 발생했습니다.")
            });
    });
});