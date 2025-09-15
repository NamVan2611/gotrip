<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!doctype html>
            <html class="no-js" lang="zxx">

            <head>
                <meta charset="utf-8">
                <meta http-equiv="x-ua-compatible" content="ie=edge">
                <title>Go Trip</title>
                <meta name="description" content="">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="manifest" href="site.webmanifest">
                <link rel="shortcut icon" type="image/x-icon" href="/client/img/favicon.ico">

                <!-- CSS here -->
                <link rel="stylesheet" href="/client/css/bootstrap.min.css">
                <link rel="stylesheet" href="/client/css/owl.carousel.min.css">
                <link rel="stylesheet" href="/client/css/flaticon.css">
                <link rel="stylesheet" href="/client/css/slicknav.css">
                <link rel="stylesheet" href="/client/css/animate.min.css">
                <link rel="stylesheet" href="/client/css/magnific-popup.css">
                <link rel="stylesheet" href="/client/css/fontawesome-all.min.css">
                <link rel="stylesheet" href="/client/css/themify-icons.css">
                <link rel="stylesheet" href="/client/css/slick.css">
                <link rel="stylesheet" href="/client/css/nice-select.css">
                <link rel="stylesheet" href="/client/css/style.css">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />

                <div class="container mt-5 mb-100">
                    <div class="col-lg-6 mx-auto">
                        <div class="booking-card">
                            <h3 class="mb-4 text-center fw-bold text-primary">Đặt Phòng</h3>

                            <!-- Thông tin phòng -->
                            <div class="room-info">
                                <h5 class="mb-1">${room.roomType}</h5>
                                <p class="mb-0 text-muted">Giá: <strong>${room.price}</strong> VND / đêm</p>
                            </div>

                            <!-- Form booking -->
                            <form method="post" action="${pageContext.request.contextPath}/booking/room/${room.id}">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="hidden" name="checkInDate" value="${checkInDate}">
                                <input type="hidden" name="checkOutDate" value="${checkOutDate}">

                                <div class="mb-3">
                                    <label class="form-label fw-semibold">Ngày Check-in</label>
                                    <input type="text" class="form-control" value="${checkInDate}" readonly>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-semibold">Ngày Check-out</label>
                                    <input type="text" class="form-control" value="${checkOutDate}" readonly>
                                </div>

                                <button type="submit" class="btn btn-gradient w-100">Xác nhận đặt phòng</button>
                            </form>

                        </div>
                    </div>
                </div>

                <jsp:include page="../layout/footer.jsp" />

                <!-- JS here -->
                <script src="/client/js/vendor/modernizr-3.5.0.min.js"></script>
                <script src="/client/js/vendor/jquery-1.12.4.min.js"></script>
                <script src="/client/js/popper.min.js"></script>
                <script src="/client/js/bootstrap.min.js"></script>
                <script src="/client/js/jquery.slicknav.min.js"></script>
                <script src="/client/js/owl.carousel.min.js"></script>
                <script src="/client/js/slick.min.js"></script>
                <script src="/client/js/wow.min.js"></script>
                <script src="/client/js/animated.headline.js"></script>
                <script src="/client/js/jquery.magnific-popup.js"></script>
                <script src="/client/js/jquery.scrollUp.min.js"></script>
                <script src="/client/js/jquery.nice-select.min.js"></script>
                <script src="/client/js/jquery.sticky.js"></script>
                <script src="/client/js/contact.js"></script>
                <script src="/client/js/jquery.form.js"></script>
                <script src="/client/js/jquery.validate.min.js"></script>
                <script src="/client/js/mail-script.js"></script>
                <script src="/client/js/jquery.ajaxchimp.min.js"></script>
                <script src="/client/js/plugins.js"></script>
                <script src="/client/js/main.js"></script>

            </body>

            </html>