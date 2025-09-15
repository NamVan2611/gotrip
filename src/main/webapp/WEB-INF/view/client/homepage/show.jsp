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
                <script>
                    function goToResortPage(event) {
                        event.preventDefault();

                        const resortId = document.getElementById("resortId").value;
                        const checkIn = document.getElementById("checkIn").value;
                        const checkOut = document.getElementById("checkOut").value;

                        if (!resortId || !checkIn || !checkOut) {
                            alert("Vui lòng chọn Resort và nhập ngày Check-in, Check-out!");
                            return false;
                        }
                        if (new Date(checkOut) <= new Date(checkIn)) {
                            alert("Ngày Check-out phải sau ngày Check-in!");
                            return false;
                        }
                        const url = "/resort/" + resortId + "/" + encodeURIComponent(checkIn) + "/" + encodeURIComponent(checkOut);
                        window.location.href = url;
                        return true;
                    }

                    function selectResort(resortId) {
                        console.log("Clicked resort:", resortId);
                        const select = document.getElementById("resortId");
                        if (select) {
                            for (let i = 0; i < select.options.length; i++) {
                                if (select.options[i].value === resortId.toString()) {
                                    select.selectedIndex = i;
                                    console.log("Selected:", select.options[i].text);
                                    break;
                                }
                            }
                            if (window.jQuery && $(select).hasClass('nice-select')) {
                                $(select).niceSelect('update');
                            }
                        }
                        const form = document.getElementById("bookingForm");
                        if (form) {
                            form.scrollIntoView({ behavior: "smooth", block: "center" });
                        }
                    }
                </script>
                <style>
                    .custom-resort-select {
                        border: 1px solid rgba(0, 0, 0, 0.15);
                        border-radius: 5px;
                        padding: 0.5rem 0.75rem;
                        box-shadow: none;
                        transition: border-color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
                    }

                    .custom-resort-select:focus {
                        border-color: #80bdff;
                        box-shadow: 0 0 0 0.15rem rgba(0, 123, 255, 0.25);
                    }
                </style>

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
                <main>

                    <!-- slider Area Start-->
                    <jsp:include page="../layout/banner.jsp" />
                    <div class="favourite-place place-padding">
                        <div class="container">
                            <!-- Search Box -->
                            <div class="row" style="margin-bottom: 200px;">
                                <div class="col-lg-12">
                                    <div class="section-tittle text-center">
                                        <h2>Book now</h2>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <!-- Search Form -->
                                    <form id="bookingForm" onsubmit="return goToResortPage(event)">
                                        <div class="row g-3 align-items-end">
                                            <!-- Resort -->
                                            <div class="col-lg-3 col-md-6">
                                                <label for="resortId" class="form-label fw-semibold">Resort</label>
                                                <select name="resortId" id="resortId"
                                                    class="form-select custom-resort-select" required>
                                                    <option value="">-- Chọn Resort --</option>
                                                    <c:forEach var="res" items="${resorts}">
                                                        <option value="${res.id}">${res.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <!-- Check-in -->
                                            <div class="col-lg-3 col-md-6">
                                                <label for="checkIn" class="form-label fw-semibold">Check-in</label>
                                                <input type="date" id="checkIn" name="checkIn" class="form-control"
                                                    required>
                                            </div>

                                            <!-- Check-out -->
                                            <div class="col-lg-3 col-md-6">
                                                <label for="checkOut" class="form-label fw-semibold">Check-out</label>
                                                <input type="date" id="checkOut" name="checkOut" class="form-control"
                                                    required>
                                            </div>

                                            <!-- Nút search -->
                                            <div class="col-lg-3 col-md-6 d-grid">
                                                <button type="submit" class="btn btn-primary">
                                                    <i class="fas fa-search me-1"></i> Search
                                                </button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                            <!-- Section Tittle -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="section-tittle text-center">
                                        <span>FEATURED TOURS Packages</span>
                                        <h2>Favourite Places</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <c:forEach var="resort" items="${resorts}">
                                    <div class="col-md-6 col-lg-3 col-xl-4" style="margin-bottom: 60px;">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/images/resort/${resort.image}"
                                                    class="img-fluid w-100 rounded-top"
                                                    style="height: 200px; object-fit: cover;" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                style="top: 10px; left: 10px;">Resort</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4 style="font-size: 15px">
                                                    <a href="javascript:void(0);"
                                                        onclick="selectResort('${resort.id}')">
                                                        ${resort.name}
                                                    </a>
                                                </h4>

                                                <p style="font-size: 13px">${resort.description}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <!-- Favourite Places End -->
                    <!-- Video Start Arera -->
                    <jsp:include page="../layout/feature.jsp" />
                </main>
                <jsp:include page="../layout/footer.jsp" />
                <!-- JS here -->

                <!-- All JS Custom Plugins Link Here here -->
                <script src="./client/js/vendor/modernizr-3.5.0.min.js"></script>

                <!-- Jquery, Popper, Bootstrap -->
                <script src="./client/js/vendor/jquery-1.12.4.min.js"></script>
                <script src="./client/js/popper.min.js"></script>
                <script src="./client/js/bootstrap.min.js"></script>
                <!-- Jquery Mobile Menu -->
                <script src="./client/js/jquery.slicknav.min.js"></script>

                <!-- Jquery Slick , Owl-Carousel Plugins -->
                <script src="./client/js/owl.carousel.min.js"></script>
                <script src="./client/js/slick.min.js"></script>
                <!-- One Page, Animated-HeadLin -->
                <script src="./client/js/wow.min.js"></script>
                <script src="./client/js/animated.headline.js"></script>
                <script src="./client/js/jquery.magnific-popup.js"></script>

                <!-- Scrollup, nice-select, sticky -->
                <script src="./client/js/jquery.scrollUp.min.js"></script>
                <script src="./client/js/jquery.nice-select.min.js"></script>
                <script src="./client/js/jquery.sticky.js"></script>

                <!-- contact js -->
                <script src="./client/js/contact.js"></script>
                <script src="./client/js/jquery.form.js"></script>
                <script src="./client/js/jquery.validate.min.js"></script>
                <script src="./client/js/mail-script.js"></script>
                <script src="./client/js/jquery.ajaxchimp.min.js"></script>

                <!-- Jquery Plugins, main Jquery -->
                <script src="./client/js/plugins.js"></script>
                <script src="./client/js/main.js"></script>

            </body>

            </html>