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
					<h3 class="box-title">세안법 관리</h3>
					<button id='newBtn'>세안법 등록</button>
				</div>


				<div class='box-body'>
					<label>피부타입</label>
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="p"
							<c:out value="${cri.searchType eq 'p'?'selected':''}"/>>
							건성</option>
						<option value="g"
							<c:out value="${cri.searchType eq 'g'?'selected':''}"/>>
							중성</option>
						<option value="b"
							<c:out value="${cri.searchType eq 'b'?'selected':''}"/>>
							지성</option>
						<option value="gb"
							<c:out value="${cri.searchType eq 'gb'?'selected':''}"/>>
							복합성</option>
						<option value="gb"
							<c:out value="${cri.searchType eq 'gb'?'selected':''}"/>>
							민감성</option>
					</select>
						
					<label>화장정도</label>
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="p"
							<c:out value="${cri.searchType eq 'p'?'selected':''}"/>>
							건성</option>
						<option value="g"
							<c:out value="${cri.searchType eq 'g'?'selected':''}"/>>
							중성</option>
						<option value="b"
							<c:out value="${cri.searchType eq 'b'?'selected':''}"/>>
							지성</option>
						<option value="gb"
							<c:out value="${cri.searchType eq 'gb'?'selected':''}"/>>
							복합성</option>
						<option value="gb"
							<c:out value="${cri.searchType eq 'gb'?'selected':''}"/>>
							민감성</option>
					</select>
					<button id='searchBtn'>검색</button>
					
					
				</div>
			</div>


			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">세안법 목록</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 10px">NO</th>
							<th>피부타입</th>
							<th>화장정도</th>
							<th>세안 Step</th>
							<th>등록일</th>
							
						</tr>

						<c:forEach items="${methodList}" var="methodVO">
							<tr>
								<td>${methodVO.methodNo}</td>
								<c:if test="${methodVO.skinType eq 'DR'}">
								<td><a href='/method/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&methodNo=${methodVO.methodNo}'>건성</a></td>
								</c:if>
								<c:if test="${methodVO.skinType eq 'NE'}">
								<td><a href='/method/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&methodNo=${methodVO.methodNo}'>중성</a></td>
								</c:if>
								<c:if test="${methodVO.skinType eq 'OI'}">
								<td><a href='/method/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&methodNo=${methodVO.methodNo}'>지성</a></td>
								</c:if>
								<c:if test="${methodVO.skinType eq 'CO'}">
								<td><a href='/method/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&methodNo=${methodVO.methodNo}'>복합성</a></td>
								</c:if>
								<c:if test="${methodVO.skinType eq 'SE'}">
								<td><a href='/method/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&methodNo=${methodVO.methodNo}'>민감성</a></td>
								</c:if>
								
								<c:if test="${methodVO.makeUpDegree eq 'NM'}">
								<td>노 메이크업</td>
								</c:if>
								<c:if test="${methodVO.makeUpDegree eq 'YM'}">
								<td>메이크업</td>
								</c:if>
								<c:if test="${methodVO.makeUpDegree eq 'SM'}">
								<td>색조 메이크업</td>
								</c:if>
								
								<td>${methodVO.methodStep}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${methodVO.regdate}"></fmt:formatDate></td>
								
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
				
			});
</script>

