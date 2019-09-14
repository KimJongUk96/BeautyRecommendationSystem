<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<style type="text/css">

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
			<li><a href="/methodSuggest/suggest">세안법 검색</a></li>
		</ul>

	</nav>

	<!-- Main -->
	<section id="main" class="wrapper">
			<div class="inner">
				<div class="inner">
				<div class="align-center">
					<h2>세안법 검색</h2>
					<p>
					<hr>
					피부 타입과 피부 고민에 따른 <br />나만의 맞춤형 세안법을 추천 받으세요
					<hr>
					</p>
					</div>
				</div>
				<div class="inner">
				<form method="post" action="list">
					<div class="align-center">
						<h4>피부정보 입력</h4>
						<div class="centered">
						
							<label>피부 타입</label> 
							<select name="skinType" id="skinType">
								<option value="DR">건성</option>
								<option value="NE">중성</option>
								<option value="OI">지성</option>
								<option value="CO">복합성</option>
								<option value="SE">민감성</option>
							</select>
							</div>
						<div>
							<h3></h3>
						</div>
						<div class="centered">
							<label>화장 정도</label> 
							<select name="makeUpDegree" id="makeUpDegree">
								<option value="NM">노 메이크업</option>
								<option value="YM">메이크업</option>
								<option value="SM">색조메이크업</option>
							</select>
						</div>
						<div>
							<h1></h1>
						</div>
						<h4>날씨 정보 입력</h4>
						<div class="align-center">
							<label>날씨</label> <input type="radio" name="weather" value="W1"
								id="W1" checked="checked"><label for="W1">맑음</label> <input type="radio"
								name="weather" value="W2" id="W2"><label for="W2">흐림</label>
							<input type="radio" name="weather" value="W3" id="W3"><label
								for="W3">눈/비</label>
						</div>
						<div>
							<h3></h3>
						</div>
						<div class="align-center">
							<label>미세먼지</label>
							<div></div>
							<input type="radio" name="dust" value="D1" id="D1" checked="checked"><label
								for="D1">좋음</label> <input type="radio" name="dust" value="D2"
								id="D2"><label for="D2">보통</label> <input type="radio"
								name="dust" value="D3" id="D3"><label for="D3">나쁨</label>
							<input type="radio" name="dust" value="D4" id="D4"><label
								for="D4">매우나쁨</label>
						</div>

					</div>
				<div class="align-center">
					<div class="box-footer" align="center">
						<button type="submit" class="button special small">세안법 검색 하기</button>
					</div>
					</div>

				</form>
			</div>
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

	<!-- Scripts -->
	<script src="/resources/templated-intensify/assets/js/jquery.min.js"></script>
	<script
		src="/resources/templated-intensify/assets/js/jquery.scrolly.min.js"></script>
	<script src="/resources/templated-intensify/assets/js/skel.min.js"></script>
	<script src="/resources/templated-intensify/assets/js/util.js"></script>
	<script src="/resources/templated-intensify/assets/js/main.js"></script>


</body>
</html>