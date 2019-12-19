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
<script type="text/javascript" src="assets/myextra/verification.js"></script>
</body>
</html>