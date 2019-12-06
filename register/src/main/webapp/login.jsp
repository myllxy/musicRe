<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Login</title>
    <link rel="stylesheet" href="assets/myextra/auth.css">
    <link rel="stylesheet" href="assets/myextra/msgbox.css"/>
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
                    <p>Sign in to continue</p>
                    <div class="lowin-group">
                        <label>Email <a href="#" class="login-back-link">Sign in?</a></label>
                        <input type="email" autocomplete="email" name="email" class="lowin-input">
                    </div>
                    <div class="lowin-group password-group">
                        <label>Password <a href="#" class="forgot-link">Forgot Password?</a></label>
                        <input type="password" name="password" autocomplete="current-password" class="lowin-input">
                    </div>
                    <button class="lowin-btn login-btn">
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
                <form action="#" method="post" id="register">
                    <p>Let's create your account</p>
                    <div class="lowin-group">
                        <label>Name</label>
                        <input type="text" name="name" class="lowin-input" id="name">
                    </div>
                    <div class="lowin-group">
                        <label>Email</label>
                        <input type="text" name="email" class="lowin-input" id="email">
                    </div>
                    <div class="lowin-group">
                        <label>Password</label>
                        <input type="password" name="password" autocomplete="current-password" class="lowin-input"
                               id="password">
                    </div>
                    <button class="lowin-btn" onclick="login()">
                        Sign Up
                    </button>
                    <div class="text-foot">
                        Already have an account? <a href="" class="login-link">Login</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <footer class="lowin-footer" style="padding-top: 95px;">
    </footer>
</div>
<script type="text/javascript" src='assets/js/jquery.min.js'></script>
<script type="text/javascript" src="assets/myextra/auth.js"></script>
<script type="text/javascript" src="assets/myextra/msgbox.js"></script>
<script type="text/javascript">
    Auth.init({
        login_url: '#login',
        forgot_url: '#forgot'
    });

    function checkDuplicateregist() {
        var name = $('#name').val()
        var email = $('#email').val()
        var xhr = getAjax(); //获得ajax对象
        xhr.open("GET", "/user/checkDuplicateregist?name=" + name + "&&email=" + email + "")
        // post方法需要添加该请求头,注意必须在open与send之间调用
        // xhr.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
        var nameElement = document.getElementById("name")
        var emailElement = document.getElementById("email")
        xhr.onreadystatechange = function () { //回调函数
            if (xhr.readyState == 4 && xhr.status == 200) { //获得响应数据
                var text = xhr.responseText
                console.debug(text)
                if (text == "true") {
                    nameElement.innerText = "可以使用";
                } else {
                    nameElement.innerText = "已经存在，请更换";
                }
            }

        }
        xhr.send(); //发送请求：
        // xhr.send('n1='+num1+'&n2='+num2);

    }

    $(function () {
        $("#name,#email").blur(function () {
            var name = $("#name").val()
            var email = $('#email').val()
            /*正则表达式：
             * 字母或下划线开始,然后是@,然后是任意字母或字符串,然后是.,然后是2到4个字母
             * */
            var reg = /^([a-zA-Z]|[0-9])+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
            $("#namep,#emailp").remove()
            if (email !== "" && !reg.test(email)) {
                $("#email").after('<p id="emailp">邮箱格式输入错误</p>')
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
                        for (var i in data) {
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

    function login() {
        var name = $('#name').val()
        var email = $('#email').val()
        var password = $('#password').val()
        var xhr = getAjax(); //获得ajax对象
        xhr.open("POST", "/user/checkDuplicateregist")
        // post方法需要添加该请求头,注意必须在open与send之间调用
        xhr.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
        var p = document.getElementById("name")
        xhr.onreadystatechange = function () { //回调函数
            if (xhr.readyState == 4 && xhr.status == 200) { //获得乡音数据
                var text = xhr.responseText
                if (text == "true") {
                    p.innerText = "用户名可以使用";
                } else {
                    p.innerText = "用户名已经存在";
                }
            }

        }
        xhr.send(); //发送请求：
    }

    // 绑定注册事件
    // $('#register')
</script>
</body>
</html>
