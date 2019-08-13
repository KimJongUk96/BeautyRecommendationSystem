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

</nav>


<!-- Main -->
<section id="main" class="wrapper">
	<div class="inner">
		<div class="align-center">
			<h2>세안 제품 추천</h2>
			<p>
			<hr>
			피부 타입과 피부 고민에 따른 <br />나만의 맞춤형 세안 제품을 추천 받으세요
			<hr>
			</p>
		</div>

		<div>

			<form method="post">
				<h4>피부정보 입력</h4>
				<div class = "row uniform">

					<div class="3u 12u$(small)">
						<label>나이</label>
						<select id="age" name="age">
							<option value = "10" <c:out value="${prodSuggestVO.age eq '10'?'selected':''}"/>> 10대        </option>
							<option value = "20" <c:out value="${prodSuggestVO.age eq '20'?'selected':''}"/>> 20대        </option>
							<option value = "30" <c:out value="${prodSuggestVO.age eq '30'?'selected':''}"/>> 30대        </option>
							<option value = "40" <c:out value="${prodSuggestVO.age eq '40'?'selected':''}"/>> 40대        </option>
							<option value = "50" <c:out value="${prodSuggestVO.age eq '50'?'selected':''}"/>> 50대        </option>
						</select>
					</div>


					<div class="3u 12u$(small)">
						<label>피부 타입</label>
						<select name="skinType" id="skinType">
							<option value="DR" <c:out value="${prodSuggestVO.skinType eq 'DR'?'selected':''}"/>>건성</option>
							<option value="NE" <c:out value="${prodSuggestVO.skinType eq 'NE'?'selected':''}"/>>중성</option>
							<option value="OI" <c:out value="${prodSuggestVO.skinType eq 'OI'?'selected':''}"/>>지성</option>
							<option value="CO" <c:out value="${prodSuggestVO.skinType eq 'CO'?'selected':''}"/>>복합성</option>
							<option value="SE" <c:out value="${prodSuggestVO.skinType eq 'SE'?'selected':''}"/>>민감성</option>
						</select>
					</div>


					<div class="3u 12u$(small)">
						<label>성별</label>
						<br>
						<fieldset>
							<input type="radio" name="gender" value="U1" id="U1" checked="checked"<c:out value="${prodSuggestVO.gender eq 'U1'?'checked':''}"/>><label for="U1">여성</label>
							&nbsp; &nbsp; &nbsp;
							<input type="radio" name="gender" value="U2" id="U2" <c:out value="${prodSuggestVO.gender eq 'U2'?'checked':''}"/>><label for="U2">남성</label>
						</fieldset>
					</div>

					<div class="3u 12u$(small)">
						<br><br>
						<button style="float: left" type="submit" id="suggest" class="button small">제품 추천 받기</button>
					</div>

				</div>
			</form>

			<div>
				<hr>
			</div>

			<table id='table'>
				<thead>
				<tr>
					<th>순위/점수</th>
					<th>제품 사진</th>
					<th>제품 정보</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="productVO" varStatus="status">
					<tr>
						<td id='rank' style="vertical-align: middle">
							<h3 style="vertical-align: middle">${status.count}</h3>
							<br/>
								${sugs[status.count-1]} / 5.0
						</td>
						<td style="vertical-align: middle">
							<a href='/productSuggest/readPage?&prodNo=${productVO.prodNo}'>
								<img id='photo' src="displayFile?fileName=${productVO.img}" border="0" alt="이미지 없음"/>
							</a>
						</td>
						<td style="vertical-align: middle">
							<a href='/productSuggest/readPage?&prodNo=${productVO.prodNo}'> ${productVO.name} </a>
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
        alert("리뷰 데이터가 부족한 관계로 추천이 불가능합니다.");
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

</script>
</html>