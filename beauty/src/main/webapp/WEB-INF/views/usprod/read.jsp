<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ REVIEW</h3>
				</div>
				<!-- /.box-header -->

<form role="form" action="modifyPage" method="post">

	<input type='hidden' name='reviewNo' value="${productVO.prodNo}"> <input
		type='hidden' name='page' value="${cri.page}"> <input
		type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

</form>

				<div class="box-body">
					<div class="form-group">
							<label for="exampleInputEmail1">제품명</label> <input type="text"
								name='name' class="form-control" value="${productVO.name}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">제조사</label> <input type="text"
								name='compName' class="form-control" value="${productVO.compName}" readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">이미지</label> <input type="text"
								name='img' class="form-control" value="${productVO.img}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">타입</label> 
							<input type='hidden' name=prodtypeNo value="${productVO.prodtypeNo}">
							<input type="text"
								name='prodtypeName' class="form-control" value="${productVO.prodtypeName}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">가격</label> <input type="text"
								name='price' class="form-control" value="${productVO.price}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">평점</label> <input type="text"
								name='ratingAvg' class="form-control" value="${productVO.ratingAvg}" readonly="readonly">
						</div>
							
						</div>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">
					<button type="submit" class="btn btn-warning">Modify</button>
					<button type="submit" class="btn btn-danger">REMOVE</button>
					<button type="submit" class="btn btn-primary">GO LIST</button>
				</div>


<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning").on("click", function() {
			formObj.attr("action", "/review/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "/review/removePage");
			formObj.submit();
		});

		$(".btn-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/review/list");
			formObj.submit();
		});

	});
</script>




			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

