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
                <main>

                    <!-- slider Area Start-->
                    <jsp:include page="../layout/banner.jsp" />
                    <!-- slider Area End-->
                    <!-- Our Services Start -->
                    <div class="our-services servic-padding">
                        <div class="container">
                            <div class="row d-flex justify-contnet-center">
                                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                                    <div class="single-services text-center mb-30">
                                        <div class="services-ion">
                                            <span class="flaticon-tour"></span>
                                        </div>
                                        <div class="services-cap">
                                            <h5>8000+ Our Local<br>Guides</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                                    <div class="single-services text-center mb-30">
                                        <div class="services-ion">
                                            <span class="flaticon-pay"></span>
                                        </div>
                                        <div class="services-cap">
                                            <h5>100% Trusted Tour<br>Agency</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                                    <div class="single-services text-center mb-30">
                                        <div class="services-ion">
                                            <span class="flaticon-experience"></span>
                                        </div>
                                        <div class="services-cap">
                                            <h5>28+ Years of Travel<br>Experience</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                                    <div class="single-services text-center mb-30">
                                        <div class="services-ion">
                                            <span class="flaticon-good"></span>
                                        </div>
                                        <div class="services-cap">
                                            <h5>98% Our Travelers<br>are Happy</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Our Services End -->
                    <!-- Favourite Places Start -->
                    <div class="favourite-place place-padding">
                        <div class="container">
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
                                                    <a href="/resort/${resort.id}">
                                                        ${resort.name}
                                                    </a>
                                                </h4>
                                                <p style="font-size: 13px">${resort.description}</p>
                                                <div class="d-flex justify-content-center flex-lg-wrap flex-column">
                                                    <form action="/add-resort-to-cart/${resort.id}" method="post">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                        <button type="submit"
                                                            class="mx-auto btn border border-secondary rounded-pill px-3 text-primary">
                                                            <i class="fa fa-shopping-bag me-2 text-primary"></i> Book
                                                            now
                                                        </button>
                                                    </form>

                                                    <!-- <input type="hidden" name="quantity"
                                                                        id="cartDetails0.quantity" value="1" />
                                                                    <button data-resort-id="${resort.id}"
                                                                        class="btnAddToCartHomepage mx-auto btn border border-secondary rounded-pill px-3 text-primary">
                                                                        <i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart
                                                                    </button> -->
                                                </div>
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