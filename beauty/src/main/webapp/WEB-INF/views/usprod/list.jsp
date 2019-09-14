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
/*
*/
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
			<li><a href="/methodSuggest/suggest">세안법 추천</a></li>
		</ul>
		
	</nav>
		
<!-- Menu -->
   <nav id="menu">
      <ul class="links">
         <li><a href="/">Home</a></li>
         <li><a href="/usprod/list">세안 제품 목록</a></li>
         <li><a href="/productSuggest/list">세안 제품 추천</a></li>
         <li><a href="/methodSuggest/suggest">세안법 추천</a></li>
      </ul>

   </nav>
 <section id="main">
      <form name="frm" method="POST">
         <input type="hidden" name="skinType"  value="${methodSuggestVO.skinType}"> 
         <input type="hidden"  name="makeUpDegree" value="${methodSuggestVO.makeUpDegree}">
         <input type="hidden" name="weather" value="${methodSuggestVO.weather}"> 
         <input type="hidden" name="dust" value="${methodSuggestVO.dust}">
      </form>
 
	
<div class="col-12"><br></div>
<div class="col-12"><br></div>     
      
      <div class="inner">
         <h4 class="header-title">제품 리스트</h4>
         <div align="right">
            <div style="margin-bottom: 10px">
               <select name="listType" id="listType"
                  onchange="if(this.value) location.href=(this.value);"
                  style="width: 150px; height: 40px; line-height: 40px">
                  <option value="">정렬 기준</option>
                  <option <c:out value="${cri.listType eq 'regdate'?'selected':''}" />
                     value="/usprod/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&listType=regdate">최근
                     등록일 순</option>
                  <option <c:out value="${cri.listType eq 'rating'?'selected':''}" />
                     value="/usprod/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&listType=rating">인기순</option>
                  <option <c:out value="${cri.listType eq 'count'?'selected':''}" />
                     value="/usprod/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&listType=count">리뷰
                     많은 순</option>
               </select>
            </div>
            <div class="row" style="float: right; margin-bottom: 10px">
               <select name="searchType" id="searchType"
                  style="width: 150px; height: 40px; line-height: 40px; margin-right: 5px">
                  <option value="pn"
                     <c:out value="${cri.searchType eq 'pn'?'selected':''}"/> selected>
                     제품명</option>
                  <option value="cn"
                     <c:out value="${cri.searchType eq 'cn'?'selected':''}"/>>
                     제품 회사명</option>
                  <option value="ptn"
                     <c:out value="${cri.searchType eq 'ptn'?'selected':''}"/>>
                     제품 종류</option>

               </select> <input type="text" name='keyword' id="keywordInput"
                  style="width: 200px; height: 40px; line-height: 40px; margin-right: 5px" value="${cri.keyword}"></input>
               <button id='searchBtn' type="button" class="button small">검색</button>
            </div>

         </div>
         <div>
            <h4></h4>
         </div>
         <table>
            <thead>
               <tr>

               </tr>
            </thead>
            <c:choose>
					<c:when test="${not empty list}">
            <tbody>
               <c:forEach items="${list}" var="productVO" varStatus="listStat">

                  <tr>
                     <td style="width: 50px; text-align: center">
                     ${productVO.rnum}
                     <input type="hidden"
                        value="${productVO.prodNo }" /></td>
                        
                        
                     <td style="text-align: center"><img style="width: 100%; height: auto;"
                        src="displayFile?fileName=${productVO.img}" alt="이미지 없음" /></td>
                        <td style="text-align: center;"><span>${productVO.compName}</span>
                        <span> <a href='/usprod/read${pageMaker.makeSearch(pageMaker.cri.page) }&prodNo=${productVO.prodNo}'>
                              ${productVO.name} </a>
                       </span>
                       <br> ★ ${productVO.ratingAvg} (${productVO.count})
                        
                        
                        </td>
                        <!-- 
                     <td style="text-align: center"><span>${productVO.compName}</span>
                        <br> <span>
                           <a
                           href='/usprod/read${pageMaker.makeSearch(pageMaker.cri.page) }&prodNo=${productVO.prodNo}'>
                              ${productVO.name} </a>
                     </span> <br> ★ ${productVO.ratingAvg} (${productVO.count})</td> -->
                     
                     
                     <td style="text-align: center">${productVO.categoryName}&nbsp; ${productVO.prodtypeName} <br> ${productVO.price}원
                     </td>

                  </tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
					<tr>
						<td colspan="4" align="center">
						<b>제품 데이터가 없습니다.</b></td>
					</tr>
					</c:otherwise>
					</c:choose>
            </tbody>
         </table>
      </div>
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
   </section>
   <!-- /.box-body -->



   </div>
   <!-- end card body-->
   </div>
   <!-- end card -->
   </div>
   <!-- end col-->

   </div>
   <!-- end row-->

   </div>
   <!-- container -->

   </div>
   <!-- content -->

   <!-- Footer Start -->
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
   <!-- end Footer -->

   </div>

   <!-- ============================================================== -->
   <!-- End Page content -->
   <!-- ============================================================== -->


   </div>
   <!-- END wrapper -->


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
         alert("처리가 완료되었습니다.");
      }
   </script>

   <script>
      $(document).ready(
            function() {
               //<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
               $('#searchBtn').on(
                     "click",
                     function(event) {
                        var keyword = $('#keywordInput').val();
                        var keyArray = keyword.split(' ');
                        keyword = '';
                        for (i = 0; i < keyArray.length; i++) {
                           keyword = keyword + keyArray[i];
                        }

                        self.location = "list"
                              + '${pageMaker.makeQuery(1)}'
                              + "&searchType="
                              + $("#searchType option:selected").val()
                              + "&keyword=" + keyword;

                     });

               $('#newBtn').on("click", function(evt) {

                  self.location = "register";

               });

               $('#logout').on("click", function(evt) {

                  self.location = "/admin/logout";

               });

            });
   </script>
</body>
</html>