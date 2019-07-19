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
					<h3 class="box-title">REGISTER REVIEW</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post" action="modify">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">이메일</label> 
							<input type="text" name='email' class="form-control" 
							placeholder="Enter Title"  value = "${userVO.email }" readonly>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">비밀번호</label>
							<input type="password" name='password' class="form-control" 
							placeholder="Enter Title" value = "${userVO.password }" >
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">닉네임</label> 
							<input type="text" name='nickName' class="form-control"
							 placeholder="Enter Title" value = "${userVO.nickName }">
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">성별</label> 
							<input type="radio" name="gender" value="U1"<c:out value="${userVO.gender eq 'U1'?'checked':''}"/> /> 여성
							<input type="radio" name="gender" value="U2"<c:out value="${userVO.gender eq 'U2'?'checked':''}"/> /> 남성
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">연령</label> 
							<select name = "age">
							<option value ="10"<c:out value="${userVO.age eq '10'?'selected':''}"/>>10대</option>
							<option value ="20"<c:out value="${userVO.age eq '20'?'selected':''}"/>>20대</option>
							<option value ="30"<c:out value="${userVO.age eq '30'?'selected':''}"/>>30대</option>
							<option value ="40"<c:out value="${userVO.age eq '40'?'selected':''}"/>>40대</option>
							<option value ="50"<c:out value="${userVO.age eq '50'?'selected':''}"/>>50대</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">피부 타입</label> 
							<select name = "skinType">
							<option value ="DR"<c:out value="${userVO.skinType eq 'DR'?'selected':''}"/>>건성</option>
							<option value ="NE"<c:out value="${userVO.skinType eq 'NE'?'selected':''}"/>>중성</option>
							<option value ="OI"<c:out value="${userVO.skinType eq 'OI'?'selected':''}"/>>지성</option>
							<option value ="CO"<c:out value="${userVO.skinType eq 'CO'?'selected':''}"/>>복합성</option>
							<option value ="SE"<c:out value="${userVO.skinType eq 'SE'?'selected':''}"/>>민감성</option>
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
</div>
<!-- /.content-wrapper -->

