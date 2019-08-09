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

<style>
.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1f {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2f {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR3 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR3f {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR4 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR4f {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR5 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR5f {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR1f.on {
	background-position: -15px 0;
}

.starR2.on {
	background-position: 0 0;
}

.starR2f.on {
	background-position: -15px 0;
}

.starR3.on {
	background-position: 0 0;
}

.starR3f.on {
	background-position: -15px 0;
}

.starR4.on {
	background-position: 0 0;
}

.starR4f.on {
	background-position: -15px 0;
}

.starR5.on {
	background-position: 0 0;
}

.starR5f.on {
	background-position: -15px 0;
}

.centered {
	position: relative;
	display: inline-block;
	width: 50%;
}

.starRev {
	position: relative;
	display: inline-block;
	/* width: 50%; */
	align-content: center;
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
			<li><a href="index.html">Home</a></li>
			<li><a href="/usprod/list">세안 제품 목록</a></li>
			<li><a href="/productSuggest/infoInput">세안 제품 추천</a></li>
			<li><a href="/methodSuggest/suggest">세안법 추천</a></li>
		</ul>
		<ul class="actions vertical">
			<li><a href="#" class="button fit">Login</a></li>
		</ul>
	</nav>

	<br />
	<!-- Main -->
	<section id="main" class="wrapper">
		<form method="post" name="frm">
			<div class="col-12">
				<div class="inner">
					<div class="align-center">
						<div class="align-center">
							<h2>리뷰 등록</h2>
						</div>
						<div style="border: 1px solid black">
							<input type="hidden" name="userEmail" value="${login.email}">
							<input type='hidden' name='prodNo' value="${ProductVO.prodNo}">
							<h4></h4>

							<div class="centered">
								<img id='photoReal' src="" alt="이미지 없음" align="left"
									style="width: 100%; height: auto;" />
								<!-- height="400px" width="400px"  -->
							</div>
							<br> <br>
							<div class="centered">
								<span style="font-size: 1.1em; line-height: 1.0em; color: grey;">${productVO.compName}</span>
								<br> <span
									style="font-size: 1.4em; line-height: 1.0em; color: grey;">${productVO.name}</span>
								<br>
							</div>

							<br> <br>
							<div></div>

							<div class="centered">
								<textarea name="reviewText" id="reviewText" rows="5" placeholder="리뷰를 적어주세요."></textarea>
								<!-- style="width: 450px; height:200px" -->
							</div>

							<div class="align-center">
								<div class="centered">
									<label><br /> <br />별점</label>
									<div class="starRev">
										<input type="hidden" name="rating" value="0.0"> <span class="starR1 on">별1_왼쪽</span> <span class="starR1f">별1_오른쪽</span>
										<span class="starR2">별2_왼쪽</span> <span class="starR2f">별2_오른쪽</span>
										<span class="starR3">별3_왼쪽</span> <span class="starR3f">별3_오른쪽</span>
										<span class="starR4">별4_왼쪽</span> <span class="starR4f">별4_오른쪽</span>
										<span class="starR5">별5_왼쪽</span> <span class="starR5f">별5_오른쪽</span>
									</div>
								</div>
							</div>
							<div class="align-center">

								<label><br /> <br />추천여부</label> <input type="radio"
									name="command" value="0" id="0" checked="checked"> <label for="0">추천</label>
								<input type="radio" name="command" value="1" id="1"> <label
									for="1">비추천</label>
							</div>
							<div>
								<h1></h1>
							</div>

							<div class="box-footer" align="center">
								<button type="submit" class="button small" id="btn">제품 리뷰 등록</button>
							</div>
							<div>
								<h2></h2>
							</div>

						</div>

					</div>
				</div>
			</div>
		</form>

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
	
		<script type="text/javascript">
$(document).ready(function(){
	   $('#btn').click(function(){
		   return check();        
	    });
	   
});

	check = function(){
		var reviewText = $("#reviewText").val();
	
		if(reviewText == "" || reviewText == null){
			alert("리뷰를 작성해주세요.");
			return false;
		}

		else{
			return true;
		}
	}

</script>
	
	<script>
		function realPhoto(thumbnail) {
			var date = thumbnail.split('s');
			var array = thumbnail.split('_');
			return date[0] + array[1] + "_" + array[2];
		}

		var thumbnail = "${productVO.img}";

		document.getElementById("photoReal").src = "displayFile?fileName="
				+ realPhoto(thumbnail);

		var starRating = 0.0;

		$(".starR1").click(function(event) {

			starRating = 0.5;
			document.frm.rating.value = starRating;

		});

		$(".starR1f").click(function(event) {

			starRating = 1.0;
			document.frm.rating.value = starRating;
		});

		$(".starR2").click(function(event) {

			starRating = 1.5;
			document.frm.rating.value = starRating;

		});

		$(".starR2f").click(function(event) {

			starRating = 2.0;
			document.frm.rating.value = starRating;

		});

		$(".starR3").click(function(event) {

			starRating = 2.5;
			document.frm.rating.value = starRating;

		});

		$(".starR3f").click(function(event) {

			starRating = 3.0;
			document.frm.rating.value = starRating;

		});

		$(".starR4").click(function(event) {

			starRating = 3.5;
			document.frm.rating.value = starRating;

		});

		$(".starR4f").click(function(event) {

			starRating = 4.0;
			document.frm.rating.value = starRating;

		});

		$(".starR5").click(function(event) {

			starRating = 4.5;
			document.frm.rating.value = starRating;

		});

		$(".starR5f").click(function(event) {

			starRating = 5.0;
			document.frm.rating.value = starRating;

		});

		function checkImageType(fileName) {

			var pattern = /jpg|gif|png|jpeg/i;
			return fileName.match(pattern);

		}

		function getImageLink(fileName) {

			if (!checkImageType(fileName)) {
				return;
			}
			var front = fileName.substr(0, 12);
			var end = fileName.substr(14);

			return front + end;

		}
	</script>

	<script>
		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});
	</script>
	
</body>
</html>