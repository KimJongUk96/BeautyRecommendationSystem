<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
ul.paging {
   list-style: none;
   float: left;
   display: inline;
}

ul.paging li {
   float: left;
}

ul.paging li a {
   float: left;
   padding: 4px;
   margin-right: 3px;
   width: 15px;
   color: #000;
   font: bold 12px tahoma;
   border: 1px solid #eee;
   text-align: center;
   text-decoration: none;
}

ul.paging li a:hover, ul.paging li a:focus {
   color: #fff;
   border: 1px solid #f40;
   background-color: #f40;
}
</style>

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
			<li><a href="/productSuggest/infoInput">세안 제품 추천</a></li>
			<li><a href="/methodSuggest/suggest">세안법 추천</a></li>
		</ul>
		
	</nav>

	<!-- Main -->
	<section id="main" class="wrapper">
	<div class="inner">
	<div class="align-center">
			<form name="frm" method="POST">
				<input type="hidden" name="skinType" value="${methodSuggestVO.skinType}"> 
				<input type="hidden" name="makeUpDegree" value="${methodSuggestVO.makeUpDegree}">
				<input type="hidden" name="weather" value="${methodSuggestVO.weather}"> 
				<input type="hidden" name="dust" value="${methodSuggestVO.dust}">
			</form>
			<div>
			
				<h3>세안법 추천</h3>
				
				<div>
					<h4></h4>
				</div>
				
				<div class="inner">
				<div class="align-center">
				 <table class="alt">
					<thead>
						<tr>
							<th>No</th>
							<th>세안법 STEP</th>
							<th>세안법</th>
						</tr>
					</thead>
					<!-- methodSuggestList와 각 method의 detailList를 foreach문을 통해 받아옴 -->
					<c:choose>
					<c:when test="${not empty methodList}">
					<tbody>
						<c:forEach items="${methodList}" var="methodSuggestVO" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a href="/methodSuggest/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&methodNo=${methodSuggestVO.methodNo}">${methodSuggestVO.methodStep}스텝</a></td>
								<td>
								<c:forEach items="${methodSuggestVO.detailList}" var="methodDetailVO">
								${methodDetailVO.step} : ${methodDetailVO.name}, ${methodDetailVO.method}<br>
								</c:forEach>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
					<tr>
						<td colspan="3" align="center">
						<b>검색된 값이 없습니다.</b></td>
					</tr>
					</c:otherwise>
					</c:choose>
						
					</tbody>
				</table>
			</div>
			<div align="center">
				<a href="/methodSuggest/suggest"><button class="button special small">세안법 다시 추천 받기</button></a>
			</div>
			<br><br>
			<div class="container">
         <div class="outer">
            <div class="inner">
               <div class="centered">
                  <nav>
                     <ul class='paging'>

                        <c:if test="${pageMaker.prev}">
                           <li><a
                              href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
                        </c:if>

                        <c:forEach begin="${pageMaker.startPage }"
                           end="${pageMaker.endPage }" var="idx">
                           <li><a
                              href="list${pageMaker.makeQuery(idx)}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx}</a>
                           </li>
                        </c:forEach>

                        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                           <li><a
                              href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
                        </c:if>

                     </ul>
                  </nav>
               </div>
            </div>
         </div>
      </div>
			
			</div>
			</div>
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
	var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("등록되었습니다.");
		} else if (result == 'ERROR') {
			alert("중복된 값이 있습니다.");
		} else if (result == 'MODSUCCESS') {
			alert("수정되었습니다.");
		} else if (result == 'DELSUCCESS') {
			alert("삭제되었습니다.");
		}
	</script>

	<script>
		$(document).ready(function() {

			$('#newBtn').on("click", function(evt) {

				self.location = "register";

			});

		});
	</script>

</body>
</html>