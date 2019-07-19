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
					<h6 class="box-title">${productVO.name}</h6>
				</div>
				<!-- /.box-header -->

<form role="form" action="modifyPage" method="post">

	<input type='hidden' name='prodNo' value="${productVO.prodNo}"> 
	<input type='hidden' name='page' value="${cri.page}">
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

</form>

				<div class="box-body">
				
						<div class="form-group">
							<img height="125px" width="200px" src="displayFile?fileName=${productVO.img}" alt="이미지 없음"/>
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">제품 번호</label> 
							<input type="text" name='name' class="form-control" value="${productVO.prodNo}" readonly="readonly">
						</div>
						
					    <div class="form-group">
							<label for="exampleInputEmail1">제품명</label> 
							<input type="text" name='name' class="form-control" value="${productVO.name}" readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">사용자 성별</label> 
							<input type="text" name='cusGender' class="form-control" value="${productVO.cusGender}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">제품 회사</label>
							<input type="text" name='compName' class="form-control" value="${productVO.compName}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">제품 가격</label>
							<input type="text" name='price' class="form-control" value="${productVO.price}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">구매 링크</label>
							<input type="text" name='link' class="form-control" value="${productVO.link}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">제품 종류</label>
							<input type="text" name='prodtypeNo' class="form-control" value="${productVO.prodtypeNo}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">글쓴이</label> 
							<input type="text" name="adminNo" class="form-control" value="${productVO.adminNo}" readonly>
						</div>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">
					<button type="submit" class="btn btn-warning">Modify</button>
					<button type="submit" class="btn btn-danger" data-src="${productVO.img}">REMOVE</button>
					<button type="submit" class="btn btn-primary">GO LIST</button>
				</div>

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning").on("click", function() {
			formObj.attr("action", "/product/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-danger").on("click", function() {
			
			 var that = $(this);
				
			   $.ajax({
				   url:"deleteFile",
				   type:"post",
				   data: {fileName:$(this).attr("data-src")},
				   dataType:"text",
				   success:function(result){
					  
				   }
			   });
			   
			   formObj.attr("action", "/product/removePage");
			   formObj.submit();	 			
		});

		$(".btn-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/product/list");
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

