<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <!-- Required meta tags-->
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <meta name="description" content="Colorlib Templates">
                <meta name="author" content="Colorlib">
                <meta name="keywords" content="Colorlib Templates">

                <!-- Title Page-->
                <title>Au Register Forms by Colorlib</title>

                <!-- Icons font CSS-->
                <link href="/register/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet"
                    media="all">
                <link href="/register/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
                <!-- Font special for pages-->
                <link
                    href="/register/https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
                    rel="stylesheet">

                <!-- Vendor CSS-->
                <link href="/register/vendor/select2/select2.min.css" rel="stylesheet" media="all">
                <link href="/register/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

                <!-- Main CSS-->
                <link href="/register/css/main.css" rel="stylesheet" media="all">
            </head>

            <body>
                <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
                    <div class="wrapper wrapper--w680">
                        <div class="card card-4">
                            <div class="card-body">
                                <h2 class="title">Registration Form</h2>
                                <form:form action="/register" method="POST" modelAttribute="registerUser">
                                    <c:set var="errorConfirmPassword">
                                        <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorEmail">
                                        <form:errors path="email" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorFirstName">
                                        <form:errors path="firstName" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorPassword">
                                        <form:errors path="password" cssClass="invalid-feedback" />
                                    </c:set>
                                    <div class="row row-space">
                                        <div class="col-2">
                                            <div class="input-group">
                                                <label for="inputFirstName">First name</label>
                                                <form:input path="firstName"
                                                    class="input--style-4 form-control ${not empty errorFirstName ? 'is-invalid' : ''}"
                                                    id="inputFirstName" type="text"
                                                    placeholder="Enter your first name" />
                                                ${errorFirstName}
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <label for="inputLastName">Last name</label>
                                            <form:input path="lastName" class="input--style-4 form-control" id="inputLastName"
                                                type="text" placeholder="Enter your last name" />
                                        </div>
                                    </div>
                                    <div class="row row-space">
                                        <div class="col-4">
                                            <div class="input-group">
                                                <label for="inputEmail">Email address</label>
                                                <form:input path="email"
                                                    class="input--style-4 form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                    id="inputEmail" type="email" placeholder="name@example.com" style="width: 550px;"/>
                                                ${errorEmail}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row row-space">
                                        <div class="col-2">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <label for="inputPassword">Password</label>
                                                <form:input path="password"
                                                    class="input--style-4 form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                    id="inputPassword" type="password"
                                                    placeholder="Create a password" />
                                                ${errorPassword}
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <div class="input-group">
                                                <label for="inputPasswordConfirm">Confirm Password</label>
                                                <form:input path="confirmPassword"
                                                    class="input--style-4 form-control ${not empty errorConfirmPassword ? 'is-invalid' : ''}"
                                                    id="inputPasswordConfirm" type="password"
                                                    placeholder="Confirm password" />
                                                ${errorConfirmPassword}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="p-t-15">
                                        <button class="btn btn--radius-2 btn--blue" type="submit">Submit</button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Jquery JS-->
                <script src="/register/vendor/jquery/jquery.min.js"></script>
                <!-- Vendor JS-->
                <script src="/register/vendor/select2/select2.min.js"></script>
                <script src="/register/vendor/datepicker/moment.min.js"></script>
                <script src="/register/vendor/datepicker/daterangepicker.js"></script>

                <!-- Main JS-->
                <script src="/register/js/global.js"></script>

            </body><!-- This templates was made by Colorlib (https://colorlib.com) -->

            </html>
            <!-- end document-->