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
		<title>Generic - Intensify by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/templated-intensify/assets/css/main.css" />
		
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
			<section id="main" class="wrapper">
				<div class="inner">
					<form method="post">
<h4>피부정보 입력</h4>
<div>
<label>피부 타입</label>
<select name="skinType" id="skinType">
<!-- 	<option value="DR">건성</option> -->
<option value="1">건성</option>
	<option value="NE">중성</option>
	<option value="OI">지성</option>
	<option value="CO">복합성</option>
	<option value="SE">민감성</option>
</select>
</div>
<div><h3></h3></div>
<div>
<label>화장정도</label>
<select name="makeUpDegree" id="makeUpDegree">
<%-- 	<option value="NM"<c:out value="${methodSuggestVO.makeUp eq 'NM'?'selected':''}"/>>노 메이크업</option> --%>
<option value="1">노 메이크업</option>
	<option value="YM">메이크업</option>
	<option value="SM">색조메이크업</option>
</select>
</div>
<div><h1></h1></div>
<h4>날씨 정보 입력</h4>
<div>
<label>날씨</label>

<%-- 	<input type="radio" name="weather" value="W1"<c:out value="${methodSuggestVO.weather eq 'W1'?'checked':''}"/>>맑음 --%>
	<input type="radio" name="weather" value="W1" id="W1"><label for="W1">맑음</label>
	<input type="radio" name="weather" value="W2" id="W2"><label for="W2">흐림</label>
	<input type="radio" name="weather" value="W3" id="W3"><label for="W3">눈/비</label>
</div>
<div><h3></h3></div>
<div>	
<label>미세먼지</label> 
<%-- 	<input type="radio" name="dust" value="D1"<c:out value="${methodSuggestVO.dust eq 'D1'?'checked':''}"/>>좋음 --%>
<div></div>
	<input type="radio" name="dust" value="D1" id="D1"><label for="D1">좋음</label>
	<input type="radio" name="dust" value="D2" id="D2"><label for="D2">보통</label>
	<input type="radio" name="dust" value="D3" id="D3"><label for="D3">나쁨</label>
	<input type="radio" name="dust" value="D4" id="D4"><label for="D4">매우나쁨</label>
</div>	
</div>

<div class="box-footer" align="center">
	<button type="submit" class="button small">Submit</button>
</div>

</form>	</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<h2>Get In Touch</h2>
					<ul class="actions">
						<li><span class="icon fa-phone"></span> <a href="#">(000) 000-0000</a></li>
						<li><span class="icon fa-envelope"></span> <a href="#">information@untitled.tld</a></li>
						<li><span class="icon fa-map-marker"></span> 123 Somewhere Road, Nashville, TN 00000</li>
					</ul>
				</div>
				<div class="copyright">
					&copy; Untitled. Design <a href="https://templated.co">TEMPLATED</a>. Images <a href="https://unsplash.com">Unsplash</a>.
				</div>
			</footer>

		<!-- Scripts -->
			<script src="/resources/templated-intensify/assets/js/jquery.min.js"></script>
			<script src="/resources/templated-intensify/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/templated-intensify/assets/js/skel.min.js"></script>
			<script src="/resources/templated-intensify/assets/js/util.js"></script>
			<script src="/resources/templated-intensify/assets/js/main.js"></script>
			

	</body>
</html>