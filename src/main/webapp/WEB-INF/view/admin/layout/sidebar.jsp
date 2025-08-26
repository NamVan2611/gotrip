<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div id="sidebar" class="sidebar                  responsive">
            <script type="text/javascript">
                try { ace.settings.check('sidebar', 'fixed') } catch (e) { }
            </script>


            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    <button class="btn btn-success">
                        <i class="ace-icon fa fa-signal"></i>
                    </button>

                    <button class="btn btn-info">
                        <i class="ace-icon fa fa-pencil"></i>
                    </button>

                    <button class="btn btn-warning">
                        <i class="ace-icon fa fa-users"></i>
                    </button>

                    <button class="btn btn-danger">
                        <i class="ace-icon fa fa-cogs"></i>
                    </button>
                </div>

                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>

                    <span class="btn btn-info"></span>

                    <span class="btn btn-warning"></span>

                    <span class="btn btn-danger"></span>
                </div>
            </div><!-- /.sidebar-shortcuts -->

            <ul class="nav nav-list">
                <li>
                    <a href="/admin">
                        <i class="menu-icon fa fa-tachometer"></i>
                        <span class="menu-text"> Dashboard </span>
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class=""> <!-- Thêm class open để nó mở -->
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-list"></i>
                        <span class="menu-text"> Manage </span>
                        <b class="arrow fa fa-angle-down"></b>
                    </a>
                    <b class="arrow"></b>

                    <ul class="submenu">
                        <li>
                            <a href="/admin/user">
                                <i class="menu-icon fa fa-caret-right"></i>
                                User
                            </a>
                        </li>

                        <li>
                            <a href="/admin/resort">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Resort
                            </a>
                        </li>
                    </ul>
                </li>


                <li class="">
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-pencil-square-o"></i>
                        <span class="menu-text"> Forms </span>

                        <b class="arrow fa fa-angle-down"></b>
                    </a>

                    <b class="arrow"></b>

                    <ul class="submenu">
                        <li class="">
                            <a href="form-elements.html">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Form Elements
                            </a>

                            <b class="arrow"></b>
                        </li>

                        <li class="">
                            <a href="form-elements-2.html">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Form Elements 2
                            </a>

                            <b class="arrow"></b>
                        </li>

                        <li class="">
                            <a href="form-wizard.html">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Wizard &amp; Validation
                            </a>

                            <b class="arrow"></b>
                        </li>

                        <li class="">
                            <a href="wysiwyg.html">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Wysiwyg &amp; Markdown
                            </a>

                            <b class="arrow"></b>
                        </li>

                        <li class="">
                            <a href="dropzone.html">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Dropzone File Upload
                            </a>

                            <b class="arrow"></b>
                        </li>
                    </ul>
                </li>
                <b class="arrow"></b>
                </li>

            </ul><!-- /.nav-list -->

            <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
                <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left"
                    data-icon2="ace-icon fa fa-angle-double-right"></i>
            </div>

            <script type="text/javascript">
                try { ace.settings.check('sidebar', 'collapsed') } catch (e) { }
            </script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    let links = document.querySelectorAll(".nav-list li a");

                    links.forEach(link => {
                        link.addEventListener("click", function (e) {
                            // Nếu là dropdown-toggle (vd: Manage) thì chỉ toggle submenu, không reload
                            if (this.classList.contains("dropdown-toggle")) {
                                e.preventDefault(); // chặn reload
                                this.parentElement.classList.toggle("open"); // mở/đóng submenu
                                return; // dừng ở đây, không chạy xuống dưới
                            }

                            // Nếu là link bình thường (Dashboard, User, Resort, ...) thì cứ để load trang,
                            // nhưng trước đó có thể highlight ngay
                            document.querySelectorAll(".nav-list li").forEach(li => li.classList.remove("active"));
                            this.parentElement.classList.add("active");

                            // Nếu nằm trong submenu -> cũng đánh dấu cha
                            let parentLi = this.closest("ul.submenu")?.parentElement;
                            if (parentLi) {
                                parentLi.classList.add("active");
                                parentLi.classList.add("open");
                            }
                        });
                    });

                    // --- Khi load lại trang: set active theo URL ---
                    let currentUrl = window.location.pathname;
                    links.forEach(link => {
                        if (link.getAttribute("href") === currentUrl) {
                            document.querySelectorAll(".nav-list li").forEach(li => li.classList.remove("active"));
                            link.parentElement.classList.add("active");

                            let parentLi = link.closest("ul.submenu")?.parentElement;
                            if (parentLi) {
                                parentLi.classList.add("active");
                                parentLi.classList.add("open");
                            }
                        }
                    });
                });

            </script>


        </div>