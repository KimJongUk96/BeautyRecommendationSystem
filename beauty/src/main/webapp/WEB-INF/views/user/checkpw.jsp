<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>

<head>
	<title>비밀번호 확인</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet"
		  href="/resources/templated-intensify/assets/css/main.css" />

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
			<li><a href="/usprod/list">세안 제품 목록</a></li>
			<li><a href="/productSuggest/infoInput">세안 제품 추천</a></li>
			<li><a href="/methodSuggest/suggest">세안법 추천</a></li>
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
						<p>비밀번호 확인</p>
					</header>

					<!-- Content -->

					<br/>
					<!-- Form -->
					<form action="/user/checkpw" method="post">
						
						<div class="container">
							<div class="row uniform">
								<div class="12u$">
									<input type="password" name="password" class="form-control" placeholder="Password"/>
								</div>
							</div>
						</div>
						<br/>
						<div class="4u 12u$(small)">
							<input type="radio" id="useCookie" name="useCookie" checked/>
							<label for="priority-low">자동 로그인</label>
						</div>
						<br/>

						<!-- Break -->
						<div class="12u$">
							<ul class="actions fit">
								<li><input type="submit" class ="button fit" value="로그인" /></li>
							</ul>
							<ul class="actions fit small">
								<li><input type="button" class ="button alt fit small" value="비밀번호 찾기" /></li>
								<li><input type="button" class ="button special fit small" value="회원가입" href="register.html" /></li>
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
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
<script>
    var result = '${msg}';

    if (result == 'FAIL') {
        alert("비밀번호를 확인해주세요.");
    }
    if (result == 'SUCCESS') {
        alert("처리가 완료되었습니다.");
    }
</script>


</html>