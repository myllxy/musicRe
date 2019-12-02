function showNewAwardDetails(a, i) {
    a.hide(),
    a.each(function(a, i) {
        var e = $(i).parent(".lazy-load-img").data("src"),
        t = new Image;
        t.src = e,
        t.onload = function() {
            $(i).attr("src", t.src).fadeIn()
        }
    }),
    i.addClass("active-details").fadeIn("slow")
}
function IsPC() {
    for (var a = navigator.userAgent,
    i = ["Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"], e = !0, t = 0; t < i.length; t++) if (0 < a.indexOf(i[t])) {
        e = !1;
        break
    }
    return e
}
$("li.nav").hover(function() {
    $(this).find(".nav-item").addClass("title-active")
},
function() {
    $(this).find(".nav-item").removeClass("title-active")
}),
/from=malong.com/g.test(window.location.search.substr(1)) && $(".ICP-link").hide(),
992 < window.outerWidth && ($(".award-btn").click(function(a) {
    a.stopPropagation();
    var i = $(this).siblings(".award-details");
    if ("none" === i.css("display")) {
        var e = i.find("img");
        0 < $(".active-details").length ? $(".active-details").hide(0,
        function() {
            $(this).removeClass("active-details"),
            showNewAwardDetails(e, i)
        }) : showNewAwardDetails(e, i)
    }
}), $(".content-awards").click(function() {
    0 < $(".active-details").length && $(".active-details").fadeOut(300).removeClass("active-details")
})),
$(".backers-logo").hover(function() {
    var a = $(this).siblings(".backers-detail");
    "none" === a.css("display") && ($(".active-backer").removeClass("active-backer").hide(), a.addClass("active-backer").show())
});
var what_items = $(".what-item");
what_items.click(function(a, i) {
    if (!$(this).is(".what-item-active")) {
        var e = $(this).data("num") - 1,
        s = what_items.index(this),
        t = what_items.slice(0, s);
        $(".active-more");
        $(".what-item-active").removeClass("what-item-active"),
        $(this).addClass("what-item-active"),
        $(".active-more").hide(),
        $(".what-more").html(whatList[e]).addClass("active-more").fadeIn("slow"),
        t.map(function(a, i) {
            var e = 448 - 20 * (s - a),
            t = 9 - (s - a);
            $(i).css({
                height: e,
                "z-index": t
            })
        }),
        what_items.slice(s + 1).map(function(a, i) {
            var e = 448 - 20 * (a + 1),
            t = 9 - a - 1;
            $(i).css({
                height: e,
                "z-index": t
            })
        })
    }
}),
$(".award-details").click(function(a) {
    a.stopPropagation()
}),
$(".office-link").click(function() {
    var a = $(this).data("class");
    $(".footer-slider-container").removeClass("hide-layer").find("." + a).removeClass("hide-layer")
}),
$(".slider-layer").click(function() {
    $(".footer-slider-container").addClass("hide-layer").find(".swiper-container").addClass("hide-layer")
}),
$(function() {
    $(".copyRightDate").text((new Date).getFullYear())
});