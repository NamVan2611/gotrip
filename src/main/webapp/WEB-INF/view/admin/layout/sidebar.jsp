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
                        <li>
                            <a href="/admin/room">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Room
                            </a>
                        </li>
                        <li>
                            <a href="/admin/booking">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Booking
                            </a>
                        </li>
                        <li>
                            <a href="/admin/service">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Service
                            </a>
                        </li>
                    </ul>
                <li>
                    <a href="/admin/chatbot">
                        <i class="menu-icon bi bi-robot">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-robot" viewBox="0 0 16 16">
                                <path
                                    d="M6 12.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5M3 8.062C3 6.76 4.235 5.765 5.53 5.886a26.6 26.6 0 0 0 4.94 0C11.765 5.765 13 6.76 13 8.062v1.157a.93.93 0 0 1-.765.935c-.845.147-2.34.346-4.235.346s-3.39-.2-4.235-.346A.93.93 0 0 1 3 9.219zm4.542-.827a.25.25 0 0 0-.217.068l-.92.9a25 25 0 0 1-1.871-.183.25.25 0 0 0-.068.495c.55.076 1.232.149 2.02.193a.25.25 0 0 0 .189-.071l.754-.736.847 1.71a.25.25 0 0 0 .404.062l.932-.97a25 25 0 0 0 1.922-.188.25.25 0 0 0-.068-.495c-.538.074-1.207.145-1.98.189a.25.25 0 0 0-.166.076l-.754.785-.842-1.7a.25.25 0 0 0-.182-.135" />
                                <path
                                    d="M8.5 1.866a1 1 0 1 0-1 0V3h-2A4.5 4.5 0 0 0 1 7.5V8a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1v1a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-1a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1v-.5A4.5 4.5 0 0 0 10.5 3h-2zM14 7.5V13a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V7.5A3.5 3.5 0 0 1 5.5 4h5A3.5 3.5 0 0 1 14 7.5" />
                            </svg>
                        </i>
                        <span class="menu-text"> Chatbot </span>
                    </a>
                </li>
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