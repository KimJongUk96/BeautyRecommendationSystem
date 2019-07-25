<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>



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

									<!-- general form elements -->

									<h4 class="header-title">제품 리스트</h4>
									<div align="right">
										<select name="searchType">
											<option value="n"
												<c:out value="${cri.searchType == null?'selected':''}"/>>
												---</option>
											<option value="pn"
												<c:out value="${cri.searchType eq 'pn'?'selected':''}"/>>
												제품명</option>
											<option value="cn"
												<c:out value="${cri.searchType eq 'cn'?'selected':''}"/>>
												제품 회사명</option>
											<option value="ptn"
												<c:out value="${cri.searchType eq 'ptn'?'selected':''}"/>>
												제품 종류</option>

										</select> <input type="text" name='keyword' id="keywordInput"
											value='${cri.keyword}'>
										<button id='searchBtn' type="button"
											class="btn btn-light btn-rounded">검색</button>
										<button id='newBtn' type="button"
											class="btn btn-light btn-rounded">등록</button>
									</div>

									<div align="right">
										<select name="listType"
											onchange="if(this.value) location.href=(this.value);">
											<option
												value="/usprod/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">정렬
												기준</option>
											<option
												<c:out value="${cri.listType eq 'regdate'?'selected':''}" />
												value="/usprod/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&listType=regdate">최근
												등록일 순</option>
											<option
												<c:out value="${cri.listType eq 'rating'?'selected':''}" />
												value="/usprod/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&listType=rating">인기순</option>
											<option
												<c:out value="${cri.listType eq 'count'?'selected':''}" />
												value="/usprod/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&listType=count">리뷰
												많은 순</option>
										</select>
									</div>



									<div class="table-responsive-sm">
										<table class="table table-hover table-centered mb-0">
											<thead>
												<tr>
													<th style="width: 90px">번호</th>
													<th>사진</th>
													<th>제품명</th>
													<th>회사명</th>
													<th>제품 종류</th>
													<th>등록일</th>

												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="productVO">

													<tr>
														<td>${productVO.prodNo}</td>
														<td><img height="125px" width="200px"
															src="displayFile?fileName=${productVO.img}" alt="이미지 없음" />
														</td>
														<td><a
															href='/usprod/read${pageMaker.makeSearch(pageMaker.cri.page) }&prodNo=${productVO.prodNo}'>
																${productVO.name} </a></td>
														<td>${productVO.compName}</td>
														<td>${productVO.categoryName}</td>
														<%-- <c:forEach items="${prodTypeList}" var="prodTypeVO">
			                                                        <c:if test="${prodTypeVO.prodtypeNo eq productVO.prodtypeNo}">
			                                                        	<td>${prodTypeVO.name}&nbsp;${prodTypeVO.category}</td>
											                        </c:if>
										                        </c:forEach>	 --%>
														<td><fmt:formatDate pattern="yyyy-MM-dd"
																value="${productVO.regdate}"></fmt:formatDate></td>

													</tr>

												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- /.box-body -->


									<div class="text-center" align="center">
										<nav>
											<ul class="pagination pagination-rounded">

												<c:if test="${pageMaker.prev}">
													<li class="page-item"><a
														href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
												</c:if>

												<c:forEach begin="${pageMaker.startPage }"
													end="${pageMaker.endPage }" var="idx">
													<li
														class="page-item
									<c:out value="${pageMaker.cri.page == idx?'active':''}"/>">
														<a
														href="list${pageMaker.makeQuery(idx)}&searchType=${cri.searchType}&keyword=${cri.keyword}"
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


	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
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
		$(document).ready(
				function() {
					//<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
					$('#searchBtn').on(
							"click",
							function(event) {
								var keyword = $('#keywordInput').val();
								var keyArray = keyword.split(' ');
								keyword = '';
								for (i = 0; i < keyArray.length; i++) {
									keyword = keyword + keyArray[i];
								}

								self.location = "list"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword=" + keyword;

							});

					$('#newBtn').on("click", function(evt) {

						self.location = "register";

					});

					$('#logout').on("click", function(evt) {

						self.location = "/admin/logout";

					});

				});
	</script>
</body>
</html>
