<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!doctype html>
            <html class="no-js" lang="zxx">

            <head>
                <meta charset="utf-8">
                <meta http-equiv="x-ua-compatible" content="ie=edge">
                <title>Go Trip - Đặt phòng thành công</title>
                <meta name="viewport" content="width=device-width, initial-scale=1">

                <!-- CSS here -->
                <link rel="stylesheet" href="/client/css/bootstrap.min.css">
                <link rel="stylesheet" href="/client/css/fontawesome-all.min.css">
                <link rel="stylesheet" href="/client/css/style.css">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />

                <main class="container my-5">
                    <div class="col-lg-8 mx-auto text-center">
                        <div class="alert alert-success p-5 shadow rounded-4">
                            <i class="fas fa-check-circle fa-4x text-success mb-3"></i>
                            <h2 class="fw-bold mb-3">Đặt phòng thành công!</h2>
                            <p class="lead mb-4">
                                Cảm ơn bạn đã tin tưởng GoTrip. Thông tin đặt phòng đã được ghi nhận và sẽ sớm được xác
                                nhận.
                            </p>
                            <div class="d-flex justify-content-center gap-3 mb-15">
                                <a href="/" class="btn btn-outline-primary px-4">Về trang chủ</a>
                            </div>
                            <div class="d-flex justify-content-center gap-3">
                                <a href="/user/bookings" class="btn btn-primary px-4">Xem đơn đặt phòng</a>
                            </div>
                        </div>
                    </div>
                </main>

                <jsp:include page="../layout/footer.jsp" />

                <!-- JS here -->
                <script src="/client/js/vendor/jquery-1.12.4.min.js"></script>
                <script src="/client/js/bootstrap.min.js"></script>
                <script src="/client/js/plugins.js"></script>
                <script src="/client/js/main.js"></script>
            </body>

            </html>