<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
                <meta charset="utf-8" />
                <title>Dashboard - Ace Admin</title>

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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                                    <li>
                                        <i class="ace-icon fa fa-home home-icon"></i>
                                        <a href="#">Home</a>
                                    </li>
                                    <li class="active">Xóa phòng</li>
                                </ul><!-- /.breadcrumb -->
                            </div>
                            <div class="page-content">
                                <div class="page-header">
                                    <h1>
                                        Xóa phòng
                                        <small>
                                            <i class="ace-icon fa fa-angle-double-right"></i>
                                            overview &amp; stats
                                        </small>
                                    </h1>
                                </div><!-- /.page-header -->
                                <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                                    <div class="col-xs-12">
                                        <form method="post" action="/admin/room/delete">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <div class="alert alert-danger">Bạn có chắc chắn muốn xóa phòng này?</div>
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Tên</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="u" items="${roomsToDelete}">
                                                        <tr>
                                                            <td>
                                                                ${u.id}
                                                                <input type="hidden" name="ids" value="${u.id}" />
                                                            </td>
                                                            <td>${u.roomType}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                            <button type="submit" class="btn btn-danger">Confirm Delete</button>
                                            <a href="/admin/room" class="btn btn-secondary">Cancel</a>
                                        </form>


                                    </div>
                                </div>
                            </div><!-- /.page-content -->
                        </div>
                    </div><!-- /.main-content -->

                    <jsp:include page="../layout/footer.jsp" />

                    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
                    </a>
                </div><!-- /.main-container -->

                <!-- basic scripts -->

                <!--[if !IE]> -->
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