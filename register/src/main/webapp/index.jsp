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
    <link rel="shortcut icon" type="image/png" href="assets/images/fev.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- animate -->
    <link rel="stylesheet" href="assets/css/animate.css">
    <!-- font-awesome -->
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <!-- owl carousel -->
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <!-- owl theme default -->
    <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
    <!-- pe-icon-7-stroke -->
    <link rel="stylesheet" href="assets/css/pe-icon-7-stroke.min.css">
    <!-- magnific popup -->
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <!-- bootstrap -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- swiper -->
    <link rel="stylesheet" href="assets/css/swiper.css">
    <!-- audioplayer -->
    <link rel="stylesheet" href="assets/css/audioplayer.css">
    <!-- menu -->
    <link rel="stylesheet" href="assets/css/menu.css">
    <!-- main -->
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- responsive -->
    <link rel="stylesheet" href="assets/css/responsive.css">
    <!-- default -->
    <link rel="stylesheet" href="assets/css/default.css">
    <!-- color -->
    <link rel="stylesheet" href="assets/css/color.css">
    <link rel="stylesheet" href="assets/css/search.css">
    <link rel="stylesheet" href="assets/myextra/accordion.css">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta charset="UTF-8">
    <!--更加友好的支持移动设备的屏幕缩放-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/myextra/popwin.js"></script>
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
    <div class="slider-area" id="home">
        <div class="slider-carousel owl-theme">
            <div class="single-slides2"></div>
            <div class="single-slides3"></div>
            <!-- 轮播图 -->
            <video src="assets/myextravideo/flydog.mp4" width="100%" height="100%" autoplay="autoplay" loop="loop"
                   controls="controls">
            </video>
        </div> <!-- slider-carousel -->
        <!-- 播放器 -->
        <div class="js-info-album-player" id="js-info-album-player">
            <div class="container-fluid pr-0">
                <div class="row">
                    <div class="col-lg-10 offset-lg-2 offset-sm-0" style="right: -270px;">
                        <div class="row">
                            <div class="col-lg-12 dark-overlay">
                                <div class="audio-player">
                                    <div id="jquery_jplayer_1" class="jp-jplayer"></div>
                                    <div id="jp_container_1" class="jp-audio" role="application"
                                         aria-label="media player">
                                        <div class="jp-type-playlist">
                                            <div class="jp-gui jp-interface row">
                                                <div class="col-lg-1 col-sm-2 pr-0">
                                                    <div class="jp-controls">
                                                        <button class="jp-previous" tabindex="0"><i
                                                                class="fa fa-step-backward"></i></button>
                                                        <button class="jp-play" tabindex="0"><i class="fa fa-play"></i>
                                                        </button>
                                                        <button class="jp-next" tabindex="0"><i
                                                                class="fa fa-step-forward"></i></button>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2 col-sm-2 js-album-playing-text">
                                                    <a href="javascript:void(0);" id="playlist-text">
                                                        <div class="jp-now-playing flex-item">
                                                            <div class="jp-track-name"></div>
                                                            <div class="jp-artist-name"></div>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="col-lg-2 col-sm-3">
                                                    <div class="jp-toggles">
                                                        <button id="playlist-toggle" class="jp-show-playlist"
                                                                tabindex="0" title="Playlist"><i
                                                                class="fa fa-music"></i>
                                                        </button>
                                                        <button class="jp-shuffle" tabindex="0" title="Shuffle">
                                                            <i class="fa fa-random"></i>
                                                        </button>
                                                        <button class="jp-repeat" tabindex="0" title="Repeat"><i
                                                                class="fa fa-exchange"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-sm-5 jp-volume-controls">
                                                    <div class="">
                                                        <button class="jp-mute" tabindex="0"><i
                                                                class="fa fa-volume-up"></i></button>
                                                        <div class="jp-volume-bar">
                                                            <div class="jp-volume-bar-value">
                                                                <div class="bullet">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-sm-2">
                                                    <div class="js-info-album-player-content float-right">
																<span class="wpcf7-form-control-wrap Selectbox">
																	<select class="Wide wpcf7-form-control wpcf7-select"
                                                                            name="quality-selectbox"
                                                                            aria-invalid="true">
																		<option value="0">Quality</option>
																		<option value="1">HD</option>
																		<option value="2">HIGH</option>
																		<option value="3">MEDIUM</option>
																		<option value="4">LOW</option>
																	</select>
																</span>
                                                    </div><!-- js-info-album-player-content -->
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="jp-progress-container">
                                                        <div class="jp-time-holder">
                                                            <span class="jp-current-time" role="timer"
                                                                  aria-label="time">&nbsp;</span>
                                                            <span class="jp-duration" role="timer"
                                                                  aria-label="duration">&nbsp;</span>
                                                        </div>
                                                        <div class="jp-progress">
                                                            <div class="jp-seek-bar">
                                                                <div class="jp-play-bar">
                                                                    <div class="bullet">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div id="playlist-wrap" class="jp-playlist">
                                                <ul>
                                                    <li>&nbsp;</li>
                                                </ul>
                                            </div>
                                            <div class="jp-no-solution">
                                                <span>Update Required</span> To play the media you will need to either
                                                update your browser to a recent
                                                version or update your <a href="http://get.adobe.com/flashplayer/"
                                                                          target="_blank">Flash plugin</a>.
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- audio-player -->
                            </div><!-- col-lg-9 -->
                        </div><!-- row -->
                    </div><!-- col-lg-10 -->
                </div><!-- row -->
            </div><!-- container -->
        </div><!-- js-info-album-player -->

        <div id="js-play-song" class="primary-bg has-color">
            <div class="js-song-list-thumbnail">
                <img src="assets/images/playlists/playlists-sm8.jpg" alt="playlists">
            </div>
            <div class="js-song-list-content">
                <h6>Without You</h6>
                <span class="js-song-artist-name">Mushroom Records</span>
            </div>
            <div class="js-play-left-arrow">
                <span><i class="pe-7s-angle-right"></i></span>
            </div>
        </div><!-- js-play-song -->

        <div class="js-song-list primary-bg">
            <ul class="list-inline">
                <li><a href="#"><i class="pe-7s-download"></i><span>download now</span></a></li>
                <li><a href="#"><i class="pe-7s-like"></i><span>Add To Favourites now</span></a></li>
                <li><a href="#"><i class="pe-7s-musiclist"></i><span>Add To PlayList</span></a></li>
                <li><a href="#"><i class="pe-7s-share"></i><span>Share</span></a></li>
                <li class="js-play-right-arrow"><i class="pe-7s-angle-left"></i></li>
            </ul>
        </div><!-- js-song-list -->
    </div><!-- slider-area End-->
</div>
<!-- 点击发现音乐或者滚轮滑动至此 -->
<section class="album-area album-bg has-color" id="album">
    <div class="container" style="margin-left: -60px;">
        <div class="section-title text-center mb-50" style="margin-left: 505px;">
            <h2>Feature Music <span class="primary-color">Albums</span></h2>
            <p>Check out my newest music albums. You can easily purchase our music albums on
                <span class="primary-color">iTunes</span> or <span class="primary-color">Google Play</span></p>
        </div><!-- section-title -->
        <article class="content content-what">
            <h2 class="content-topic">手风琴图片说明轮播</h2>
            <span class="sub-h"></span>
            <div class="content-main what-list" style="vertical-align: middle;">
                <div class="what-item what-item-1 wow fadeInLeft" data-wow-delay="0.6s" data-num="1"
                     style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                    <span>图片1</span>
                    <div class="what-item-bg"></div>
                </div>
                <div class="what-item what-item-2 wow fadeInLeft" data-wow-delay="0.4s" data-num="2"
                     style="visibility: hidden; animation-delay: 0.4s; animation-name: none;">
                    <span>图片2</span>
                    <div class="what-item-bg"></div>
                </div>
                <div class="what-item what-item-3 wow fadeInLeft" data-wow-delay="0.2s" data-num="3"
                     style="visibility: hidden; animation-delay: 0.2s; animation-name: none;">
                    <span>图片3</span>
                    <div class="what-item-bg"></div>
                </div>
                <div class="what-item what-item-4 what-item-active" data-wow-delay="0s" data-num="4">
                    <span>图片4</span>
                    <div class="what-item-bg"></div>
                </div>
                <div class="what-item what-item-5 wow fadeInRight" data-wow-delay="0.2s" data-num="5"
                     style="visibility: hidden; animation-delay: 0.2s; animation-name: none;">
                    <span>图片5</span>
                    <div class="what-item-bg"></div>
                </div>
                <div class="what-item what-item-6 wow fadeInRight" data-wow-delay="0.4s" data-num="6"
                     style="visibility: hidden; animation-delay: 0.4s; animation-name: none;">
                    <span>图片6</span>
                    <div class="what-item-bg"></div>
                </div>
                <div class="what-item what-item-7 wow fadeInRight" data-wow-delay="0.6s" data-num="7"
                     style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                    <span>图片7</span>
                    <div class="what-item-bg"></div>
                </div>
            </div>
            <div class="content-main" style="clear:both;">
                <p class="what-more active-more" style="display: block;">跑车</p>
            </div>
            <div style="height:67px;"></div>
        </article>
    </div><!-- container -->
</section><!-- Album Section End -->
<!--先把jquery js先于BootStrop js引入：原因......-->
<script type="text/javascript" src='assets/js/jquery.min.js'></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="assets/js/bootstrap.min.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="assets/js/swiper.min.js"></script>
<script type="text/javascript" src="assets/js/plugins.js"></script>
<script type="text/javascript" src="assets/js/menu.js"></script>
<script type="text/javascript" src="assets/js/countdown.js"></script>
<script type="text/javascript" src="assets/js/jquery.nice-select.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="assets/js/jplayer.playlist.min.js"></script>
<script type="text/javascript" src="assets/js/audio-player.js"></script>
<script type="text/javascript" src="assets/js/audioplayer.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>
<script type="text/javascript" src="assets/myextra/wow.min.js"></script>
<script type="text/javascript" src="assets/myextra/main.js"></script>
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
