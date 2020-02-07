function searchmusic() {
    let name = $("#searchmusic").val();
    if (name !== "") {
        $.ajax({
            url: "/music/search",
            type: "POST",
            dataType: "json",
            data: {
                "name": name,
            },
            success: function (data) {
                let tips = $("#tips");
                tips.empty();
                if (data.length === 0) {
                    tips.hide();
                }
                let childs = "";
                //遍历结果集，将结果集中的每一条数据用一个div显示，把所有的div放入到childs中
                for (let i of data) {
                    childs += "<div>" + i.name + "</div>";
                }
                //把childs 这div集合放入到下拉提示框的父div中，上面我们以获取了
                tips.append(childs);
                tips.show();
            },
            error: function (data) {
            }
        });
    }
}

$(function () {
    /* 组件内容发生变化对应组件即进行校验 */
    $("#searchmusic").on("input propertychange", function () {
        searchmusic();
    });
});