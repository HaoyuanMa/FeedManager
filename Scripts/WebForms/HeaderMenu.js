$(document).ready(function () {0

    $('#nagivation').click(function () {
        $('.secondary-sidebar').toggle(200);
        if ($('#pageinner').hasClass('collapsed-sidebar')) {
            $('#pageinner').removeClass('collapsed-sidebar');
            $('#pageheader').removeClass('collapsed-sidebar');
        }
        else {
            $('#pageinner').addClass('collapsed-sidebar');
            $('#pageheader').addClass('collapsed-sidebar');
        }
    })

    $('#account-setting').click(function () {
        if ($('.secondary-sidebar').css("display") != 'none')
            $('.secondary-sidebar').toggle(300);
        $('.popver').toggle("fast");
    })

    $('#toggle-fullscreen').click(function () {
        return document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement || document.msFullscreenElement ? document.exitFullscreen ? document.exitFullscreen() : document.msExitFullscreen ? document.msExitFullscreen() : document.mozCancelFullScreen ? document.mozCancelFullScreen() : document.webkitExitFullscreen && document.webkitExitFullscreen() : document.documentElement.requestFullscreen ? document.documentElement.requestFullscreen() : document.documentElement.msRequestFullscreen ? document.documentElement.msRequestFullscreen() : document.documentElement.mozRequestFullScreen ? document.documentElement.mozRequestFullScreen() : document.documentElement.webkitRequestFullscreen && document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT), !1
    })


    $('#addcategory').click(function () {

        
        var uname = $('#musername').html();
     
        var name = prompt("分类名称：", "新分类");
        
        var html = "";
        html += "<li><a href=''>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class=" +
            "'fas fa-angle-right'" +
            "></i> &nbsp&nbsp " +
            name +
            "</a></ li >";
        if (name) {

            $.post("/AddCategory.ashx?str="+name+'&uname='+uname+'&type=cty');
            /*$.ajax({
                type: "POST",                   //提交方式  
                url: "/FeedManager.aspx/Add",   //提交的页面/方法名  
                data: { "str":name}                   //参数（如果没有参数：null）  
            });*/
            $('#li-addcategory').before(html);
        }
        

        
    })

    $('#addfavourite').click(function () {
        var name = prompt("收藏夹名称：", "新收藏夹");
        var uname = $('#musername').html();
        var html = "";
        html += "<li><a href=''>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class=" +
            "'fas fa-angle-right'" +
            "></i> &nbsp&nbsp " +
            name +
            "</a></ li >";
        if (name) {
                $.post("/AddCategory.ashx?str=" + name + '&uname=' + uname + '&type=fvt');
                
               $('#li-addfavourite').before(html);
            }
       
    })

    $('.cty-a').each().click(function () {
        var ctyid = $(this).attr('id');
    })
    


})












