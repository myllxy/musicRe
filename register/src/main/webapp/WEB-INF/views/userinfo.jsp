<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Devaid - Music Band and Musician Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 用的是相对路径，不加这个forward后会报错 -->
    <c:set var="baseurl" value="${pageContext.request.contextPath}"/>
    <link rel="shortcut icon" type="image/png" href="${baseurl}/assets/images/fev.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- animate -->
    <link rel="stylesheet" href="${baseurl}/assets/css/animate.css">
    <!-- font-awesome -->
    <link rel="stylesheet" href="${baseurl}/assets/css/font-awesome.min.css">
    <!-- owl carousel -->
    <link rel="stylesheet" href="${baseurl}/assets/css/owl.carousel.min.css">
    <!-- owl theme default -->
    <link rel="stylesheet" href="${baseurl}/assets/css/owl.theme.default.min.css">
    <!-- pe-icon-7-stroke -->
    <link rel="stylesheet" href="${baseurl}/assets/css/pe-icon-7-stroke.min.css">
    <!-- magnific popup -->
    <link rel="stylesheet" href="${baseurl}/assets/css/magnific-popup.css">
    <!-- bootstrap -->
    <link rel="stylesheet" href="${baseurl}/assets/css/bootstrap.min.css">
    <!-- swiper -->
    <link rel="stylesheet" href="${baseurl}/assets/css/swiper.css">
    <!-- audioplayer -->
    <link rel="stylesheet" href="${baseurl}/assets/css/audioplayer.css">
    <!-- menu -->
    <link rel="stylesheet" href="${baseurl}/assets/css/menu.css">
    <!-- main -->
    <link rel="stylesheet" href="${baseurl}/assets/css/main.css">
    <!-- responsive -->
    <link rel="stylesheet" href="${baseurl}/assets/css/responsive.css">
    <!-- default -->
    <link rel="stylesheet" href="${baseurl}/assets/css/default.css">
    <!-- color -->
    <link rel="stylesheet" href="${baseurl}/assets/css/color.css">
    <link rel="stylesheet" href="${baseurl}/assets/css/search.css">
    <link rel="stylesheet" href="${baseurl}/assets/myextra/accordion.css">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta charset="UTF-8">
    <!--更加友好的支持移动设备的屏幕缩放-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="${baseurl}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${baseurl}/assets/myextra/popwin.js"></script>
    <script>
        $(document).ready(function () {
            $("#login_a").on('click', function () {
                popWin.showWin("750", "700", "欢迎使用本网站", "login.jsp");
            });
        });
    </script>
</head>
<body>
<div id="index">
    <header class="header-nav-area js-index1-nav sticky-on">
        <!-- header-nav -->
        <div class="container-fluid">
            <div class="row flexbox-center">
                <div class="col-md-7 header-nav-none" style="padding-left: 0px;margin-left: 125px;margin-top: -13px;">
                    <nav class="header-nav">
                        <div class="cssmenu" data-title="Menu">
                            <ul class="menu list-inline" id="menu_list">
                                <li id="mymusic" class="active"><a href="#index"
                                                                   style="margin-bottom: auto;margin-left: 0px;margin-right: 0px;">我的音乐</a>
                                    <!-- 暂时不用 -->
                                    <!-- <ul>
                                        <li><a href="index2.html">Home Version two</a></li>
                                        <li><a href="index3.html">Home Version three</a></li>
                                        <li><a href="index4.html">Home Version four</a></li>
                                        <li><a href="index5.html">Home Version five</a></li>
                                        <li><a href="index6.html">Home Version Six</a></li>
                                    </ul> -->
                                </li>
                                <!-- 然后将此页面设置为active，并且将原页面取消active，本质就是新增或取消active类 -->
                                <!-- 这里选择使用jQuery绑定一个点击事件 -->
                                <li id="discovermusic"><a href="#album" style="margin-bottom: auto;"
                                                          id="changeActive">发现音乐</a>
                                </li>
                                <li><a href="event.html" style="margin-bottom: auto;">朋友</a>
                                </li>
                                <li><a href="photo-gallary.html" style="margin-bottom: auto;">商城</a>
                                </li>
                                <li><a href="artist.html" style="margin-right: 400px;margin-bottom: auto;">音乐人</a>
                                </li>
                            </ul>
                        </div><!-- #header-menu-wrap -->
                    </nav><!-- .header-nav -->
                </div><!-- col-lg-7 -->
                <!-- 搜索框 -->
                <div class="col-lg-7" style="margin-top: 12px;margin-left: -400px;padding-right: 380px;">
                    <form class="js-footer-subscribe-form">
                        <div class="js-input-icon">
                            <input type="text" placeholder="音乐/电台" required=""
                                   style="padding-left: 27px;margin-left: 40px;margin-top: 24px;">
                        </div>
                        <input type="submit" value="搜索" class="btn-primary" style="bottom: -24px;margin-left: -48px;">
                    </form>
                </div>
                <div class="col-md-1 col-sm-3" style="padding-left: 49px;bottom: -17px;margin-bottom: -56px;">
                    <div class="logo">
                        <div class="cssmenu" data-title="Menu"
                             style="margin-top: -10px;left: 91px;right: -94px;top: -73px;padding-right: 15px;">
                            <shiro:authenticated>
                                <div id="replace" class="col-md-1 col-sm-3"
                                     style="padding-left: 49px;bottom: -17px;margin-bottom: -56px;">
                                    <div class="logo">
                                        <div class="cssmenu" data-title="Menu"
                                             style="margin-top: -10px;left: 91px;right: -94px;top: -73px;padding-right: 15px;">
                                            <ul style="left: -150px;bottom: -50px;">
                                                <li><a href="index.jsp">
                                                    <img src="<shiro:principal property="headImg" />" alt="Devaid logo"
                                                         class="img-circle img-responsive img-thumbnail">
                                                </a>
                                                    <ul class="dropdown-menu" id="repalce">
                                                        <li><a href="index.jsp">我的主页</a></li>
                                                        <li><a href="index2.html">我的消息</a></li>
                                                        <li><a href="/user/setting">个人设置</a></li>
                                                        <li><a href="/logout">退出</a></li>
                                                        <li><a href="photo-gallary.html">商城</a>
                                                            <ul class="dropdown-menu">
                                                                <li><a href="photo-gallary.html">Photo Gallary</a>
                                                                </li>
                                                                <li><a href="single-photo-gallary.html">Single Photo
                                                                    Gallary</a></li>
                                                                <li><a href="video-gallary.html">Video Gallary</a>
                                                                </li>
                                                                <li><a href="single-video-gallary.html">Single Video
                                                                    Gallary</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </shiro:authenticated>
                            <!-- 登陆成功后将以下元素替换成用户图像 -->
                            <!-- 头像 -->
                            <shiro:guest>
                                <ul style="margin-top: 20px;">
                                    <li id="bereplace" style="display: block"><a href="javascript:void(0)"
                                                                                 id="login_a">登录</a>
                                    </li>
                                </ul>
                            </shiro:guest>
                        </div>
                    </div>
                </div>
            </div><!-- row -->
        </div><!-- container -->
    </header><!-- header-nav -->
</div>
<!--先把jquery js先于BootStrop js引入：原因......-->
<script type="text/javascript" src="${baseurl}/assets/js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="${baseurl}/assets/js/bootstrap.min.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="${baseurl}/assets/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/swiper.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/plugins.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/menu.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/countdown.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/jquery.nice-select.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/jplayer.playlist.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/audio-player.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/audioplayer.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/main.js"></script>
<script type="text/javascript" src="${baseurl}/assets/myextra/wow.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/myextra/main.js"></script>
</body>
<script type="text/javascript">
    var whatList = ['image1', 'image1', 'image2', 'image3', 'image4', 'image5', 'image6'];
    $(document).ready(function () {
        new WOW().init();
    });
    // $('#discovermusic').on('click', function(e) {
    // 	$('.active').removeClass("active")
    // 	$('#discovermusic').addClass("active");
    // });
    // $('#mymusic').on('click', function(e) {
    // 	$('.active').removeClass("active")
    // 	$('#mymusic').addClass("active");
    // });
    $('#discovermusic').on('click', function (e) {
        var list = $('#menu_list li')
        for (var i = 0; i < list.length; i++) {
            if ($(list[i]).hasClass("active")) {
                $(list[i]).removeClass("active")
                $('#discovermusic').addClass("active");
            }
        }
    });
    $('#mymusic').on('click', function (e) {
        var list = $('#menu_list li')
        for (var i = 0; i < list.length; i++) {
            if ($(list[i]).hasClass("active")) {
                $(list[i]).removeClass("active")
                $('#mymusic').addClass("active");
            }
        }
    });
</script>
</html>
