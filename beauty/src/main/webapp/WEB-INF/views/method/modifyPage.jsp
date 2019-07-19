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
					<h3 class="box-title">MODIFY REVIEW</h3>
				</div>
				<!-- /.box-header -->

<form role="form" action="modifyPage" method="post">

	<input type='hidden' name='methodNo' value="${methodVO.methodNo}">
	<input type='hidden' name='page' value="${cri.page}"> <input
		type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

							<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">피부타입</label>
							<select name="skinType">
							<option value="DR"<c:out value="${methodVO.skinType eq 'DR'?'selected':''}"/>>건성</option>
							<option value="NE"<c:out value="${methodVO.skinType eq 'NE'?'selected':''}"/>>중성</option>
							<option value="OI"<c:out value="${methodVO.skinType eq 'OI'?'selected':''}"/>>지성</option>
							<option value="CO"<c:out value="${methodVO.skinType eq 'CO'?'selected':''}"/>>복합성</option>
							<option value="SE"<c:out value="${methodVO.skinType eq 'SE'?'selected':''}"/>>민감성</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">화장정도</label>
							<select name="makeUpDegree">
							<option value="NM"<c:out value="${methodVO.makeUpDegree eq 'NM'?'selected':''}"/>>노 메이크업</option>
							<option value="YM"<c:out value="${methodVO.makeUpDegree eq 'YM'?'selected':''}"/>>메이크업</option>
							<option value="SM"<c:out value="${methodVO.makeUpDegree eq 'SM'?'selected':''}"/>>색조메이크업</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">세안법 Step</label>
							<select name="methodStep" id="methodStep">
							<option value="1" id="step1"<c:out value="${methodVO.methodStep eq '1'?'selected':''}"/>>Step1</option>
							<option value="2" id="step2"<c:out value="${methodVO.methodStep eq '2'?'selected':''}"/>>Step2</option>
							<option value="3" id="step3"<c:out value="${methodVO.methodStep eq '3'?'selected':''}"/>>Step3</option>
							</select>
						</div>
						
						<div class="form-group">
							<c:forEach items="${detailList}" var="methodDetailVO">
							<input type="hidden" name="step" id="step" value="${methodDetailVO.step}">
							</c:forEach>
						</div>
						
						<div class="form-group" id="method">
							<label for="exampleInputPassword1">세안법</label>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:if test="${status.count eq '1'}">
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step1 세안법">${methodDetailVO.method}</textarea>
								</c:if>
								</c:forEach>
						</div>
						
						<div class="form-group" id="prodNo">
							<label for="exampleInputEmail1">사용제품명</label>
							<select name="prodNo" id="prodNo">
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:forEach items="${prodList}" var="productVO">
							<c:if test="${status.count eq '1'}">
							<option value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							</c:forEach>
							</c:forEach>
							</select>
						</div> 
						
						<div class="form-group" id="method2">
							<label for="exampleInputPassword1">세안법2</label>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:if test="${status.count eq '2'}">
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step2 세안법">${methodDetailVO.method}</textarea>
							</c:if>
								</c:forEach>
						</div>
						
						<div class="form-group" id="prodNo2">
							<label for="exampleInputEmail1">사용제품명2</label>
							<select name="prodNo" id="prodNo">
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:forEach items="${prodList}" var="productVO">
							<c:if test="${status.count eq '2'}">
							<option value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							</c:forEach>
							</c:forEach>
							</select>
						</div> 
						
						<div class="form-group" id="method3">
							<label for="exampleInputPassword1">세안법3</label>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:if test="${status.count eq '3'}">
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step3 세안법">${methodDetailVO.method}</textarea>
							</c:if>
								</c:forEach>
						</div>
						
						<div class="form-group" id="prodNo3">
							<label for="exampleInputEmail1">사용제품명3</label>
							<select name="prodNo" id="prodNo">
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:forEach items="${prodList}" var="productVO">
							<c:if test="${status.count eq '3'}">
							<option value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							</c:forEach>
							</c:forEach>
							</select>
						</div> 
						
						<div class="form-group">
							<label for="exampleInputEmail1">계절</label> 
							<input type="radio" name="season" value="S1"<c:out value="${methodVO.season eq 'S1'?'checked':''}"/>>봄
							<input type="radio" name="season" value="S2"<c:out value="${methodVO.season eq 'S2'?'checked':''}"/>>여름
							<input type="radio" name="season" value="S3"<c:out value="${methodVO.season eq 'S3'?'checked':''}"/>>가을
							<input type="radio" name="season" value="S4"<c:out value="${methodVO.season eq 'S4'?'checked':''}"/>>겨울
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">날씨</label>
							<input type="radio" name="weather" value="W1"<c:out value="${methodVO.weather eq 'W1'?'checked':''}"/>>맑음
							<input type="radio" name="weather" value="W2"<c:out value="${methodVO.weather eq 'W2'?'checked':''}"/>>흐림
							<input type="radio" name="weather" value="W3"<c:out value="${methodVO.weather eq 'W3'?'checked':''}"/>>눈/비
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">미세먼지</label> 
							<input type="radio" name="dust" value="D1"<c:out value="${methodVO.dust eq 'D1'?'checked':''}"/>>좋음
							<input type="radio" name="dust" value="D2"<c:out value="${methodVO.dust eq 'D2'?'checked':''}"/>>보통
							<input type="radio" name="dust" value="D3"<c:out value="${methodVO.dust eq 'D3'?'checked':''}"/>>나쁨
							<input type="radio" name="dust" value="D4"<c:out value="${methodVO.dust eq 'D4'?'checked':''}"/>>매우나쁨
						</div>
						
					</div>
				<!-- /.box-body -->
				</form>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">SAVE</button>
					<button type="submit" class="btn btn-warning">CANCEL</button>
				</div>

<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning")
				.on("click",function() {
					self.location = "/method/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});

		$(".btn-primary").on("click",
				function() {
					formObj.submit();
				});
	});
</script>

<script>
$(document).ready(function(){
	
	var value = jQuery('#methodStep option:selected').val();
	// selectbox value값에 따른 click,change 이벤트 강제 실행
	   if($(value == '1').trigger('click')){
			$('#methodStep').change();
	   }else if($(value == '2').trigger('click')){
		   $('#methodStep').change();
	   }else if($(value == '3').trigger('click')){
		   $('#methodStep').change();
	   }
	});
</script>

<script>
jQuery('#methodStep').change(function(){
	
	var value = jQuery('#methodStep option:selected').val();	
	// selectbox value값에 따라서 textArea 보기 / 숨기기
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

