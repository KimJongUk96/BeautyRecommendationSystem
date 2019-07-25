<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<!--
	Intensify by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->

<html>
<head>
<title>Beauty</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="/resources/templated-intensify/assets/css/main.css" />

</head>
<body class="subpage">

	<!-- Header -->
	<header id="header">
		<nav class="left">
			<a href="#menu"><span>Menu</span></a>
		</nav>
		<a href="/index" class="logo">Beauty</a>
		<nav class="right">
			<a href="/user/login" class="button alt">Log in</a>
		</nav>
	</header>

	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><a href="/">Home</a></li>
			<li><a href="/usprod/list">세안 제품 목록</a></li>
			<li><a href="/productSuggest/infoInput">세안 제품 추천</a></li>
			<li><a href="/methodSuggest/suggest">세안법 추천</a></li>
		</ul>
		<ul class="actions vertical">
			<li><a href="#" class="button fit">Login</a></li>
		</ul>
	</nav>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- left column -->


			<div class="col-md-12">
				<!-- general form elements -->
				<div class='box'>
					<div class="box-header with-border">
						<h3 class="box-title">세안제품 리스트</h3>
					</div>


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
				</div>


				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">LIST PAGING</h3>
					</div>

					<select id="order" name="order">
						<option value="avg">평점 높은 순</option>
						<option value="regdate">최신 등록 순</option>
						<option value="count">리뷰 많은 순</option>
					</select>

					<div class="box-body">
						<table class="table table-bordered">
							<c:forEach items="${list}" var="productVO" varStatus="listStat">
								<tr>
									<td>${listStat.count}<input type="hidden"
										value="${productVO.prodNo }" /> <input type="hidden"
										value="${productVO.regdate }" /> <input type="hidden"
										value="${productVO.count }" />
									</td>
									<td>${productVO.img}</td>
									<td>${productVO.compName}<br> <a
										href='/usprod/read${pageMaker.makeSearch(pageMaker.cri.page) }&prodNo=${productVO.prodNo}'>
											${productVO.name}</a><br> ${productVO.ratingAvg}
									</td>
									<td>${productVO.prodtypeName} / ${productVO.categoryName}
										/ ${productVO.price}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<!-- /.box-body -->


					<div class="box-footer">

						<div class="text-center">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>

							</ul>
						</div>

					</div>
					<!-- /.box-footer-->
				</div>
			</div>
			<!--/.col (left) -->

		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->


	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}
	</script>

	<script>
		$(document).ready(
				function() {

					$('#searchBtn').on(
							"click",
							function(event) {
								var keyword = $('#keywordInput').val();
								var keyArray = keyword.split(' ');
								keyword = '';
								for(i=0; i<keyArray.length; i++){
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

						self.location = "/user/logout";

					});

				});
	</script>
	<script>
		function boardChange() {
			var order = $('#order option:selected').val();

			$.ajax({
				type : 'POST',
				url : '/usprod/list/' + order,
				data : order

			})
		}
	</script>
	<footer id="footer">
		<div class="inner">
			<h2>Get In Touch</h2>
			<ul class="actions">
				<li><span class="icon fa-phone"></span> <a href="#">(000)
						000-0000</a></li>
				<li><span class="icon fa-envelope"></span> <a href="#">information@untitled.tld</a></li>
				<li><span class="icon fa-map-marker"></span> 123 Somewhere
					Road, Nashville, TN 00000</li>
			</ul>
		</div>
		<div class="copyright">
			&copy; Untitled. Design <a href="https://templated.co">TEMPLATED</a>.
			Images <a href="https://unsplash.com">Unsplash</a>.
		</div>
	</footer>
</body>

<!-- Scripts -->
<script src="/resources/templated-intensify/assets/js/jquery.min.js"></script>
<script
	src="/resources/templated-intensify/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/templated-intensify/assets/js/skel.min.js"></script>
<script src="/resources/templated-intensify/assets/js/util.js"></script>
<script src="/resources/templated-intensify/assets/js/main.js"></script>
<!-- end demo js-->

</html>