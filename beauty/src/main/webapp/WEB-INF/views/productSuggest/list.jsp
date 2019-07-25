<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
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
		<c:if test="${userVO.email eq null}">
			<a href="/user/login" class="button alt">Log in</a>
		</c:if>
		<c:if test="${userVO.email ne null}">
			<a href="/user/logout" class="button alt">Log out</a>
			<a href="/user/read" class="button alt">내 정보 수정</a>
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
		<section id="main" class="wrapper">
			<div class="inner">
<!-- 				<form name="frm" method="POST"> -->
<%-- 					<input type="hidden" name="skinType" value="${methodSuggestVO.skinType}">  --%>
<%-- 					<input type="hidden" name="makeUpDegree" value="${methodSuggestVO.makeUpDegree}"> --%>
<%-- 					<input type="hidden" name="weather" value="${methodSuggestVO.weather}">  --%>
<%-- 					<input type="hidden" name="dust" value="${methodSuggestVO.dust}"> --%>
<!-- 				</form> -->
				<div>
					<h4 style="float: left">제품 추천 :&nbsp;&nbsp;&nbsp;</h4>
					<h4 id='gend' style="float: left"></h4>
					<h4 style="float: left">&nbsp;&nbsp;&nbsp;#${prodSuggestVO.age}대&nbsp;&nbsp;&nbsp;</h4>
					<h4 id='skin' style="float: left"></h4>
					<br/>
                    

					<div>
						<hr>
					</div>
					
					<table>
						<thead>
							<tr>
								<th>순위</th>
								<th>제품 사진</th>
								<th>제품 정보</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="productVO" varStatus="status">
								<tr>
									<td id='rank' style="vertical-align: middle">${status.count}</td>
									<td style="vertical-align: middle">
										<a href='/prodSuggest/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&prodNo=${productVO.prodNo}'>
											<img id='photo' src="displayFile?fileName=${productVO.img}" border="0" alt="이미지 없음"/> 
										</a>
									</td>
									<td style="vertical-align: middle">
										    <a href='/prodSuggest/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&prodNo=${productVO.prodNo}'> ${productVO.name} </a>
											<br/>
											제조사 : ${productVO.compName}
											<br/>
											<c:forEach items="${prodTypeList}" var="prodTypeVO">
												<c:if test="${prodTypeVO.prodtypeNo eq productVO.prodtypeNo}">
													타입 : ${prodTypeVO.name}&nbsp;${prodTypeVO.category}
												</c:if>
											</c:forEach>
											<br/>
											가격 : ${productVO.price}
											<br/>
											<a href="${productVO.link}">구매 링크</a>
									</td>
								 </tr>
							</c:forEach>
						</tbody>
					</table>
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
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}else if (result == 'ERROR') {
		alert("중복된 값이 있습니다.");
	} else if (result == 'MODSUCCESS') {
		alert("수정되었습니다.");
	} else if (result == 'DELSUCCESS') {
		alert("삭제되었습니다.");
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});
				
				$('#logout').on("click", function(evt) {

					self.location = "/admin/logout";

				});

			});
	
	
	function changeName(dataName) {
		switch(dataName){
		  case "U1" :
			  return "#여성";
			  break;
		  case "U2" :
			  return "#남성";
			  break;
		  case "DR" :
			  return "#건성";
			  break;
		  case "NE" :
			  return "#중성";
			  break;
		  case "OI" :
			  return "#지성";
			  break;
		  case "CO" :
			  return "#복합성";
			  break;
		  case "SE" : 
			  return "#민감성";
			  break;
		}
	}
	
	var gen = "${prodSuggestVO.gender}";
	var skn = "${prodSuggestVO.skinType}";
	
	document.getElementById("gend").innerHTML = changeName(gen);
	document.getElementById("skin").innerHTML = changeName(skn);
	
	
</script>
</html>