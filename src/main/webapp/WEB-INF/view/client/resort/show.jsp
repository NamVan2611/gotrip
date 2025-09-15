<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!doctype html>
            <html class="no-js" lang="zxx">

            <head>
                <meta charset="utf-8">
                <meta http-equiv="x-ua-compatible" content="ie=edge">
                <title>Go Trip </title>
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
                <!-- Preloader Start -->
                <div id="preloader-active">
                    <div class="preloader d-flex align-items-center justify-content-center">
                        <div class="preloader-inner position-relative">
                            <div class="preloader-circle"></div>
                            <div class="preloader-img pere-text">
                                <img src="/client/img/logo/logo.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="../layout/header.jsp" />
                <!-- Preloader Start -->
                <main class="container my-4">
                    <!-- Resort Info -->
                    <div class="resort-info mb-5">
                        <div class="row align-items-center bg-light rounded shadow-sm p-4">
                            <!-- Resort Image -->
                            <div class="col-md-6 text-center mb-3 mb-md-0">
                                <img src="/images/resort/${resort.image}" alt="${resort.name}"
                                    class="img-fluid rounded shadow-lg" style="max-height: 320px; object-fit: cover;">
                            </div>

                            <!-- Resort Details -->
                            <div class="col-md-6">
                                <h2 class="fw-bold text-primary mb-3">
                                    <c:out value="${resort.name}" />
                                </h2>
                                <p class="text-muted mb-3">
                                    <c:out value="${resort.description}" />
                                </p>
                                <p class="mb-1">
                                    <i class="fas fa-envelope text-secondary me-2"></i>
                                    <span class="fw-semibold">
                                        <c:out value="${resort.email}" />
                                    </span>
                                </p>
                                <p>
                                    <i class="fas fa-phone text-success me-2"></i>
                                    <span class="fw-semibold">
                                        <c:out value="${resort.phone}" />
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Room List -->
                    <div class="room-list">
                        <h3 class="fw-bold text-center text-dark mb-4">Danh sách phòng</h3>
                        <c:forEach var="room" items="${roomList}">
                            <div class="card mb-4 border-0 shadow-sm hover-shadow">
                                <div class="row g-0 align-items-center">
                                    <!-- Room Image -->
                                    <div class="col-md-4">
                                        <img src="/images/room/${room.image}" class="img-fluid rounded-start"
                                            alt="${room.roomType}" style="height:220px; width:100%; object-fit:cover;">
                                    </div>

                                    <!-- Room Info -->
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title fw-bold text-primary">
                                                <c:out value="${room.roomType}" />
                                            </h5>
                                            <p class="card-text mb-1">
                                                <i class="fas fa-door-open me-2 text-secondary"></i>
                                                Phòng số:
                                                <c:out value="${room.roomNumber}" />
                                            </p>
                                            <p class="card-text mb-1">
                                                <i class="fas fa-door-open me-2 text-secondary"></i>
                                                Tình trạng:
                                                <c:out value="${room.status}" />
                                            </p>
                                            <p class="card-text mb-2">
                                                <i class="fas fa-money-bill-wave me-2 text-success"></i>
                                                Giá: <span class="text-danger fw-semibold">
                                                    <fmt:formatNumber value="${room.price}" type="currency" />
                                                </span>
                                            </p>
                                            <form method="get" action="/booking/room/${room.id}">
                                                <input type="hidden" name="checkInDate" value="${checkInDate}">
                                                <input type="hidden" name="checkOutDate" value="${checkOutDate}">
                                                <button type="submit" class="btn btn-gradient btn-primary">
                                                    <i class="fas fa-calendar-check me-1"></i> Đặt phòng
                                                </button>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </main>

                <jsp:include page="../layout/footer.jsp" />
                <!-- JS here -->

                <!-- All JS Custom Plugins Link Here here -->
                <script src="/client/js/vendor/modernizr-3.5.0.min.js"></script>

                <!-- Jquery, Popper, Bootstrap -->
                <script src="/client/js/vendor/jquery-1.12.4.min.js"></script>
                <script src="/client/js/popper.min.js"></script>
                <script src="/client/js/bootstrap.min.js"></script>
                <!-- Jquery Mobile Menu -->
                <script src="/client/js/jquery.slicknav.min.js"></script>

                <!-- Jquery Slick , Owl-Carousel Plugins -->
                <script src="/client/js/owl.carousel.min.js"></script>
                <script src="/client/js/slick.min.js"></script>
                <!-- One Page, Animated-HeadLin -->
                <script src="/client/js/wow.min.js"></script>
                <script src="/client/js/animated.headline.js"></script>
                <script src="/client/js/jquery.magnific-popup.js"></script>

                <!-- Scrollup, nice-select, sticky -->
                <script src="/client/js/jquery.scrollUp.min.js"></script>
                <script src="/client/js/jquery.nice-select.min.js"></script>
                <script src="/client/js/jquery.sticky.js"></script>

                <!-- contact js -->
                <script src="/client/js/contact.js"></script>
                <script src="/client/js/jquery.form.js"></script>
                <script src="/client/js/jquery.validate.min.js"></script>
                <script src="/client/js/mail-script.js"></script>
                <script src="/client/js/jquery.ajaxchimp.min.js"></script>

                <!-- Jquery Plugins, main Jquery -->
                <script src="/client/js/plugins.js"></script>
                <script src="/client/js/main.js"></script>

            </body>

            </html>