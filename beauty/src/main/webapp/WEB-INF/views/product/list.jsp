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
					<h3 class="box-title">Product List</h3>
				</div>


				<div class='box-body'>

					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="pn"
							<c:out value="${cri.searchType eq 'pn'?'selected':''}"/>>
							제품명</option>
						<option value="cn"
							<c:out value="${cri.searchType eq 'cn'?'selected':''}"/>>
							제품 회사명</option>
						<option value="ptn"
							<c:out value="${cri.searchType eq 'ptn'?'selected':''}"/>>
							제품 종류</option>
						
					</select> <input type="text" name='keyword' id="keywordInput"
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
							<th style="width: 90px">제품 번호</th>
							<th>사진</th>
							<th>제품명</th>
							<th>회사명</th>
							<th>제품 종류</th>
							<th>가격</th>
							<th>등록일</th>
							
						</tr>

						<c:forEach items="${list}" var="productVO">

							<tr>
								<td>${productVO.prodNo}</td>
								<td> <img height="125px" width="200px" src="displayFile?fileName=${productVO.img}" alt="이미지 없음"/> </td>
								<td><a href='/product/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&prodNo=${productVO.prodNo}'>
										${productVO.name} </a></td>
								<td>${productVO.compName}</td>	
								<td>${productVO.prodtypeNo}</td>
								<td>${productVO.price}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${productVO.regdate}"></fmt:formatDate></td>
								
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

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
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

