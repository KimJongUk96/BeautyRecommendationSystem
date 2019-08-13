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
			<li><a href="/productSuggest/list">세안 제품 추천</a></li>
			<li><a href="/methodSuggest/suggest">세안법 추천</a></li>
		</ul>
		<ul class="actions vertical">
			<li><a href="#" class="button fit">Login</a></li>
		</ul>
	</nav>
		
		
		<section id="banner">
				<div class="content">
					<h1>피부에 맞는 제품을 찾아드립니다.</h1>
					<p>매일 쓰는 화장품, 알맞게 사용하고 계신가요?<br/>적합한 제품과 올바른 세안 방법을 추천 해 드립니다.</p>
					<ul class="actions">
						<li><a href="/productSuggest/list" class="button">세안 제품 추천 받기</a></li>
						<li><a href="/methodSuggest/suggest" class="button special">세안 법 추천 받기</a></li>
					</ul>
				</div>
		</section>
		
				<!-- Footer -->
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

<script>
</script>
</html>