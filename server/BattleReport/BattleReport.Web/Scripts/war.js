var war = function (obj) {
    //设置
    this.setting = {
        usercount: 25, //一个队伍25人
        rowUserCount:5 //每行多少人
    };

    //把当前控件对象赋给container属性
    this.container = obj;

    //初始化上传控件
    this.init();
}

war.prototype = {
    init: function () {

        //初始化队伍
        this.InitRanks(this.container, this.setting.usercount);
            
        //初始化英雄
        this.InitHeros();

        //设置拖拽
        this.SetDraggle();
    },
    //初始化队伍
    InitRanks: function (container, userCount) {
        var html = "";
        var u=0;

        //计算行数
        var rows = userCount / this.setting.rowUserCount;

        if (userCount % this.rowUserCount > 0) rows = rows + 1;

        for (var r = 0; r < rows; r++)
        {
            html += "<tr>";
            for (var i = 0; i < this.setting.rowUserCount; i++)
            {
                if (u < userCount) {
                    html += "<td></td>";
                    u++;
                }
            }
            html += "</tr>";
        }
        $(container).html(html);
    },
    //初始化英雄
    InitHeros: function () {

        $(".list_heros").html("");

        //暂设死5位
        for (var i = 1; i <= 5; i++)
        {
            $(".list_heros").append("<li><div class='pnl_hero'><img src='images/hero/h"+i+".png' /><a class='link_heroClose' href='###'></a></div></li>");
        }
        $(".list_heros").append("<div style='clear:both'></div>");
    },
    //拖拽设置
    SetDraggle: function () {
        var self = this;
        //设置图片拖拽
        $(".list_heros .pnl_hero").draggable({
            stop: function () {
                self.InitHeros(); self.SetDraggle()
            },
            helper:"clone"
        });

        //拖拽到对象后的处理
        $(".tbl_ranks td").droppable({
            drop: function (event, ui) {
                $(this).html($(ui.draggable).attr("style", ""));
                self.SettdImageDraggle($(ui.draggable));
                $(this).removeClass("drop_hover");
               
            },
            over: function (event, ui)
            {
                $(this).addClass("drop_hover");
            },
            out: function (event, ui)
            {
                $(this).removeClass("drop_hover");
            }
        });

        $(".tbl_ranks td .link_heroClose").live("click", function () {
            $(this).parent().remove();
            
        })
       
    },
    //table里的图片拖拽
    SettdImageDraggle: function (obj) {
        $(obj).draggable();
    }
}