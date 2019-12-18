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
                <form action="#" method="post" id="login">
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
    Auth.init({
        login_url: '#login',
        forgot_url: '#forgot'
    });
    /*验证注册信息*/
    $(function () {
        $("#name,#email").blur(function () {
            const name = $("#name").val();
            const email = $("#email").val();
            /* 正则表达式：
             * 字母或数字开始可以加下划线或者"-",然后是@,然后是任意字母或字符串,然后是.,然后是2到4个字母
             * */
            var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
            $("#namep,#emailp").remove()
            if (email !== "" && !reg.test(email)) {
                $("#email").after('<p id="emailp">邮箱格式输入错误</p>')
                /*1.更改按键颜色
                * 2.设置按键为不可以点击(即解除或者更换绑定事件)*/
                const btn_regist = $("#btn_regist");
                btn_regist.css("background-color", "grey")
                btn_regist.unbind()
            }
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
                            var result = data[i]
                            if (name !== "" && i === "name") {
                                // ZENG.msgbox.show("服务器繁忙，请稍后再试。", i, 3000);
                                $("#name").after('<p id="namep">' + result + '</p>')
                            }
                            if (email !== "" && i === "email") {
                                $("#email").after('<p id="emailp">' + result + '</p>')
                            }
                            if (name !== "" && i === "result") {
                                $("#name").after('<p id="namep">' + result + '</p>')
                            }
                            if (email !== "" && reg.test(email) && i === "result") {
                                $("#email").after('<p id="emailp">' + result + '</p>')
                            }
                        }
                    },
                    error: function (data) {
                        alert(data);
                    }
                });
            }
        })
    })
    /*注册用户*/
    $(function () {
        $("#btn_regist").click(function () {
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
                        alert("sss")
                        for (const i in data) {
                            const result = data[i];
                            if (i === "register_result") {
                                console.debug(result)
                                alert(result)
                            }
                        }
                    },
                    error: function (data) {
                        alert(data);
                    }
                });
            }
        })
    })
</script>
</body>
</html>