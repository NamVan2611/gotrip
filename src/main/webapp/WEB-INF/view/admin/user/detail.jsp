<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
                <meta charset="utf-8" />
                <title>User Detail - Ace Admin</title>

                <meta name="description" content="overview &amp; stats" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

                <!-- bootstrap & fontawesome -->
                <link rel="stylesheet" href="/css/bootstrap.min.css" />
                <link rel="stylesheet" href="/font-awesome/4.2.0/css/font-awesome.min.css" />

                <!-- page specific plugin styles -->

                <!-- text fonts -->
                <link rel="stylesheet" href="/fonts/fonts.googleapis.com.css" />

                <!-- ace styles -->
                <link rel="stylesheet" href="/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
                <script src="/js/ace-extra.min.js"></script>

                <style>
                    .profile-card {
                        background: #fff;
                        border-radius: 12px;
                        padding: 30px;
                        box-shadow: 0px 3px 12px rgba(0, 0, 0, 0.15);
                        margin-bottom: 30px;
                        text-align: center;
                    }

                    .profile-card img {
                        border-radius: 50%;
                        max-width: 180px;
                        height: 180px;
                        object-fit: cover;
                        margin-bottom: 20px;
                        border: 5px solid #f1f1f1;
                    }

                    .profile-info {
                        font-size: 16px;
                        margin-top: 15px;
                    }

                    .profile-info strong {
                        display: inline-block;
                        width: 120px;
                    }
                </style>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        $("#avatarFile").change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL).show();
                        });
                    });
                </script>
            </head>

            <body class="no-skin">

                <jsp:include page="../layout/header.jsp" />
                <div class="main-container" id="main-container">
                    <script type="text/javascript">
                        try { ace.settings.check('main-container', 'fixed') } catch (e) { }
                    </script>

                    <jsp:include page="../layout/sidebar.jsp" />

                    <div class="main-content">
                        <div class="main-content-inner">
                            <div class="breadcrumbs" id="breadcrumbs">
                                <script type="text/javascript">
                                    try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
                                </script>

                                <ul class="breadcrumb">
                                    <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a></li>
                                    <li class="active">User Detail (ID = ${id})</li>
                                </ul>
                            </div>

                            <div class="page-content">
                                <div class="page-header">
                                    <h1>
                                        Thông tin người dùng
                                        <small><i class="ace-icon fa fa-angle-double-right"></i> chi tiết &amp; quản
                                            lý</small>
                                    </h1>
                                </div>

                                <!-- Profile Card -->
                                <div class="row">
                                    <div class="col-xs-12 col-md-8 col-md-offset-2">
                                        <div class="profile-card">
                                            <!-- Avatar -->
                                            <img id="avatarPreview" src="/images/avatar/${user.avatar}" alt="Avatar" />

                                            <!-- User Info -->
                                            <div class="profile-info text-left">
                                                <p><strong>Id:</strong> ${user.id}</p>
                                                <p><strong>Họ tên:</strong> ${user.fullName}</p>
                                                <p><strong>Địa chỉ:</strong> ${user.address}</p>
                                                <p><strong>Email:</strong> ${user.email}</p>
                                                <p><strong>SĐT:</strong> ${user.phone}</p>
                                                <p><strong>Vai trò:</strong> ${user.role.name}</p>
                                            </div>
                                        </div>
                                        <div style="margin-top: 25px;">
                                            <a href="/admin/user" class="btn btn-default">
                                                <i class="fa fa-arrow-left"></i> Quay lại
                                            </a>
                                        </div>
                                    </div>
                                </div>

                            </div><!-- /.page-content -->

                        </div>
                    </div><!-- /.main-content -->

                    <jsp:include page="../layout/footer.jsp" />

                    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
                    </a>
                </div>


                <script src="/js/jquery.2.1.1.min.js"></script>

                <script type="text/javascript">
                    window.jQuery || document.write("<script src='/js/jquery.min.js'>" + "<" + "/script>");
                </script>

                <script type="text/javascript">
                    if ('ontouchstart' in document.documentElement) document.write("<script src='/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
                </script>
                <script src="/js/bootstrap.min.js"></script>

                <script src="/js/jquery-ui.custom.min.js"></script>
                <script src="/js/jquery.ui.touch-punch.min.js"></script>
                <script src="/js/jquery.easypiechart.min.js"></script>
                <script src="/js/jquery.sparkline.min.js"></script>
                <script src="/js/jquery.flot.min.js"></script>
                <script src="/js/jquery.flot.pie.min.js"></script>
                <script src="/js/jquery.flot.resize.min.js"></script>

                <script src="/js/ace-elements.min.js"></script>
                <script src="/js/ace.min.js"></script>

            </body>

            </html>