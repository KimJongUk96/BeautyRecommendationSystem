<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>

<head>
	<title>제품 상세보기</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet"
		  href="/resources/templated-intensify/assets/css/main.css" />

	<style type="text/css">
	
	table{
	width:100%;
	height: 100px;
	margin: auto;
	text-align: center;
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
		<li><a href="/methodSuggest/suggest">세안법 추천</a></li>
	</ul>
	<ul class="actions vertical">
		<li><a href="#" class="button fit">Login</a></li>
	</ul>
</nav>


<!-- Main -->
<br/>
<section id="main">
	
<div class="col-12"><br></div>
<div class="col-12"><br></div>
<form role="form" method="get" action="register">
				<div class="inner">
					
						<div class="row">

								<input type='hidden' name='email' value="${login.email}">
								<input type='hidden' name='prodNo' value="${productVO.prodNo}">
								<input type='hidden' name='img' value="${productVO.img}">
								<input type='hidden' name='compName' value="${productVO.compName}">
								<input type='hidden' name='name' value="${productVO.name}">
						

							

							<div class="col-xs-4 item-photo">
								<img id='photoReal' src="" border="0" alt="이미지 없음" style="width:400px; height:260px"/>
							</div>
							<div class="col-xs-5" style="border:0px solid gray">

								<h3>${productVO.name}</h3>
								<h5 style="color:#337ab7">${productVO.compName}</h5>


								<h6 class="title-price"><small>제품 가격</small></h6>
								<h3 style="margin-top:0px;">${productVO.price}</h3>


								<div class="section" style="padding-bottom:5px;">
									<h6 class="title-attr"><small>제품 종류</small></h6>
									<div>
										<c:forEach items="${prodTypeList}" var="prodTypeVO">
											<c:if test="${prodTypeVO.prodtypeNo eq productVO.prodtypeNo}">
												${prodTypeVO.name}&nbsp;${prodTypeVO.category}
											</c:if>
										</c:forEach>


									</div>
								</div>
								<div class="section" style="padding-bottom:5px;">
									<h6 class="title-attr"><small><br/>구매 링크</small></h6>
									<div>
										${productVO.link}
									</div>
								</div>



								<div class="section" style="padding-bottom:20px;">
									<a href="#" 
									onclick="javascript:window.open('${productVO.link}','',
									'left=50, top=50, width=1000, height=1000, toolbar=yes, menubar=yes, resizable=yes')">
									<button type="button" class="button">구매링크 바로가기</button></a>
									<a href="/usprod/list">
									<button type="button" class="button special">목록으로</button></a>
								</div>
							</div>

						</div>
					
				</div>
			



		<!-- review part -->
		<br/>
		<div class="inner">
		<div align="right">
		<button type="submit" class="button special small">리뷰 등록</button>
		</div>
		<br>
		<div class="col-xs-9">
			<div style="width:100%;border-top:1px solid silver">
				<table>
					<thead>
					<tr style="text-align:center">
						<th>닉네임</th>
						<th>평점</th>
						<th style="width:60%">리뷰</th>
						<th>등록일</th>
					</tr>
					</thead>
					<c:choose>
					<c:when test="${not empty list}">
					<tbody>
					<c:forEach items="${list}" var="reviewVO" varStatus="status">
						<tr>
							<td style="vertical-align: middle"><b>${reviewVO.userNickName}</b><br>
							<c:if test="${reviewVO.userGender eq 'U1' }">여성
							</c:if>
							<c:if test="${reviewVO.userGender eq 'U2' }">남성
							</c:if>/
							<c:if test="${reviewVO.userAge eq '10' }">10대
							</c:if>
							<c:if test="${reviewVO.userAge eq '20' }">20대
							</c:if>
							<c:if test="${reviewVO.userAge eq '30' }">30대
							</c:if>
							<c:if test="${reviewVO.userAge eq '40' }">40대
							</c:if>
							<c:if test="${reviewVO.userAge eq '50' }">50대 이상
							</c:if>/
							<c:if test="${reviewVO.userSkinType eq 'DR' }">건성
							</c:if>
							<c:if test="${reviewVO.userSkinType eq 'NE' }">중성
							</c:if>
							<c:if test="${reviewVO.userSkinType eq 'OI' }">지성
							</c:if>
							<c:if test="${reviewVO.userSkinType eq 'CO' }">복합성
							</c:if>
							<c:if test="${reviewVO.userSkinType eq 'SE' }">민감성
							</c:if></td>
							<td style="vertical-align: middle">${reviewVO.rating}</td>
							<td style="vertical-align: middle">${reviewVO.reviewText}</td>
							<td style="vertical-align: middle"><fmt:formatDate pattern="yyyy-MM-dd" value="${reviewVO.regdate}"></fmt:formatDate></td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
					<tr>
						<td colspan="4" align="center">
						<b>리뷰 데이터가 없습니다.</b></td>
					</tr>
					</c:otherwise>
					</c:choose>
					</tbody>
				</table>

			</div>
		</div>
		</div>
	
</form>
</section>
		

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
    
    function realPhoto(thumbnail){
    	var date = thumbnail.split('s');
    	var array = thumbnail.split('_');
    	return date[0]+array[1]+"_"+array[2];
    }
    
    var thumbnail = "${productVO.img}";
    
	document.getElementById("photoReal").src = "displayFile?fileName="+realPhoto(thumbnail);
</script>
<script>
    var result = '${msg}';
    var password = '${password}';

    if (result == 'FAIL') {
        alert("이메일을 확인해주세요.");
    }
    if (result == 'SUCCESS') {
        alert("비밀번호는" + password + "입니다.");
        window.close();
    }
    if(result == 'review') {
    	alert("리뷰가 등록되었습니다.")
    }
</script>

</html>
