<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedManager.aspx.cs" Inherits="Feed_Manager.FeedManager" %>

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
<body style="overflow:hidden">   
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
                <div class="popver" style="display:none; margin-left: 63px; width:150px; height:120px; position:absolute;bottom:1px">
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
                                <ul>
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
                        <div class="content-header">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb breadcrumb-style-1">
                                    <li class="breadcrumb-item">Home</li>
                                    <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                                </ol>
                            </nav>
                            <h1 class="page-title">Dashboard</h1>
                        </div>
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Monthly Earnings</h5>
                                        <div id="apex1"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Trending Services</h5>
                                        <div class="trending-services">
                                            <ul class="list-unstyled slimscroll">
                                                <li>Social Network<div class="text-success float-right">32%<i class="fa fa-level-up"></i></div></li>
                                                <li>File Management<div class="text-success float-right">25%<i class="fa fa-level-up"></i></div></li>
                                                <li>Search Engine<div class="text-success float-right">16%<i class="fa fa-level-up"></i></div></li>
                                                <li>Calendar<div class="text-danger float-right">4%<i class="fa fa-level-down"></i></div></li>
                                                <li>Todo App<div class="text-danger float-right">17%<i class="fa fa-level-down"></i></div></li>
                                                <li>Mailbox<div class="text-success float-right">14%<i class="fa fa-level-up"></i></div></li>
                                                <li>Travel Guide<div class="text-danger float-right">9%<i class="fa fa-level-down"></i></div></li>
                                                <li>Finances App<div class="text-danger float-right">27%<i class="fa fa-level-down"></i></div></li>
                                                <li>Online Wallet<div class="text-success float-right">16%<i class="fa fa-level-up"></i></div></li>
                                                <li>Others<div class="text-success float-right">9%<i class="fa fa-level-up"></i></div></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="alert alert-info alert-dismissible fade show m-b-md" role="alert">
                                    Activity reports have been updated 2 days ago. <a href="#" class="alert-link">Click here</a> to see the old data.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="info-card">
                                            <h4 class="info-title">Sales Today<span class="info-stats">45.6k</span></h4>
                                            <div class="progress" style="height: 3px;">
                                                <div class="progress-bar bg-info" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="info-card">
                                            <h4 class="info-title">Support Questions<span class="info-stats">1.2k</span></h4>
                                            <div class="progress" style="height: 3px;">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 45%" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="info-card">
                                            <h4 class="info-title">New Members<span class="info-stats">2.4k</span></h4>
                                            <div class="progress" style="height: 3px;">
                                                <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Last Orders</h5>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Product</th>
                                                        <th scope="col">Customer</th>
                                                        <th scope="col">Date</th>
                                                        <th scope="col">Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">07809</th>
                                                        <td>Alpha - Angular 8</td>
                                                        <td>Chritopher Palmer</td>
                                                        <td>Dec 15, 2019</td>
                                                        <td><span class="badge badge-info">In Progress</span></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">07068</th>
                                                        <td>Modern - PSD</td>
                                                        <td>Stuart Woodley</td>
                                                        <td>Nov 29, 2019</td>
                                                        <td><span class="badge badge-info">In Progress</span></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">08392</th>
                                                        <td>Mobile App Theme</td>
                                                        <td>Murphy Cartwright</td>
                                                        <td>Nov 12, 2019</td>
                                                        <td><span class="badge badge-success">Finished</span></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">09415</th>
                                                        <td>CRM Application</td>
                                                        <td>Gurpreet Holder</td>
                                                        <td>Jul 8, 2019</td>
                                                        <td><span class="badge badge-danger">Canceled</span></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">08678</th>
                                                        <td>Crypto Exchange</td>
                                                        <td>Marshall Wheeler</td>
                                                        <td>Feb 17, 2019</td>
                                                        <td><span class="badge badge-danger">Canceled</span></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">08446</th>
                                                        <td>Alpha - Bootstrap Version</td>
                                                        <td>Nikki Blanchard</td>
                                                        <td>Dec 26, 2018</td>
                                                        <td><span class="badge badge-success">Finished</span></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>      
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- Main Wrapper -->

                    
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
