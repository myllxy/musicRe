<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Login</title>
    <link rel="stylesheet" href="assets/myextra/auth.css">
</head>
<body>
<div class="lowin lowin-red">
    <div class="lowin-brand">
        <img src="assets/myextraimg/kodinger.jpg" alt="logo">
    </div>
    <div class="lowin-wrapper">
        <div class="lowin-box lowin-login">
            <div class="lowin-box-inner">
                <form method="post" id="login">
                    <div class="lowin-group">
                        <label>Email <a href="#" class="login-back-link">Sign in?</a></label>
                        <input type="email" autocomplete="email" name="email" class="lowin-input">
                    </div>
                    <div class="lowin-group password-group">
                        <label>Password <a href="#" class="forgot-link">Forgot Password?</a></label>
                        <input type="password" name="password" autocomplete="current-password" class="lowin-input">
                    </div>
                    <button type="button" class="lowin-btn login-btn">
                        Sign In
                    </button>
                    <div class="text-foot">
                        Don't have an account? <a href="" class="register-link">Register</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="lowin-box lowin-register">
            <div class="lowin-box-inner">
                <form method="post" id="register">
                    <div class="lowin-group">
                        <label>Name</label>
                        <input type="text" name="name" autocomplete="name" class="lowin-input" id="name">
                    </div>
                    <div class="lowin-group">
                        <label>Email</label>
                        <input type="email" autocomplete="email" name="email" class="lowin-input" id="email">
                    </div>
                    <div class="lowin-group">
                        <label>Password</label>
                        <input type="password" name="password" autocomplete="current-password" class="lowin-input"
                               id="password">
                    </div>
                    <button type="button" class="lowin-btn" id="btn_regist">
                        Sign Up
                    </button>
                    <div class="text-foot">
                        Already have an account? <a href="#login" class="login-link">Login</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <footer class="lowin-footer" style="padding-top: 95px;">
    </footer>
</div>
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script src="assets/myextra/auth.js"></script>
<script type="text/javascript">
    /* 如果邮箱验证结果正确就为true,格式错误则为false */
    let eamilresultBoolean = true;
    /* 如果用户名验证结果正确就为true,格式错误则为false */
    let nameresultBoolean = true;
    /* 如果密码验证结果正确就为true,格式错误则为false */
    let pwdresultBoolean = true;
    const name = $("#name").val();
    const email = $("#email").val();
    const password = $("#password").val();
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
                            /* 注册成功后清空表单数据防止重复注册 */
                            $("#register")[0].reset();
                            /* 同时清空name、email等input下面生成的描述语句 */
                            $("#namep,#emailp").remove();
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
        /* 首先验证用户名和格式是否正确 */
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

    $(function () {
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
</script>
</body>
</html>