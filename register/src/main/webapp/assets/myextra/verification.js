/* 如果邮箱验证结果正确就为true,格式错误则为false */
let eamilresultBoolean = true;
/* 如果用户名验证结果正确就为true,格式错误则为false */
let nameresultBoolean = true;
/* 如果密码验证结果正确就为true,格式错误则为false */
let pwdresultBoolean = true;
/* 用于登录注册界面跳转的功能 */
Auth.init({
    login_url: '#login',
    forgot_url: '#forgot',
    register_url: '#register'
});

/* 注册按钮状态切换为可用 */
function signup_enable() {
    const btn_regist = $("#btn_regist");
    if (btn_regist.hasClass("lowin-btn-deprecated")) {
        btn_regist.removeClass("lowin-btn-deprecated");
        btn_regist.on("click", register);
        btn_regist.addClass("lowin-btn")
    }
}

/* 注册按钮状态切换为不可用 */
function signup_disabled() {
    const btn_regist = $("#btn_regist");
    if (btn_regist.hasClass("lowin-btn")) {
        btn_regist.removeClass("lowin-btn");
        btn_regist.off("click");
        btn_regist.addClass("lowin-btn-deprecated");
    }
}

/* 注册用户 */
function register() {
    const name = $("#name").val();
    const email = $("#email").val();
    const password = $("#password").val();
    if (name !== "" && email !== "" && password !== "") {
        $.ajax({
            url: "/user/register",
            type: "POST",
            dataType: "json",
            data: {
                "name": name,
                "email": email,
                "password": password
            },
            success: function (data) {
                for (const i in data) {
                    const result = data[i];
                    if (i === "register_result") {
                        alert(result);
                        /* 注册成功后清空表单数据防止跳转到登录页面再点击跳回来时注册信息还在 */
                        $("#register")[0].reset();
                        /* 同时清空name、email等input下面生成的描述语句 */
                        $("#namep,#emailp,#password").remove();
                        /* 同时跳转到登录页面 */
                        Auth.brand();
                        Auth.loginNo();
                    }
                }
            },
            error: function (data) {
                alert(data);
            }
        });
    }
}

/* 验证注册信息是否错误 */
function verificationformat(name, email, password, reg) {
    if (name !== "" && name.length > 6) {
        $("#namep").remove();
        $("#name").after('<p id="namep">用户名过长</p>');
        nameresultBoolean = false;
        signup_disabled();
    }
    if (email !== "" && !reg.test(email)) {
        $("#email").after('<p id="emailp">邮箱格式输入错误</p>');
        /*1.更改按键颜色
        * 2.设置按键为不可以点击(即解除或者更换绑定事件)
        * 3.设置变量eamilresultBoolean为false以后要用
        * */
        eamilresultBoolean = false;
        signup_disabled();
    }
    if (password !== "" && password.length > 8) {
        $("#password").after('<p id="passwordp">密码过长</p>');
        pwdresultBoolean = false;
        signup_disabled();
    }
}

/* 验证注册信息是否重复 */
function verificationRepeat() {
    const name = $("#name").val();
    const email = $("#email").val();
    const password = $("#password").val();
    /* 每次执行这个函数都清空name、email等input下面生成的描述语句 */
    $("#namep,#emailp,#passwordp").remove();
    /* 重置三者的值 */
    eamilresultBoolean = true;
    nameresultBoolean = true;
    pwdresultBoolean = true;
    /* 正则表达式：
     * 字母或数字开始可以加下划线或者"-",然后是@,然后是任意字母或字符串,然后是.,然后是2到4个字母
     * */
    const reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
    /* 首先验证用户名、邮箱、密码格式是否正确 */
    verificationformat(name, email, password, reg);
    if (name !== "" || email !== "") {
        $.ajax({
            url: "/user/checkDuplicateregist",
            type: "POST",
            dataType: "json",
            data: {
                "name": name,
                "email": email
            },
            success: function (data) {
                for (const i in data) {
                    const result = data[i];
                    /* 前两个重复,后两个正常了 */
                    if (name !== "" && i === "name") {
                        $("#name").after('<p id="namep">' + result + '</p>');
                        signup_disabled();
                    }
                    if (email !== "" && i === "email") {
                        $("#email").after('<p id="emailp">' + result + '</p>');
                        signup_disabled();
                    }
                    if (name !== "" && i === "result") {
                        if (nameresultBoolean) {
                            $("#name").after('<p id="namep">' + result + '</p>');
                        }
                        if (nameresultBoolean && eamilresultBoolean && pwdresultBoolean) {
                            signup_enable();
                        }
                    }
                    if (email !== "" && reg.test(email) && i === "result") {
                        $("#email").after('<p id="emailp">' + result + '</p>');
                        if (nameresultBoolean && eamilresultBoolean && pwdresultBoolean) {
                            signup_enable();
                        }
                    }
                }
            },
            error: function (data) {
                alert(data);
            }
        });
    }
}
/* 当有任一input域为空时,注册按钮保持禁用状态 */
$(function () {
    const name = $("#name").val();
    const email = $("#email").val();
    const password = $("#password").val();
    if (name === "" || email === "" || password === "") {
        signup_disabled();
    }
});

/*验证注册信息*/
$(function () {
    /* 鼠标移出对应组件即进行校验 */
    $("#name,#email,#password").on("mouseout", verificationRepeat)
});
/* 注册用户 */
$(function () {
    $("#btn_regist").on("click", register)
});