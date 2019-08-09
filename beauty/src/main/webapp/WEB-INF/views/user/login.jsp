<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Intensify by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<style type="text/css">
.container {
	width: 70%;
	height: 70%;
	margin: 10px auto;
}

.outer {
	display: table;
	width: 100%;
	height: 100%;
}

.inner {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

.centered {
	position: relative;
	display: inline-block;
	width: 50%;
}
</style>

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
		<a href="/" class="logo">Beauty</a>
		<nav class="right">
		<c:if test="${login.email eq null}">
			<a href="/user/login" class="button alt">Log in</a>
		</c:if>
		<c:if test="${login.email ne null}">
			<a href="/user/logout" class="button alt">Log out</a>
			<a href="/user/read?email=${login.email}" class="button alt">내 정보 수정</a>
		</c:if>
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
		
	</nav>

	<!-- Main -->
	<div class="container">
		<div class="outer">
			<div class="inner">
				<div class="centered">
					<section id="main" class="wrapper">
						<header class="align-center">
							<h1>뷰티 큐레이션</h1>
							<p>로그인</p>
						</header>

						<!-- Content -->


						<!-- Form -->
						<form action="/user/loginPost" method="post">
							<div class="container">
								<div class="row uniform">
									<div class="6u 12u$(xsmall)">
										<input type="text" name="usid" class="form-control"
											placeholder="아이디" />
									</div>
								</div>
							</div>
							<div class="container">
								<div class="row uniform">
									<div class="6u$ 12u$(xsmall)">
										<input type="password" name="upw" class="form-control"
											placeholder="비밀번호" />
									</div>
								</div>
							</div>
							<br/>
							<div class="4u 12u$(small)">
								<input type="checkbox" id="useCookie" name="useCookie" checked>
								<label for="priority-low">자동 로그인</label>
							</div>
							<br/>


							<!-- Break -->
							<div class="12u$">
								<ul class="actions fit">
									<li><input type="submit" class ="button fit" value="로그인" /></li>
								</ul>
								<ul class="actions fit small">
									<li><input type="button" class ="button alt fit small" onclick="openPopUp()" value="비밀번호 찾기" /></li>
									<li><a href="/user/register" class ="button special fit small">회원가입</a></li>
								</ul>
							</div>
						</form>
					</section>
				</div>




				<!-- Image -->
			</div>
		</div>
	</div>

	<!-- Footer -->

		<footer id="footer">
			<div>
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

		<!-- Scripts -->
		<script src="/resources/templated-intensify/assets/js/jquery.min.js"></script>
		<script
			src="/resources/templated-intensify/assets/js/jquery.scrolly.min.js"></script>
		<script src="/resources/templated-intensify/assets/js/skel.min.js"></script>
		<script src="/resources/templated-intensify/assets/js/util.js"></script>
		<script src="/resources/templated-intensify/assets/js/main.js"></script>
</body>
<script>
	function openPopUp() {
		// window.name = "부모창 이름"; 
		window.name = "parentForm";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		var width = "800";
		var height = "500";
		var top = (window.screen.height - height) / 2;
		var left = (window.screen.width - width) / 2;
		var url = "/user/forgetpw";
		var title = "비밀번호 소개";
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width="
				+ width + ",height=" + height + ",top=" + top + ",left=" + left;

		window.open(url, title, status);
	}
</script>
</html>