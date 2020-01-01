<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: LXY
  Date: 20/1/1
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Devaid - Music Band and Musician Template</title>
    <jsp:include page="/WEB-INF/views/common/head.jsp"/>
</head>
<body>
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
</body>
</html>
