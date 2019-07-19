<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">세안법 등록</h3>
				</div>
				<!-- /.box-header -->
				<form role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">피부타입</label>
							<select name="skinType">
							<option value="DR">건성</option>
							<option value="NE">중성</option>
							<option value="OI">지성</option>
							<option value="CO">복합성</option>
							<option value="SE">민감성</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">화장정도</label>
							<select name="makeUpDegree">
							<option value="NM">노 메이크업</option>
							<option value="YM">메이크업</option>
							<option value="SM">색조 메이크업</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">세안법 Step</label>
							<select name="methodStep" id="methodStep">
							<option value="1" id="step1">step1</option>
							<option value="2" id="step2">step2</option>
							<option value="3" id="step3">step3</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">step</label> <input type="text"
								name="step" class="form-control" id="step">
						</div>
						
						<div class="form-group" id="method">
							<label for="exampleInputPassword1">세안법</label>
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step1 세안법"></textarea>
						</div>
						
						<div class="form-group" id="prodNo">
							<label for="exampleInputEmail1">사용제품명</label>
							<select name="prodNo" id="prodNo">
							<c:forEach items="${prodList}" var="productVO">
							<option value="${productVO.prodNo}">${productVO.name}</option>
							</c:forEach>
							</select>
						</div> 
						
						<div class="form-group" id="method2">
							<label for="exampleInputPassword1">세안법2</label>
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step2 세안법"></textarea>
						</div>
						
						<div class="form-group" id="prodNo2">
							<label for="exampleInputEmail1">사용제품명2</label>
							<select name="prodNo" id="prodNo">
							<c:forEach items="${prodList}" var="productVO">
							<option value="${productVO.prodNo}">${productVO.name}</option>
							</c:forEach>
							</select>
						</div> 
						
						<div class="form-group" id="method3">
							<label for="exampleInputPassword1">세안법3</label>
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step3 세안법"></textarea>
						</div>
						
						<div class="form-group" id="prodNo3">
							<label for="exampleInputEmail1">사용제품명3</label>
							<select name="prodNo" id="prodNo">
							<c:forEach items="${prodList}" var="productVO">
							<option value="${productVO.prodNo}">${productVO.name}</option>
							</c:forEach>
							</select>
						</div> 
						
						<!--  
 						<div class="form-group">
							<label for="exampleInputEmail1">사용제품타입</label>
							<select name="prodtypeNo" id="prodtypeNo">
							<c:forEach items="${prodTypeList}" var="prodTypeVO">
							<option value="${prodTypeVO.prodtypeNo}">${prodTypeVO.name}</option>
							</c:forEach>
							</select>
						</div>
						-->
						
						<div class="form-group">
							<label for="exampleInputEmail1">계절</label> 
							<input type="radio" name="season" value="S1">봄
							<input type="radio" name="season" value="S2">여름
							<input type="radio" name="season" value="S3">가을
							<input type="radio" name="season" value="S4">겨울
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">날씨</label>
							<input type="radio" name="weather" value="W1">맑음
							<input type="radio" name="weather" value="W2">흐림
							<input type="radio" name="weather" value="W3">눈/비
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">미세먼지</label> 
							<input type="radio" name="dust" value="D1">좋음
							<input type="radio" name="dust" value="D2">보통
							<input type="radio" name="dust" value="D3">나쁨
							<input type="radio" name="dust" value="D4">매우나쁨
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">admin</label> <input type="text"
								name="adminNo" class="form-control">
						</div>
						
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

<script>


$(document).ready(function(){
	$('#method').show();
	$('#prodNo').show();
	$('#method2').hide();
	$('#prodNo2').hide();
	$('#method3').hide();
	$('#prodNo3').hide();

jQuery('#methodStep').change(function(){
	
	var value = jQuery('#methodStep option:selected').val();	
	
	if(value == '1'){
		$('#method').show();
		$('#prodNo').show();
		$('#method2').hide();
		$('#prodNo2').hide();
		$('#method3').hide();
		$('#prodNo3').hide();
		
	}else if(value == '2'){
		$('#method').show();
		$('#prodNo').show();
		$('#method2').show();
		$('#prodNo2').show();
		$('#method3').hide();
		$('#prodNo3').hide();
		
	}else if(value == '3'){
		$('#method').show();
		$('#prodNo').show();
		$('#method2').show();
		$('#prodNo2').show();
		$('#method3').show();
		$('#prodNo3').show();
		}
	});
});
</script>

<<script type="text/javascript">
</script>

