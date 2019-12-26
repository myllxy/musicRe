/* 注册按钮状态切换为可用 */
function signup_enable_login() {
    const btn_login = $("#btn_login");
    if (btn_login.hasClass("lowin-btn-deprecated")) {
        btn_login.removeClass("lowin-btn-deprecated");
        btn_login.on("click", login);
        btn_login.addClass("lowin-btn");
    }
}

/* 注册按钮状态切换为不可用 */
function signup_disabled_login() {
    const btn_login = $("#btn_login");
    if (btn_login.hasClass("lowin-btn")) {
        btn_login.removeClass("lowin-btn");
        btn_login.off("click");
        btn_login.addClass("lowin-btn-deprecated");
    }
}

function login() {
    const name = $("#loginname").val();
    const password = $("#loginpassword").val();
    if (name !== "" && password !== "") {
        $.ajax({
            url: "/login",
            type: "POST",
            dataType: "json",
            data: {
                "name": name,
                "password": password
            },
            success: function (data) {
                if (data.msg) {
                    alert(data.msg);
                }
            },
            error: function (data) {
                alert(data);
            }
        });
    }
}

$(function () {
    $("#btn_login").on("click", login);
});

/* 当有任一input域为空时,注册按钮保持禁用状态 */
$(function () {
    change_btn();
    $("#loginname,#loginpassword").on("input propertychange", change_btn);
});

function change_btn() {
    const name = $("#loginname").val();
    const password = $("#loginpassword").val();
    if (name !== "" && password !== "") {
        signup_enable_login();
    } else if (name === "" || password === "") {
        signup_disabled_login();
    }
}