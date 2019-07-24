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
			<li><a href="generic.html">세안 제품 목록</a></li>
			<li><a href="elements.html">세안 제품 추천</a></li>
			<li><a href="elements.html">세안법 추천</a></li>
		</ul>
		<ul class="actions vertical">
			<li><a href="#" class="button fit">Login</a></li>
		</ul>
	</nav>

	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">
			<form role="form" method="post" action="modify">
				<h4>피부정보 입력</h4>
				<div>
					<label>이메일</label> 
					<input type="text" name='email' id='name' value = "${userVO.email }" readonly>
				</div>
				
				<div>
					<label>비밀번호</label> 
					<input type="password" name='password' id='pw' value = "${userVO.password }" readonly>
				</div>
				
				<div>
					<label>닉네임</label> 
					<input type="text" name='nickName' class="form-control" value = "${userVO.nickName }">
				</div>
				<div>
					<p>
					<h1></h1>
					<h1></h1>
				</div>
				<h4>피부 정보 입력</h4>
				<div>
					<label>성별</label>
					<input type="radio" name="gender" value="U1"> 
					<label for="U1"<c:out value="${userVO.gender eq 'U1'?'checked':''}"/>>여성</label>
					<input type="radio" name="gender" value="U2">
					<label for="U2"<c:out value="${userVO.gender eq 'U2'?'checked':''}"/>>남성</label>
				</div>
				<div>
					<h1></h1>
				</div>
				
				<div>
					<label>연령대</label>
					<input type="radio" name="age" value="10"<c:out value="${userVO.age eq '10'?'checked':''}"/>>
					<label for="10">10대</label>
					<input type="radio" name="age" value="20"<c:out value="${userVO.age eq '20'?'checked':''}"/>>
					<label for="20">20대</label>
					<input type="radio" name="age" value="30"<c:out value="${userVO.age eq '30'?'checked':''}"/>>
					<label for="30">30대</label>
					<input type="radio" name="age" value="40"<c:out value="${userVO.age eq '40'?'checked':''}"/>>
					<label for="40">40대</label>
					<input type="radio" name="age" value="50"<c:out value="${userVO.age eq '50'?'checked':''}"/>>
					<label for="50">50대 이상</label>
				</div>
				<div>
					<h3></h3>
				</div>
				<div>
					<label>피부 타입</label>
					<input type="radio" name="skinType" value="DR"<c:out value="${userVO.skinType eq 'DR'?'checked':''}"/>>
					<label>건성</label> 
					<input type="radio" name="skinType" value="NE"<c:out value="${userVO.skinType eq 'NE'?'checked':''}"/>>
					<label>중성</label>
					<input type="radio" name="skinType" value="OI"<c:out value="${userVO.skinType eq 'OI'?'checked':''}"/>>
					<label>지성</label>
					<input type="radio" name="skinType" value="CO"<c:out value="${userVO.skinType eq 'CO'?'checked':''}"/>> 
					<label>복합성</label>
					<input type="radio" name="skinType" value="SE"<c:out value="${userVO.skinType eq 'SE'?'checked':''}"/>>
					<label for="SE">민감성</label>
				</div>

		<div class="box-footer" align="center">
			<button type="submit" class="button alt small fit">내 정보 수정</button>
		</div>   
		</form>
		</div>
	</section>

	<!-- Footer -->
	<footer id="footer">
		<div>
			<h2>Get In Touch</h2>
			<ul>
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
<script type="text/javascript">
	//아이디가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
	$(function() {

		$("#email").change(function() {
			var email = $('#email').val();

			if (email != '') {//이메일이 값이 있을 경우에만 Email check

				$.ajax({
					url : '/user/checkid',
					type : 'post',
					data : {
						email : email
					},
					success : function(data) {
						if ($.trim(data) == 0) {
							$('#chkMsg').html("사용가능");
						} else {
							$('#chkMsg').html("사용불가");
						}
					},
				});

			} else {
				//SPAN 초기화
				$('#chkMsg').html('email 중복 확인 하세요');

			}
		});
	});

	function isSame() {

		if (document.getElementById('pw').value != ''
				&& document.getElementById('pwCheck').value != '') {
			if (document.getElementById('pw').value == document
					.getElementById('pwCheck').value) {
				document.getElementById('same').innerHTML = '비밀번호가 일치합니다.';
				document.getElementById('same').style.color = 'blue';
			} else {
				document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
				document.getElementById('same').style.color = 'red';
			}
		}
	}
</script>
</html>
