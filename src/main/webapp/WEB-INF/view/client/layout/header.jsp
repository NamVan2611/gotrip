<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <header>
                <!-- Header Start -->
                <div class="header-area">
                    <div class="main-header">
                        <div class="header-top top-bg d-none d-lg-block">
                            <div class="container">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-lg-8">
                                        <div class="header-info-left">
                                            <ul>
                                                <li>needhelp@gotrip.com</li>
                                                <li>666 569 025077</li>
                                                <li>broklyn street new york</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="header-info-right f-right">
                                            <ul class="header-social">
                                                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                                <li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Header bottom -->
                        <div class="header-bottom header-sticky">
                            <div class="container">
                                <div class="row align-items-center">
                                    <!-- Logo -->
                                    <div class="col-xl-2 col-lg-2 col-md-1">
                                        <div class="logo">
                                            <a href="/"><img src="/client/img/logo/logo.png" alt="Logo"></a>
                                        </div>
                                    </div>

                                    <div class="col-xl-10 col-lg-10 col-md-10">
                                        <!-- Nếu user đã đăng nhập -->
                                        <c:if test="${not empty pageContext.request.userPrincipal}">
                                            <div class="d-flex justify-content-end align-items-center">
                                                <nav class="me-4">
                                                    <ul id="navigation" class="d-flex list-unstyled mb-0">
                                                        <li class="me-3"><a href="/" class="text-dark">Home</a></li>
                                                        <li class="me-3"><a href="/order-history" class="text-dark">Booking history</a>
                                                        </li>
                                                        <c:if test="${pageContext.request.isUserInRole('ADMIN')}">
                                                            <li class="me-3"><a
                                                                    href="/admin" class="text-dark">Dashboard</a></li>
                                                        </c:if>
                                                    </ul>
                                                </nav>

                                                <!-- Avatar dropdown -->
                                                <div class="dropdown">
                                                    <a href="#" class="d-flex align-items-center dropdown-toggle"
                                                        id="userDropdown" data-bs-toggle="dropdown"
                                                        aria-expanded="false">
                                                        <img src="/images/avatar/${sessionScope.avatar}"
                                                            class="rounded-circle"
                                                            style="width:40px; height:40px; object-fit:cover;">
                                                    </a>
                                                    <ul class="dropdown-menu dropdown-menu-end"
                                                        aria-labelledby="userDropdown">
                                                        <li class="dropdown-item text-center fw-bold">
                                                            <c:out value="${sessionScope.fullName}" />
                                                        </li>
                                                        <li>
                                                            <hr class="dropdown-divider">
                                                        </li>
                                                        <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>
                                                            <hr class="dropdown-divider">
                                                        </li>
                                                        <li>
                                                            <form action="/logout" method="POST" class="m-0">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <button type="submit" class="dropdown-item">Đăng
                                                                    xuất</button>
                                                            </form>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </c:if>

                                        <!-- Nếu chưa đăng nhập -->
                                        <c:if test="${empty pageContext.request.userPrincipal}">
                                            <div class="d-flex justify-content-end align-items-center">
                                                <a href="/login" class="btn btn-outline-primary">Đăng nhập</a>
                                            </div>
                                        </c:if>
                                    </div>

                                    <!-- Mobile menu -->
                                    <div class="col-12">
                                        <div class="mobile_menu d-block d-lg-none"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Header End -->
            </header>