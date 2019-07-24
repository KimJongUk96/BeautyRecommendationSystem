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

</head>
<body class="subpage">

	<!-- Header -->
	<header id="header">
		<nav class="left">
			<a href="#menu"><span>Menu</span></a>
		</nav>
		<a href="/" class="logo">Beauty</a>
		<nav class="right">
			<a href="/user/login" class="button alt">Log in</a>
		</nav>
	</header>

	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><a href="/index">Home</a></li>
			<li><a href="/usprod/list">세안 제품 목록</a></li>
			<li><a href="/productSuggest/infoInput">세안 제품 추천</a></li>
			<li><a href="/methodSuggest/suggest">세안법 추천</a></li>
		</ul>
		<ul class="actions vertical">
			<li><a href="#" class="button fit">Login</a></li>
		</ul>
	</nav>

	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">
		<div text-align="center">
			<h2>세안법 상세 보기</h2>
			</p>
			</div>
			<form role="form" method="post">
				<input type='hidden' name='methodNo' value="${methodSuggestVO.methodNo}">
				<input type='hidden' name='page' value="${cri.page}"> 
	 			<input type='hidden' name='searchType' value="${cri.searchType}">
				<input type='hidden' name='keyword' value="${cri.keyword}">
				<h4>피부정보 입력</h4>
				<div class="form-group">
					<label for="example-select">세안법 Step</label>
					<select class="form-control" name="methodStep" id="methodStep">
					<option value="1" id="step1"<c:out value="${methodSuggestVO.methodStep eq '1'?'selected':''}"/>>Step1</option>
					<option value="2" id="step2"<c:out value="${methodSuggestVO.methodStep eq '2'?'selected':''}"/>>Step2</option>
					<option value="3" id="step3"<c:out value="${methodSuggestVO.methodStep eq '3'?'selected':''}"/>>Step3</option>
					</select>
				</div>
				<h3></h3>
				<div class="form-group mb-3" id="method">
							<label for="simpleinput" >세안법</label>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:if test="${status.count eq '1'}">
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step1 세안법" readonly="readonly">${methodDetailVO.method}</textarea>
								</c:if>
								</c:forEach>
						</div>
						<h3></h3>
						<div class="form-group mb-3" id="prodNo">
							<label for="simpleinput">사용제품</label>
							<c:forEach items="${prodList}" var="productVO" varStatus="status">
							<c:if test="${status.count eq '1'}">
							<input type="text" name="prodNo" value="${productVO.name}" readonly="readonly">
								</c:if>
								</c:forEach>
						</div>
						<h3></h3>
						<div class="form-group mb-3" id="method2">
							<label for="simpleinput">세안법2</label>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:if test="${status.count eq '2'}">
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step2 세안법" readonly="readonly">${methodDetailVO.method}</textarea>
							</c:if>
								</c:forEach>
						</div>
						<h3></h3>
						<div class="form-group mb-3" id="prodNo2">
							<label for="simpleinput">사용제품</label>
							<c:forEach items="${prodList}" var="productVO" varStatus="status">
							<c:if test="${status.count eq '2'}">
							<input type="text" name="prodNo" value="${productVO.name}" readonly="readonly">
								</c:if>
								</c:forEach>
						</div>
						<h3></h3>
						
						<div class="form-group mb-3" id="method3">
							<label for="simpleinput">세안법3</label>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:if test="${status.count eq '3'}">
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step3 세안법" readonly="readonly">${methodDetailVO.method}</textarea>
							</c:if>
								</c:forEach>
						</div>
						<h3></h3>
						<div class="form-group mb-3" id="prodNo3">
							<label for="simpleinput">사용제품</label>
							<c:forEach items="${prodList}" var="productVO" varStatus="status">
							<c:if test="${status.count eq '3'}">
							<input type="text" name="prodNo" value="${productVO.name}" readonly="readonly">
								</c:if>
								</c:forEach>
						</div>
				<div>
					
		</div>


		</form>
		<div class="box-footer" align="center">
			<button type="submit" class="button special small">목록</button>
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
    <script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-outline-info").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/methodSuggest/list");
			formObj.submit();
		});

	});
	</script>
	
	<script>
$(document).ready(function(){
	
	var value = jQuery('#methodStep option:selected').val();
	// selectbox value값에 따른 click,change 이벤트 강제 실행
	   if($(value == '1').trigger('click')){
			$('#methodStep').change();
	   }else if($(value == '2').trigger('click')){
		   $('#methodStep').change();
	   }else if($(value == '3').trigger('click')){
		   $('#methodStep').change();
	   }
	});
</script>

<script>
jQuery('#methodStep').change(function(){
	
	var value = jQuery('#methodStep option:selected').val();	
	// selectbox value값에 따라서 textArea 보기 / 숨기기
	if(value == '1'){
		$('#method').show();
		$('#prodNo').show();
		$('#method2').hide();
		$('#prodNo2').hide();
		$('#method3').hide();
		$('#prodNo3').hide();
	}else if(value == '2'){
		$('#method').show();
		$('#prodNo').show();
		$('#method2').show();
		$('#prodNo2').show();
		$('#method3').hide();
		$('#prodNo3').hide();
	}else if(value == '3'){
		$('#method').show();
		$('#prodNo').show();
		$('#method2').show();
		$('#prodNo2').show();
		$('#method3').show();
		$('#prodNo3').show();
		}
	});
</script>

</body>
</html>