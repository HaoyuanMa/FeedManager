
$(document).ready(function () {

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
        if ($('.secondary-sidebar').css("display") != 'none') {
            $('.secondary-sidebar').toggle(300);
            if ($('#pageinner').hasClass('collapsed-sidebar')) {
                $('#pageinner').removeClass('collapsed-sidebar');
                $('#pageheader').removeClass('collapsed-sidebar');
            }
            else {
                $('#pageinner').addClass('collapsed-sidebar');
                $('#pageheader').addClass('collapsed-sidebar');
            }
        }
        if ($('.popver').hasClass('account-open')) {
            $('.popver').toggle("fast");
            $('.popver').removeClass('account-open');
        }
        else {
            $('.popver').toggle("fast");
            $('.popver').addClass('account-open');
        }
        
    })


    $('#toggle-fullscreen').click(function () {
        return document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement || document.msFullscreenElement ? document.exitFullscreen ? document.exitFullscreen() : document.msExitFullscreen ? document.msExitFullscreen() : document.mozCancelFullScreen ? document.mozCancelFullScreen() : document.webkitExitFullscreen && document.webkitExitFullscreen() : document.documentElement.requestFullscreen ? document.documentElement.requestFullscreen() : document.documentElement.msRequestFullscreen ? document.documentElement.msRequestFullscreen() : document.documentElement.mozRequestFullScreen ? document.documentElement.mozRequestFullScreen() : document.documentElement.webkitRequestFullscreen && document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT), !1
    })


    $('#addcategory').click(function () {

        
        var uname = $('#musername').html();
     
        var name = prompt("分类名称：", "新分类");
        
        var html = "";
        html += "<li><a href='javascript:void(0)'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class=" +
            "'fa fa-angle-right'" +
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
        html += "<li><a href='javascript:void(0)'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class=" +
            "'fa fa-angle-right'" +
            "></i> &nbsp&nbsp " +
            name +
            "</a></ li >";
        if (name) {
                $.post("/AddCategory.ashx?str=" + name + '&uname=' + uname + '&type=fvt');
                
               $('#li-addfavourite').before(html);
            }
       
    })

    $('.cty-a').each(function () {
        $(this).click(function () {
            var ctyid = $(this).attr('id');
            var ctyname = String(ctyid).substring(6);
            var uname = $('#musername').html();
            var ulid = '#cty-u-' + ctyname;
            if ($(ulid).css('display') != 'none') {
                $(ulid).toggle();
            }
            else {
                if ($(ulid).hasClass('loaded')) {
                    $(ulid).toggle();
                }
                else {
                    $.get('/GetCategory.ashx', { 'ctyname': ctyname, 'uname': uname }, function (date) {
                        $(ulid).append(date);
                        $(ulid).addClass('loaded');
                        $(ulid).toggle();
                        
                    })
                }
            }
            
        })

    })

    currentget = null;
    
    $('#rss-father').on('click','.rss-a', function () {
        $(this).each(function () {

            if (currentget) {
                currentget.abort();
                currentget = null;
            }
            
            $('#main-wrapper').empty();
            $('#main-wrapper').append('<a id ="loading"><i class="fa fa-spinner"></i>Loading...</a>');

            var rss = $(this).attr('id');
            var rssid = String(rss).substring(6);
            var uname = $('#musername').html();

            //$.ajaxSettings.async = false;
           /* currentget = $.get('/GetRss.ashx', { 'rssid': rssid, 'uname': uname }, function (date) {
                $('#loading').remove();
                $('#main-wrapper').append(date);
            });*/

            currentget = $.ajax({
                url: '/GetRss.ashx?uname=' + uname + '&rssid=' + rssid,
                type: 'get',
                success: function (date) {
                    $('#loading').remove();
                    $('#main-wrapper').append(date);
                }
            });
            //$.ajaxSettings.async = true;
            //currentget = null;
           
        })
    })

    $('#addrss').click(function () {
    
        $('#main-wrapper').empty();
        var html = "<div class='panel panel-info' style='margin-left:10%; margin-right:15%; margin-top:2.5%'>" +
                "<div class='panel-heading'><h3 class='panel-title'>请输入RSS订阅地址</h3></div>" +
            "<div class='panel-body'>" +
            "<div style = 'padding: 100px 100px 100px 100px;' > " +
            "<form class='bs-example bs-example-form' role='form'>" +
            "<div class='row' > " +
            "<div class='minput'>" +
            "<div class='input-group' > " +
           // "<div class='input-group-btn' > " +
                "<label for='category'>分类:&nbsp; </label><select id='cty-select'>";
        
        $('.cty-a').each(function () {
            var ctyname = String($(this).attr("id")).substring(6);
            html += ("<option value='" + ctyname + "'>" + ctyname + "</option>");
        });
        html += ("</select></div><input type='text' class='form-control' id='addurl-input'>" +
            "</div><br><button type='button' onclick='add()' class='btn btn-default' id='addrssbtn'><i class='fa fa-plus'></i>添加</button></div></form></div></div></div></div>");
   
        $('#main-wrapper').append(html);

    })




})

 









