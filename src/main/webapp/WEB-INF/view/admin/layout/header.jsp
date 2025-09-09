<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div id="navbar" class="navbar navbar-default">
            <script type="text/javascript">
                try { ace.settings.check('navbar', 'fixed') } catch (e) { }
            </script>

            <div class="navbar-container" id="navbar-container">
                <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler"
                    data-target="#sidebar">
                    <span class="sr-only">Toggle sidebar</span>

                    <span class="icon-bar"></span>

                    <span class="icon-bar"></span>

                    <span class="icon-bar"></span>
                </button>

                <div class="navbar-buttons navbar-header pull-right" role="navigation">
                    <ul class="nav ace-nav">
                        <c:if test="${not empty pageContext.request.userPrincipal}">
                            <li class="purple">
                                <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                                    <small id="fullName">Welcome ${sessionScope.fullName}</small>
                                    <i class="ace-icon fa fa-caret-down"></i>
                                </a>

                                <ul
                                    class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                                    <li>
                                        <a href="/">
                                            <i class="ace-icon fa fa-cog"></i>
                                            Home
                                        </a>
                                    </li>

                                    <li>
                                        <a href="profile.html">
                                            <i class="ace-icon fa fa-user"></i>
                                            Profile
                                        </a>
                                    </li>

                                    <li class="divider"></li>

                                    <li>
                                        <form action="/logout" method="POST">
                                            <div class="form-floating mb-3">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                            </div>
                                            <button class="btn btn-default dropdown-item" style="width: 160px;"
                                                type="submit">Log out</button>
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        </c:if>

                    </ul>
                </div>
            </div><!-- /.navbar-container -->
        </div>