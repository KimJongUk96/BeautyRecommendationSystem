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
					<h3 class="box-title">REGISTER REVIEW</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">이메일</label> <input type="text"
								id="email" name='email' class="form-control"
								placeholder="Enter Title">
							<!-- oninput="checkId()" -->
							<span id="chkMsg">email 중복 확인 하세요</span>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">비밀번호</label> <input
								type="password" name='password' class="form-control"
								placeholder="Enter Title">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">닉네임</label> <input type="text"
								name='nickName' class="form-control" placeholder="Enter Title">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">성별</label> <input type="radio"
								name="gender" value="U1" checked="checked" /> 여성 <input
								type="radio" name="gender" value="U2" /> 남성
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">연령</label> <select name="age">
								<option value="10">10대</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대</option>
								<option value="50">50대</option>
							</select>
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">피부 타입</label> <select
								name="skinType">
								<option value="DR">건성</option>
								<option value="NE">중성</option>
								<option value="CO">복합성</option>
								<option value="SE">민감성</option>
								<option value="OI">지성</option>
							</select>
						</div>

						<!--
						 	<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> <input type="text"
								name="writer" class="form-control" placeholder="Enter Writer">
						</div>
						
						-->
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script type="text/javascript">
	//아이디가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
	$(function() {

		$("#email").change(function() {
			var email = $('#email').val();

			if (email != '') {//이메일이 값이 있을 경우에만 Email check

				$.ajax({
					url : '/user/checkid',
					type : 'post',
					data : {
						email : email
					},
					success : function(data) {
						if ($.trim(data) == 0) {
							$('#chkMsg').html("사용가능");
						} else {
							$('#chkMsg').html("사용불가");
						}
					},
				});

			}else{
				//SPAN 초기화
				$('#chkMsg').html('email 중복 확인 하세요');
				
			}
		});
	});

	/* 	var idCheck = 0;

	 function checkId() {
	 var email = $('#email').val();
	 $.ajax({
	 url : '/user/checkid',
	 type : 'post',
	 data : {
	 email : email
	 },
	 success : function(data) {
	 if ($.trim(data) == 0) {
	 $('#chkMsg').html("사용가능");
	 } else {
	 $('#chkMsg').html("사용불가");
	 }
	 },
	 /* error:function(){
	 alert("에러입니다");
	 }
	 });
	 }; */
</script>
