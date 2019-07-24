<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>관리자 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
	href="/resources/dist/assets/images/favicon.ico">

<!-- inline style to handle loading of various element-->
<style>
body.loading {
	visibility: hidden;
}
</style>

<!-- third party css -->
<link href="/resources/dist/assets/css/vendor/fullcalendar.min.css"
	rel="stylesheet" type="text/css" />
<!-- third party css end -->

<!-- App css -->
<link href="/resources/dist/assets/css/icons.min.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/dist/assets/css/app.min.css" rel="stylesheet"
	type="text/css" id="main-style-container" />

</head>

<body class="loading">
	<div id="detached-topbar-placeholder"></div>
	<!-- Begin page -->
	<div class="wrapper">

		<div id="vertical-sidebar-placeholder"></div>
		<div id="detached-sidebar-placeholder"></div>

		<!-- ============================================================== -->
		<!-- Start Page Content here -->
		<!-- ============================================================== -->


		<div class="content-page">

			<div class="content">

				<div id="vertical-topbar-placeholder"></div>
				<div id="horizontal-topbar-placeholder"></div>
				<div>
					<h3></h3>
				</div>
				<!-- Start Content-->
				<div class="container-fluid">

					<div class="row">
						<div class="col-xl-12">
							<div class="card">
								<div class="card-body">
									<h4 class="header-title">Product Type List</h4>
									<div align="right"></div>
									<div></div>

									<div class="table-responsive-sm">
										<table class="table table-hover table-centered mb-0">
											<thead>
												<tr>
													<th>ID</th>
													<th>NAME</th>
													<th>REGDATE</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="adminVO">
													<tr>
														<td>
														<input type="hidden" value="${adminVo.adminNo }"></input>
														<a href="/admin/read${pageMaker.makeSearch(pageMaker.cri.page) }&adminNo=${adminVO.adminNo}">${adminVO.id}</a></td>
														<td>${adminVO.name}</td>
														<td><fmt:formatDate pattern="yyyy-MM-dd"
																value="${adminVO.regdate}" /></td>

													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- end table-responsive-->



									<div class="text-center" align="center">
										<nav>
											<ul class="pagination pagination-rounded">

												<c:if test="${pageMaker.prev}">
													<li class="page-item"><a
														href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
												</c:if>

												<c:forEach begin="${pageMaker.startPage }"
													end="${pageMaker.endPage }" var="idx">
													<li class="page-item active"
														<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
														<a href="list${pageMaker.makeQuery(idx)}"
														class="page-link">${idx}</a>
													</li>
												</c:forEach>

												<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
													<li class="page-item"><a
														href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
												</c:if>

											</ul>
										</nav>
									</div>


								</div>
								<!-- end card body-->
							</div>
							<!-- end card -->
						</div>
						<!-- end col-->


					</div>
					<!-- end row-->





				</div>
				<!-- container -->

			</div>
			<!-- content -->

			<!-- Footer Start -->
			<footer class="footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">2018 - 2019 © Hyper - Coderthemes.com
						</div>
						<div class="col-md-6">
							<div class="text-md-right footer-links d-none d-md-block">
								<a href="javascript: void(0);">About</a> <a
									href="javascript: void(0);">Support</a> <a
									href="javascript: void(0);">Contact Us</a>
							</div>
						</div>
					</div>
				</div>
			</footer>
			<!-- end Footer -->

		</div>

		<!-- ============================================================== -->
		<!-- End Page content -->
		<!-- ============================================================== -->


	</div>
	<!-- END wrapper -->






	<!-- App js -->
	<script src="/resources/dist/assets/js/app_admin.js"></script>

	<!-- third party js -->
	<script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
	<script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
	<!-- third party js ends -->

	<!-- demo app -->
	<script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
	<!-- end demo js-->

	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}
	</script>

	<script>
		$(document).ready(function() {

			$('#newBtn').on("click", function(evt) {

				self.location = "register";

			});

			$('#manageBtn').on("click", function(evt) {

				self.location = "remove";

			});

		});
	</script>
</body>
</html>
