<%@page contentType="text/html" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
			<!DOCTYPE html>
			<html lang="en">

			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
				<meta charset="utf-8" />
				<link rel="shortcut icon" type="image/x-icon" href="/client/img/favicon.ico">
				<title>Dashboard - Ace Admin</title>

				<meta name="description" content="overview &amp; stats" />
				<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
				<link rel="stylesheet" href="/css/bootstrap.min.css" />
				<link rel="stylesheet" href="/font-awesome/4.2.0/css/font-awesome.min.css" />
				<link rel="stylesheet" href="/fonts/fonts.googleapis.com.css" />
				<link rel="stylesheet" href="/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
				<script src="/js/ace-extra.min.js"></script>
			</head>

			<body class="no-skin">

				<jsp:include page="../layout/header.jsp" />
				<div class="main-container" id="main-container">
					<script type="text/javascript">
						try { ace.settings.check('main-container', 'fixed') } catch (e) { }
					</script>

					<jsp:include page="../layout/sidebar.jsp" />

					<div class="main-content">
						<div class="main-content-inner">
							<div class="breadcrumbs" id="breadcrumbs">
								<script type="text/javascript">
									try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
								</script>

								<ul class="breadcrumb">
									<li>
										<i class="ace-icon fa fa-home home-icon"></i>
										<a href="#">Home</a>
									</li>
									<li class="active">Dashboard</li>
								</ul><!-- /.breadcrumb -->

							</div>

							<div class="page-content">
								<div class="page-header">
									<h1>
										Danh sách người dùng
										<small>
											<i class="ace-icon fa fa-angle-double-right"></i>
											overview &amp; stats
										</small>
									</h1>
								</div><!-- /.page-header -->
								<div class="row">
									<div class="col-xs-12">
										<form id="deleteForm" method="post" action="/admin/user/delete/confirm">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											<div class="pull-right"
												style="font-family: 'Times New Roman', Times, serif;">
												<a href="/admin/user/create">
													<button type="button" class="btn btn-success" fdprocessedid="b81s1">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
															fill="currentColor" class="bi bi-person-add"
															viewBox="0 0 16 16">
															<path
																d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4" />
															<path
																d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z" />
														</svg>
														Thêm người dùng
													</button>
												</a>
												<button type="button" class="btn btn-primary" fdprocessedid="5jng"
													id="btnDeleteSelected">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														fill="currentColor" class="bi bi-person-dash"
														viewBox="0 0 16 16">
														<path
															d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4" />
														<path
															d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z" />
													</svg>
													Xóa người dùng
												</button>
											</div>
											<div class="row" style="margin-bottom: 360px; margin-top: 55px;">
												<div class="col-xs-12">
													<table id="simple-table"
														class="table table-striped table-bordered table-hover">
														<thead>
															<tr>
																<th class="center">
																	<label class="pos-rel">
																		<input type="checkbox" id="checkAll"
																			class="ace">
																		<span class="lbl"></span>
																	</label>
																</th>
																<th>ID</th>
																<th>Tên người dùng</th>
																<th>Email</th>
																<th>Vai trò</th>
																<th>Thao tác</th>
															</tr>
														</thead>
														<c:forEach var="user" items="${users}">
															<tbody>
																<tr class="">
																	<td class="center">
																		<label class="pos-rel">
																			<input type="checkbox"
																				class="ace child-check" name="ids"
																				value="${user.id}">
																			<span class="lbl"></span>
																		</label>
																	</td>

																	<td>${user.id}</td>
																	<td>${user.fullName}</td>
																	<td>${user.email}</td>
																	<td>${user.role.name}</td>
																	<td>
																		<div class="hidden-sm hidden-xs btn-group">
																			<a href="/admin/user/${user.id}">
																				<button type="button"
																					class="btn btn-xs btn-success"
																					title="Xem chi tiết">
																					<svg xmlns="http://www.w3.org/2000/svg"
																						width="15" height="14"
																						fill="currentColor"
																						class="bi bi-person-exclamation"
																						viewBox="0 0 16 16">
																						<path
																							d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4m.256 7a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z" />
																						<path
																							d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0m-3.5-2a.5.5 0 0 0-.5.5v1.5a.5.5 0 0 0 1 0V11a.5.5 0 0 0-.5-.5m0 4a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1" />
																					</svg>
																				</button>
																			</a>
																			<a href="/admin/user/update/${user.id}"
																				class="btn btn-xs btn-info"
																				title="Sửa thông tin"
																				style="height: 29.5px; width: 30px; margin: 0px 2px">
																				<i
																					class="ace-icon fa fa-pencil bigger-120"></i>
																			</a>

																			<a href="/admin/user/delete/${user.id}"
																				class="btn btn-xs btn-danger"
																				title="Xóa người dùng"
																				style="height: 29.5px; width: 30px;">
																				<i
																					class="ace-icon fa fa-trash-o bigger-120"></i>
																			</a>
																		</div>
																	</td>
																</tr>
															</tbody>
														</c:forEach>
													</table>
												</div>
										</form>
										<nav aria-label="Page navigation">
											<ul class="pagination">
												<li class="${currentPage eq 1 ? 'disabled' : ''}">
													<a
														href="${currentPage gt 1 ? '/admin/user?page=' += (currentPage-1) : ''}">&laquo;</a>
												</li>
												<c:forEach begin="1" end="${totalPages}" var="i">
													<li class="${i eq currentPage ? 'active' : ''}">
														<a href="/admin/user?page=${i}">${i}</a>
													</li>
												</c:forEach>
												<li class="${currentPage eq totalPages ? 'disabled' : ''}">
													<a
														href="${currentPage lt totalPages ? '/admin/user?page=' += (currentPage+1) : ''}">&raquo;</a>
												</li>
											</ul>
										</nav>

									</div>
								</div>
							</div><!-- /.page-content -->
						</div>
					</div>
				</div><!-- /.main-content -->

				<jsp:include page="../layout/footer.jsp" />

				<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
					<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
				</a>
				</div><!-- /.main-container -->

				<script>
					const checkAll = document.getElementById("checkAll");
					const childChecks = document.querySelectorAll(".child-check");

					// Khi bấm vào checkbox tổng
					checkAll.addEventListener("change", function () {
						let checked = this.checked;
						childChecks.forEach(cb => cb.checked = checked);
					});

					// Khi bấm vào checkbox con
					childChecks.forEach(cb => {
						cb.addEventListener("change", function () {
							if (!this.checked) {
								checkAll.checked = false; // Bỏ tick tổng nếu 1 con bị tắt
							} else {
								// Nếu tất cả con đều bật thì bật lại tổng
								if ([...childChecks].every(c => c.checked)) {
									checkAll.checked = true;
								}
							}
						});
					});

					document.getElementById("btnDeleteSelected").addEventListener("click", function () {
						const selected = document.querySelectorAll("input[name='ids']:checked");
						if (selected.length === 0) {
							alert("Vui lòng chọn ít nhất 1 người dùng để xóa.");
							return;
						}
						document.getElementById("deleteForm").submit();
					});
				</script>
				<!--[if !IE]> -->
				<script src="/js/jquery.2.1.1.min.js"></script>
				<script type="text/javascript">
					window.jQuery || document.write("<script src='/js/jquery.min.js'>" + "<" + "/script>");
				</script>
				<script type="text/javascript">
					if ('ontouchstart' in document.documentElement) document.write("<script src='/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
				</script>
				<script src="/js/bootstrap.min.js"></script>
				<script src="/js/jquery-ui.custom.min.js"></script>
				<script src="/js/jquery.ui.touch-punch.min.js"></script>
				<script src="/js/jquery.easypiechart.min.js"></script>
				<script src="/js/jquery.sparkline.min.js"></script>
				<script src="/js/jquery.flot.min.js"></script>
				<script src="/js/jquery.flot.pie.min.js"></script>
				<script src="/js/jquery.flot.resize.min.js"></script>
				<script src="/js/ace-elements.min.js"></script>
				<script src="/js/ace.min.js"></script>

			</body>