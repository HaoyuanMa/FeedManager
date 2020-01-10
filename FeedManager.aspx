﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedManager.aspx.cs" Inherits="Feed_Manager.FeedManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>
    </title>
    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
    <link rel="stylesheet" href="https://www.jq22.com/jquery/bootstrap-4.2.1.css">
    <link href="https://cdn.bootcss.com/font-awesome/5.5.0-2/css/all.min.css" rel="stylesheet">
     
    <link href="Content/switchery.min.css" rel="stylesheet"> 

      
    <!-- Theme Styles -->
    <link href="Content/concept.min.css" rel="stylesheet"/>
    <link href="Content/scrollbar.css" rel="stylesheet" />
        
</head>
<body style="overflow:auto">   
    <!-- Page Container -->
        <div class="page-container">
            <!-- Page Sidebar -->
            <div class="page-sidebar">
                <div class="page-sidebar-inner">
                    <div class="page-sidebar-menu">
                        <ul>
                            <li>
                                <a id="nagivation" href="javascript:void(0)" data-toggle="tooltip" data-placement="right" title="Navigation"><i class="fas fa-bars fa-lg"></i></a>
                            </li>
                            <li>
                                <a href="#" data-toggle="tooltip" data-placement="right" title="Add Content to Your Feeds"><i class="fas fa-plus fa-lg"></i></a>
                            </li>
                            <li>
                                <a href="#" data-toggle="tooltip" data-placement="right" title="Search"><i class="fas fa-search fa-lg"></i></a>
                            </li>
                            <li>
                                <a href="#" data-toggle="tooltip" data-placement="right" title="Help"><i class="fas fa-question-circle fa-lg"></i></a>
                            </li>
                            <li>
                                <a href="#" data-toggle="tooltip" data-placement="right" title="Theme"><i class="fas fa-moon fa-lg"></i></a>
                            </li>
                            
                        </ul>
                    </div>
                </div>
                <div class="account-menu-btn">
                    <a id="account-setting" href="javascript:void(0)" class="account-menu-link"><i class="fas fa-user-circle fa-3x" ></i></a>
                </div>
                <div class="popver" style="display:none; margin-left: 63px; width:150px; height:120px; position:absolute;bottom:1px;display:none">
                <ul class="account-menu" aria-labelledby="navbarDropdown" style="height:112px">
                    <li>
                        <a href="#"><i class="fas fa-address-card"></i>&nbsp 修改个人资料</a>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-reply"></i>&nbsp 登出</a>
                    </li>
                </ul>
            </div>
            </div>
            <!-- /Page Sidebar -->
            
            <label id ="musername" runat="server" style="display:none"></label>
            <!-- Page Content -->
            <div class="page-content">
                <div class="secondary-sidebar">
                    <div class="secondary-sidebar-menu">
                        <ul class="accordion-menu">
                            <li>
                                <ul>
                                    <li>
                                        <a><br /><br /></a>
                                    </li>
                                    <li>
                                        <a href=""> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="fas fa-calendar"></i>&nbsp &nbsp 今日更新 <br /><br /> </a>
                                    </li>
                                    <li>
                                        <a href="" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="fas fa-bookmark"></i>&nbsp &nbsp 稍后再看</a>
                                    </li>
                                    <li>
                                        <a><br /></a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a> 分类</a>
                                <ul id="rss-father">
                                    <%=LoadCategories() %> 
                                    <li id="li-addcategory">
                                        <a href="javascript:void(0)" id="addcategory" runat="server" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="fas fa-plus"></i> &nbsp&nbsp 新建分类</a>
                                        
                                    </li>
                                    <li>
                                        <a><br /></a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                               <a> 收藏夹</a>
                                <ul>
                                    <%=LoadFavourites() %> 
                                    <li id="li-addfavourite">
                                        <a href="javascript:void(0)" id="addfavourite">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="fas fa-plus"></i> &nbsp&nbsp 新建收藏夹</a>
                                    </li>
                                    <li>
                                        <a><br /></a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="fas fa-clock"></i>&nbsp&nbsp 最近阅读</a>
                            </li>
                            <li>
                                        <a><br /></a>
                            </li>
                        </ul>
                    </div>
                </div>
                 <!-- Page Header -->
                 <div class="page-header" id="pageheader">
                        <nav class="navbar navbar-default navbar-expand-md">
                            <div class="container-fluid">
                                <div class="collapse navbar-collapse justify-content-between" id="bs-example-navbar-collapse-1">
                                    <ul class="nav navbar-nav mr-auto">
                                        <li><a href="javascript:void(0)" id="toggle-fullscreen"><i class="fas fa-expand"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                 <!-- /Page Header -->
                <div class="page-inner no-page-title" id="pageinner">
                    <div id="main-wrapper">

                        </div>
                        <!-- Main Wrapper -->

                    
                <div class="page-footer">
                    <p>2019 &copy; stacks</p>
                </div>
                </div><!-- /Page Inner -->
             </div>
         </div>
             

    <!-- Javascripts -->
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/WebForms/HeaderMenu.js"></script>
</body>
</html>
