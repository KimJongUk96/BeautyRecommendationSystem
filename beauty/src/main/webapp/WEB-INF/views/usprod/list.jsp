<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->


		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">세안제품 리스트</h3>
				</div>


				<div class='box-body'>

					<%--  <select name="searchCategory">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							-----</option>
						<option value="1000"
							<c:out value="${cri.searchType eq ''?'selected':''}"/>>
							클렌저</option>
						<option value="1001"
							<c:out value="${cri.searchType eq '1001'?'selected':''}"/>>
							모이스처라이저</option>
						<option value="1002"
							<c:out value="${cri.searchType eq '1002'?'selected':''}"/>>
							토너</option>
						<option value="1003"
							<c:out value="${cri.searchType eq '1003'?'selected':''}"/>>
							썬스크린</option>
						<option value="1020"
							<c:out value="${cri.searchType eq '1020'?'selected':''}"/>>
							클렌징비누</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
						
					<select name="searchProdtype">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							-----</option>
						<option value="fo"
							<c:out value="${cri.searchType eq ''?'selected':''}"/>>
							폼</option>
						<option value="oi"
							<c:out value="${cri.searchType eq '1001'?'selected':''}"/>>
							오일</option>
						<option value="wa"
							<c:out value="${cri.searchType eq '1002'?'selected':''}"/>>
							워터</option>
						<option value="g"
							<c:out value="${cri.searchType eq '1003'?'selected':''}"/>>
							젤</option>
						<option value="lo"
							<c:out value="${cri.searchType eq '1020'?'selected':''}"/>>
							로션</option>
						<option value="es"
							<c:out value="${cri.searchType eq '1020'?'selected':''}"/>>
							에센스</option>
						<option value="cr"
							<c:out value="${cri.searchType eq '1020'?'selected':''}"/>>
							크림</option>
						<option value="sp"
							<c:out value="${cri.searchType eq '1020'?'selected':''}"/>>
							스프레이</option>
						<option value="st"
							<c:out value="${cri.searchType eq '1020'?'selected':''}"/>>
							스틱</option>
						<option value="cu"
							<c:out value="${cri.searchType eq '1020'?'selected':''}"/>>
							쿠션</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'> --%>
					<input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>검색</button>
					<button id='newBtn'>등록</button>
					<button id='logout'>logout</button>

				</div>
			</div>


			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST PAGING</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 90px">no</th>
							<th>제품명</th>
							<th>제품 종류</th>
							<th>회사명</th>
							
						</tr>

						<c:forEach items="${list}" var="productVO">

							<tr>
								<td>${productVO.prodNo}
								<input type="hidden" value = "${productVO.ratingAvg}"></input></td>
								<td><a href='/usprod/read${pageMaker.makeSearch(pageMaker.cri.page) }&prodNo=${productVO.prodNo}'>
										${productVO.name} </a></td>
								<td>${productVO.prodtypeName} ${productVO.categoryName}</td>
								<td>${productVO.compName}</td>	
								
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
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

