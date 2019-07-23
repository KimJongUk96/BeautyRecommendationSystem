<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post">

					<input type='hidden' name='adminNo' value="${adminVO.adminNo}">

				</form>

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Id</label> <input type="text"
							name='id' class="form-control" value="${adminVO.id}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Name</label>
						<textarea class="form-control" name="name" readonly="readonly">${adminVO.name}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Regdate</label> <input type="text"
							name="regdate" class="form-control" value="${adminVO.regdate}"
							readonly="readonly">
					</div>
					
				</div>




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

