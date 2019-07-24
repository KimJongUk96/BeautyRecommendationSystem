<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<a href="index.html" class="logo">intensify</a>
		<nav class="right">
			<a href="#" class="button alt">Log in</a>
		</nav>
	</header>

	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><a href="index.html">Home</a></li>
			<li><a href="generic.html">Generic</a></li>
			<li><a href="elements.html">Elements</a></li>
		</ul>
		<ul class="actions vertical">
			<li><a href="#" class="button fit">Login</a></li>
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
							<div class="4u 12u$(small)">
								<input type="checkbox" id="useCookie" name="useCookie" checked>
								<label for="priority-low">자동 로그인</label>
							</div>


							<!-- Break -->
							<div class="12u$">
								<ul class="actions fit">
									<li><input type="submit" class ="button fit" value="로그인" /></li>
								</ul>
								<ul class="actions fit small">
									<li><a href="/user/forgetpw" class ="button alt fit small">비밀번호 찾기</a></li>
									<!-- <li><input type="button" class ="button alt fit small" value="비밀번호 찾기" /></li> -->
									<!-- <li><input type="button" class ="button special fit small" value="회원가입" /></li> -->
									<li><a href="/user/register" class ="button special fit small">회원가입</a>
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
	<div class="container">
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

		<!-- Scripts -->
		<script src="/resources/templated-intensify/assets/js/jquery.min.js"></script>
		<script
			src="/resources/templated-intensify/assets/js/jquery.scrolly.min.js"></script>
		<script src="/resources/templated-intensify/assets/js/skel.min.js"></script>
		<script src="/resources/templated-intensify/assets/js/util.js"></script>
		<script src="/resources/templated-intensify/assets/js/main.js"></script>
		</div>
</body>
</html>