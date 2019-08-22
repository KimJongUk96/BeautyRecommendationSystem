<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
    
    <style>
input[type='radio'] {
  -webkit-appearance:none;
  width:15px;
  height:15px;
  border-radius:50%;
  outline:none;
  background-color: #fff;
  border: #CCCCCC solid 1px;
}
input[type='radio']:before {
  content:'';
  display:block;
  width:60%;
  height:60%;
  margin: 20% auto;   
  border-radius:50%;   
}
input[type='radio']:checked:before {
  background:#727cf5;
}
    </style>
    
        <meta charset="utf-8" />
        <title>관리자 페이지</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="/resources/dist/assets/images/favicon.ico">

        <!-- inline style to handle loading of various element-->
        <style>body.loading {visibility: hidden;}</style>

        <!-- third party css -->
        <link href="/resources/dist/assets/css/vendor/fullcalendar.min.css" rel="stylesheet" type="text/css" />
        <!-- third party css end -->

        <!-- App css -->
        <link href="/resources/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="/resources/dist/assets/css/app.min.css" rel="stylesheet" type="text/css" id="main-style-container" />

    </head>

    <body class="loading">
        <!-- Begin page -->
        <div class="wrapper">

            <div id="vertical-topbar-placeholder"></div>
            <div id="vertical-sidebar-placeholder"></div>

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">

                    
					<div><h3></h3></div>
                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                       

                        <div class="row">
                            <div class="col-lg-8">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">세안법 수정</h4>
                                       

                                        <div class="row">
                                            <div class="col-lg-12">
                                            
					<form role="form" action="modifyPage" method="post">

						<input type='hidden' name='methodNo' value="${methodVO.methodNo}">
						<input type='hidden' name='page' value="${cri.page}"> 
						<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
                                                	

                        <div class="form-group mb-3">
							<label for="example-select">피부타입</label>
							<select class="form-control" name="skinType">
							<option value="DR"<c:out value="${methodVO.skinType eq 'DR'?'selected':''}"/>>건성</option>
							<option value="NE"<c:out value="${methodVO.skinType eq 'NE'?'selected':''}"/>>중성</option>
							<option value="OI"<c:out value="${methodVO.skinType eq 'OI'?'selected':''}"/>>지성</option>
							<option value="CO"<c:out value="${methodVO.skinType eq 'CO'?'selected':''}"/>>복합성</option>
							<option value="SE"<c:out value="${methodVO.skinType eq 'SE'?'selected':''}"/>>민감성</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="example-select">화장정도</label>
							<select class="form-control" name="makeUpDegree">
							<option value="NM"<c:out value="${methodVO.makeUpDegree eq 'NM'?'selected':''}"/>>노 메이크업</option>
							<option value="YM"<c:out value="${methodVO.makeUpDegree eq 'YM'?'selected':''}"/>>메이크업</option>
							<option value="SM"<c:out value="${methodVO.makeUpDegree eq 'SM'?'selected':''}"/>>색조메이크업</option>
							</select>
						</div>
						
<%-- 						<div class="form-group">
							<label for="example-select">세안법 Step</label>
							<select class="form-control" name="methodStep" id="methodStep">
							<option value="1" id="step1"<c:out value="${methodVO.methodStep eq '1'?'selected':''}"/>>Step1</option>
							<option value="2" id="step2"<c:out value="${methodVO.methodStep eq '2'?'selected':''}"/>>Step2</option>
							<option value="3" id="step3"<c:out value="${methodVO.methodStep eq '3'?'selected':''}"/>>Step3</option>
							</select>
						</div> --%>
						<input type="hidden" name="methodStep" class="form-control" value="${methodVO.methodStep}" id="methodStep">
						
						<div class="form-group mb-3">
							<c:forEach items="${detailList}" var="methodDetailVO">
							<input type="hidden" name="step" id="step" value="${methodDetailVO.step}">
							</c:forEach>
						</div>
						<!-- 1 -->
						<div class="form-group mb-3" id="method">
							<label for="exampleInputPassword1">세안법</label>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:if test="${status.count eq '1'}">
							<textarea class="form-control" name="method" rows="5" id="method"
								placeholder="Step1 세안법">${methodDetailVO.method}</textarea>
								</c:if>
								</c:forEach>
						</div>
						
						<div class="form-group" id="prodNo">
							<label for="example-select">사용제품명</label>
							<select class="form-control" name="prodNo" id="prodNo">
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:forEach items="${prodList}" var="productVO">
							<c:if test="${status.count eq '1'}">
							<option value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							</c:forEach>
							</c:forEach>
							</select>
						</div> 
						<!-- 2 -->
						<div class="form-group mb-3" id="method2">
							<label for="exampleInputPassword1">세안법</label>
							<c:choose>
							<c:when test="${methodVO.methodStep <= 1}">
							<!-- 3번 세안법이 없을 경우 -->
							<div class="form-group mb-3" id="method2">
								<textarea class="form-control" name="method" rows="5" id="method2"
									placeholder="Step2 세안법"></textarea>
							</div>
							
							</c:when>
							<c:otherwise>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							
							
							<c:if test="${status.count eq '2'}">
							
							
							<c:if test="${not empty methodDetailVO}">
							 <!-- 실제 값 있을 경우 만들어라 -->
								<div class="form-group mb-3" id="method2">
								<textarea class="form-control" name="method" rows="5" id="method2"
									placeholder="Step2 세안법">${methodDetailVO.method}</textarea>
							</div>							
							</c:if>
							
							
							<c:if test="${empty methodDetailVO}">
							 <!-- 빈통을 만들어라 -->
							 <div class="form-group mb-3" id="method2">
								<textarea class="form-control" name="method" rows="5" id="method2"
									placeholder="Step2 세안법"></textarea>
							</div>
							</c:if>
							</c:if>
							
							</c:forEach>
							
							</c:otherwise>
							</c:choose>
						</div>
						
						<div class="form-group" id="prodNo2">
							<label for="example-select">사용제품명</label>
							<select class="form-control" name="prodNo" id="prodNo">
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:forEach items="${prodList}" var="productVO">
							<c:if test="${status.count eq '2'}">
							<option value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							<c:if test="${status.count eq '1'}">
							<option value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							</c:forEach>
							</c:forEach>
							</select>
						</div> 
						<!-- 3 -->
						<div class="form-group mb-3" id="method3">
							<label for="exampleInputPassword1">세안법</label>
							
							<c:choose>
							<c:when test="${methodVO.methodStep <= 2}">
							<!-- 3번 세안법이 없을 경우 -->
							<div class="form-group mb-3" id="method3">
								<textarea class="form-control" name="method" rows="5" id="method3"
									placeholder="Step3 세안법"></textarea>
							</div>
							
							</c:when>
							<c:otherwise>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							
							
							<c:if test="${status.count eq '3'}">
							
							
							<c:if test="${not empty methodDetailVO}">
							 <!-- 실제 값 있을 경우 만들어라 -->
								<div class="form-group mb-3" id="method3">
								<textarea class="form-control" name="method" rows="5" id="method3"
									placeholder="Step3 세안법">${methodDetailVO.method}</textarea>
							</div>							
							</c:if>
							
							
							<c:if test="${empty methodDetailVO}">
							 <!-- 빈통을 만들어라 -->
							 <div class="form-group mb-3" id="method3">
								<textarea class="form-control" name="method" rows="5" id="method3"
									placeholder="Step3 세안법"></textarea>
							</div>
							</c:if>
							</c:if>
							
							</c:forEach>
							
							</c:otherwise>
							</c:choose>
							
								
						</div>
						
							<div class="form-group" id="prodNo3">
							<label for="example-select">사용제품명</label>
							<select class="form-control" name="prodNo" id="prodNo">
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:forEach items="${prodList}" var="productVO">
							<c:if test="${status.count eq '3'}">
							<option value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							<c:if test="${status.count eq '1'}">
							<option value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							</c:forEach>
							</c:forEach>
							</select>
							</div>
							
							<!-- 4 -->
							<div class="form-group mb-3" id="method4">
							<label for="exampleInputPassword1">세안법</label>
							
							<c:choose>
							<c:when test="${methodVO.methodStep <= 3}">
							<!-- 3번 세안법이 없을 경우 -->
							<div class="form-group mb-3" id="method4">
								<textarea class="form-control" name="method" rows="5" id="method4"
									placeholder="Step4 세안법"></textarea>
							</div>
							
							</c:when>
							<c:otherwise>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							
							
							<c:if test="${status.count eq '4'}">
							
							
							<c:if test="${not empty methodDetailVO}">
							 <!-- 실제 값 있을 경우 만들어라 -->
								<div class="form-group mb-3" id="method4">
								<textarea class="form-control" name="method" rows="5" id="method4"
									placeholder="Step4 세안법">${methodDetailVO.method}</textarea>
							</div>							
							</c:if>
							
							
							<c:if test="${empty methodDetailVO}">
							 <!-- 빈통을 만들어라 -->
							 <div class="form-group mb-3" id="method4">
								<textarea class="form-control" name="method" rows="5" id="method4"
									placeholder="Step4 세안법"></textarea>
							</div>
							</c:if>
							</c:if>
							
							</c:forEach>
							
							</c:otherwise>
							</c:choose>
							
						</div>
						
							<div class="form-group" id="prodNo4">
							<label for="example-select">사용제품명</label>
							<select class="form-control" name="prodNo" id="prodNo">
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:forEach items="${prodList}" var="productVO">
							<c:if test="${status.count eq '4'}">
							<option value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							<c:if test="${status.count eq '1'}">
							<option value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							</c:forEach>
							</c:forEach>
							</select>
							</div>
							
							<!-- 5 -->
							<div class="form-group mb-3" id="method5">
							<label for="exampleInputPassword1">세안법</label>
							
							<c:choose>
							<c:when test="${methodVO.methodStep <= 4}">
							<!-- 3번 세안법이 없을 경우 -->
							<div class="form-group mb-3" id="method5">
								<textarea class="form-control" name="method" rows="5" id="method5"
									placeholder="Step5 세안법"></textarea>
							</div>
							
							</c:when>
							<c:otherwise>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							
							
							<c:if test="${status.count eq '5'}">
							
							
							<c:if test="${not empty methodDetailVO}">
							 <!-- 실제 값 있을 경우 만들어라 -->
								<div class="form-group mb-3" id="method4">
								<textarea class="form-control" name="method" rows="5" id="method5"
									placeholder="Step4 세안법">${methodDetailVO.method}</textarea>
							</div>							
							</c:if>
							
							
							<c:if test="${empty methodDetailVO}">
							 <!-- 빈통을 만들어라 -->
							 <div class="form-group mb-3" id="method5">
								<textarea class="form-control" name="method" rows="5" id="method5"
									placeholder="Step5 세안법"></textarea>
							</div>
							</c:if>
							</c:if>
							
							</c:forEach>
							
							</c:otherwise>
							</c:choose>
							
								
						</div>
						
							<div class="form-group" id="prodNo5">
							<label for="example-select">사용제품명</label>
							<select class="form-control" name="prodNo" id="prodNo">
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:forEach items="${prodList}" var="productVO">
							<c:if test="${status.count eq '5'}">
							<option value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							<c:if test="${status.count eq '1'}">
							<option value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							</c:forEach>
							</c:forEach>
							</select>
							</div>
							
						<div id="add1" class="form-group mb-3"></div>
						<div class="form-group" id=select2></div>
						
						<div id="add2" class="form-group mb-3"></div>
						<div class="form-group" id=select3></div>
						
						<div id="add3" class="form-group mb-3"></div>
						<div class="form-group" id=select4></div>
						
						<div id="add4" class="form-group mb-3"></div>
						<div class="form-group" id=select5></div> 
						
						<div class="form-group" align="right">							
						<button type="button" id="plus" class="btn btn-icon btn-success"><i class="mdi mdi-plus"></i></button>
						<button type="button" id="minus" class="btn btn-icon btn-danger"><i class="mdi mdi-minus"></i></button>
						</div>
							
						
						<div class="form-group">
							<label for="exampleInputEmail1">계절</label>
							&nbsp;
							<input type="radio" name="season" value="S1" <c:out value="${methodVO.season eq 'S1'?'checked':''}"/>>&nbsp;봄
							<input type="radio" name="season" value="S2" <c:out value="${methodVO.season eq 'S2'?'checked':''}"/>>&nbsp;여름
							<input type="radio" name="season" value="S3" <c:out value="${methodVO.season eq 'S3'?'checked':''}"/>>&nbsp;가을
							<input type="radio" name="season" value="S4" <c:out value="${methodVO.season eq 'S4'?'checked':''}"/>>&nbsp;겨울
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">날씨</label>
							&nbsp;
							<input type="radio" name="weather" value="W1" <c:out value="${methodVO.weather eq 'W1'?'checked':''}"/>>&nbsp;맑음
							<input type="radio" name="weather" value="W2" <c:out value="${methodVO.weather eq 'W2'?'checked':''}"/>>&nbsp;흐림
							<input type="radio" name="weather" value="W3" <c:out value="${methodVO.weather eq 'W3'?'checked':''}"/>>&nbsp;눈/비
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">미세먼지</label>
							&nbsp; 
							<input type="radio" name="dust" value="D1" <c:out value="${methodVO.dust eq 'D1'?'checked':''}"/>>&nbsp;좋음
							<input type="radio" name="dust" value="D2" <c:out value="${methodVO.dust eq 'D2'?'checked':''}"/>>&nbsp;보통
							<input type="radio" name="dust" value="D3" <c:out value="${methodVO.dust eq 'D3'?'checked':''}"/>>&nbsp;나쁨
							<input type="radio" name="dust" value="D4" <c:out value="${methodVO.dust eq 'D4'?'checked':''}"/>>&nbsp;매우나쁨
						</div>
											</form>
				<div class="box-footer" align="center">
					<button type="submit" id="btn" class="btn btn-outline-success btn-rounded">수정</button>
					<button type="submit" class="btn btn-outline-danger btn-rounded">취소</button>
				</div>
                                            </div> <!-- end col -->

                                          
                                               
                                            </div> <!-- end col -->
                                        </div>
                                        <!-- end row-->

                                    </div> <!-- end card-body -->
                                </div> <!-- end card -->
                            </div><!-- end col -->
                        </div>
                        <!-- end row -->

                    </div> <!-- container -->

                </div> <!-- content -->

                <!-- Footer Start -->
                 <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                2018 - 2019 © Hyper - Coderthemes.com
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-right footer-links d-none d-md-block">
                                    <a href="javascript: void(0);">About</a>
                                    <a href="javascript: void(0);">Support</a>
                                    <a href="javascript: void(0);">Contact Us</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- end Footer -->

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->


        <!-- App js -->
        <script src="/resources/dist/assets/js/app_admin.js"></script>

        <!-- third party js -->
        <script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
        <script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
        <!-- third party js ends -->

        <!-- demo app -->
        <script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
        <!-- end demo js-->
    </body>
<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-outline-danger")
				.on("click",function() {
					self.location = "/method/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});
		
		$(".btn-outline-success").on("click",
				function() {
					formObj.submit();
				});


	});
</script>

<script>
$(document).ready(function(){
	
	var methodStep = $('#methodStep').val();
	// selectbox value값에 따른 click,change 이벤트 강제 실행
	   if($(value == '1').trigger('click')){
			$('#methodStep').change();
	   }else if($(value == '2').trigger('click')){
		   $('#methodStep').change();
	   }else if($(value == '3').trigger('click')){
		   $('#methodStep').change();
	   }else if($(value == '4').trigger('click')){
		   $('#methodStep').change();
	   }else if($(value == '5').trigger('click')){
		   $('#methodStep').change();
	   }
	});
</script>
	
<script>
$(document).ready(function(){
	
	var methodStep = $('#methodStep').val();
	
	if(methodStep == '1'){
		$('#method').show();
		$('#prodNo').show();
		$('#method2').remove();
		$('#prodNo2').remove();
		$('#method3').remove();
		$('#prodNo3').remove();
		$('#method4').remove();
		$('#prodNo4').remove();
		$('#method5').remove();
		$('#prodNo5').remove();
		
	}else if(methodStep == '2'){
		$('#method').show();
		$('#prodNo').show();
		$('#method2').show();
		$('#prodNo2').show();
		$('#method3').remove();
		$('#prodNo3').remove();
		$('#method4').remove();
		$('#prodNo4').remove();
		$('#method5').remove();
		$('#prodNo5').remove();
		
	}else if(methodStep == '3'){
		$('#method').show();
		$('#prodNo').show();
		$('#method2').show();
		$('#prodNo2').show();
		$('#method3').show();
		$('#prodNo3').show();
		$('#method4').remove();
		$('#prodNo4').remove();
		$('#method5').remove();
		$('#prodNo5').remove();
		
	}else if(methodStep == '4'){
		$('#method').show();
		$('#prodNo').show();
		$('#method2').show();
		$('#prodNo2').show();
		$('#method3').show();
		$('#prodNo3').show();
		$('#method4').show();
		$('#prodNo4').show();
		$('#method5').remove();
		$('#prodNo5').remove();
		
	}else if(methodStep == '5'){
		$('#method').show();
		$('#prodNo').show();
		$('#method2').show();
		$('#prodNo2').show();
		$('#method3').show();
		$('#prodNo3').show();
		$('#method4').show();
		$('#prodNo4').show();
		$('#method5').show();
		$('#prodNo5').show();
		}
	
	
});

</script>
 
<script>

		
$(document).ready(function(){
	
	var count = $('#methodStep').val();
	var methodStep = $('#methodStep').val();	
	
	
	$('#plus').click(function(){
		      if (count == '1') {
		    	  
		    	var add = document.getElementById('add' + count++);
		    	var select = document.getElementById('select' + count);
		    	
		    	//label 태그 생성
		    	var metLabel = document.createElement('label');
		    	metLabel.htmlFor = 'method'+count;
		    	metLabel.textContent = '세안법'
		    	//textArea 생성
		        var method = document.createElement('textArea');
		    	method.name = 'method';
		    	method.id = 'method'+count;
		    	method.classList.add('form-control');
		    	method.rows = 5;
		    	method.cols = 50;
		    	method.placeholder='Step'+count+' 세안법';
		    	//div(id값 매핑)의 자식으로 추가
		        add.appendChild(metLabel);
		        add.appendChild(method);
				//label 생성	        
		        var label = document.createElement('label');
		        label.htmlFor = 'prodNo'+count;
		        label.textContent = '사용제품명'
		        //selectBox 생성
		        var product = document.createElement('select');
		        product.classList.add('form-control');
		        product.name = 'prodNo';
		        product.id = 'prodNo'+count;
		        //selectBox option 설정
		        select.appendChild(label);
		        select.appendChild(product);
		        //여러개 
		        <c:forEach items="${prodList}" var="productVO">
		        var option= document.createElement('option');
		        option.text = '${productVO.name}';
		        option.value = '${productVO.prodNo}';
		        product.append(option);
		        </c:forEach>
		        
		      }else if(count == '2'){
		    	  var add = document.getElementById('add' + count++);
			    	var select = document.getElementById('select' + count);
			    	
			    	//label 태그 생성
			    	var metLabel = document.createElement('label');
			    	metLabel.htmlFor = 'method'+count;
			    	metLabel.textContent = '세안법'
			    	//textArea 생성
			        var method = document.createElement('textArea');
			    	method.name = 'method';
			    	method.id = 'method'+count;
			    	method.classList.add('form-control');
			    	method.rows = 5;
			    	method.cols = 50;
			    	method.placeholder='Step'+count+' 세안법';
			    	//div(id값 매핑)의 자식으로 추가
			        add.appendChild(metLabel);
			        add.appendChild(method);
					//label 생성	        
			        var label = document.createElement('label');
			        label.htmlFor = 'prodNo'+count;
			        label.textContent = '사용제품명'
			        //selectBox 생성
			        var product = document.createElement('select');
			        product.classList.add('form-control');
			        product.name = 'prodNo';
			        product.id = 'prodNo'+count;
			        //selectBox option 설정
			        select.appendChild(label);
			        select.appendChild(product);
			        //여러개 
			        <c:forEach items="${prodList}" var="productVO">
			        var option= document.createElement('option');
			        option.text = '${productVO.name}';
			        option.value = '${productVO.prodNo}';
			        product.append(option);
			        </c:forEach> 
		      }else if(count == '3'){
		    	  var add = document.getElementById('add' + count++);
			    	var select = document.getElementById('select' + count);
			    	
			    	//label 태그 생성
			    	var metLabel = document.createElement('label');
			    	metLabel.htmlFor = 'method'+count;
			    	metLabel.textContent = '세안법'
			    	//textArea 생성
			        var method = document.createElement('textArea');
			    	method.name = 'method';
			    	method.id = 'method'+count;
			    	method.classList.add('form-control');
			    	method.rows = 5;
			    	method.cols = 50;
			    	method.placeholder='Step'+count+' 세안법';
			    	//div(id값 매핑)의 자식으로 추가
			        add.appendChild(metLabel);
			        add.appendChild(method);
					//label 생성	        
			        var label = document.createElement('label');
			        label.htmlFor = 'prodNo'+count;
			        label.textContent = '사용제품명'
			        //selectBox 생성
			        var product = document.createElement('select');
			        product.classList.add('form-control');
			        product.name = 'prodNo';
			        product.id = 'prodNo'+count;
			        //selectBox option 설정
			        select.appendChild(label);
			        select.appendChild(product);
			        //여러개 
			        <c:forEach items="${prodList}" var="productVO">
			        var option= document.createElement('option');
			        option.text = '${productVO.name}';
			        option.value = '${productVO.prodNo}';
			        product.append(option);
			        </c:forEach>
			        
		      }else if(count == '4'){
		    	  var add = document.getElementById('add' + count++);
			    	var select = document.getElementById('select' + count);
			    	
			    	//label 태그 생성
			    	var metLabel = document.createElement('label');
			    	metLabel.htmlFor = 'method'+count;
			    	metLabel.textContent = '세안법'
			    	//textArea 생성
			        var method = document.createElement('textArea');
			    	method.name = 'method';
			    	method.id = 'method'+count;
			    	method.classList.add('form-control');
			    	method.rows = 5;
			    	method.cols = 50;
			    	method.placeholder='Step'+count+' 세안법';
			    	//div(id값 매핑)의 자식으로 추가
			        add.appendChild(metLabel);
			        add.appendChild(method);
					//label 생성	        
			        var label = document.createElement('label');
			        label.htmlFor = 'prodNo'+count;
			        label.textContent = '사용제품명'
			        //selectBox 생성
			        var product = document.createElement('select');
			        product.classList.add('form-control');
			        product.name = 'prodNo';
			        product.id = 'prodNo'+count;
			        //selectBox option 설정
			        select.appendChild(label);
			        select.appendChild(product);
			        //여러개 
			        <c:forEach items="${prodList}" var="productVO">
			        var option= document.createElement('option');
			        option.text = '${productVO.name}';
			        option.value = '${productVO.prodNo}';
			        product.append(option);
			        </c:forEach>
		      
				 }else if(count == '5'){
				    alert("세안법은 5개까지 등록가능합니다.");
				    	count = 5;
				    }
				      
				});
	
    $(document).ready(function(){
    	$('#minus').click(function(){
    	if(count > 1){
    		//id 값 mapping,
    		var div = document.getElementById('add'+ count);
    		var selectDiv =  document.getElementById('prodNo' + count);
    		var method= document.getElementById('method'+ count);
    		
    		//label for 값 mapping
    		$("label[for = 'method"+count+"']").remove();
    		//textArea 제거 (부모 키를 찾을 필요 없음) or ex) parent.removeChild(child) < 부모키를 알 때 사용하는 방법
    		method.parentNode.removeChild(method);
    		
    		$("label[for = 'prodNo"+count+"']").remove();
    		//selectBox 제거
    		selectDiv.parentNode.removeChild(selectDiv);
    		
    	    count --;
    		
    	}else{
    		
    		alert('최소 1개의 세안법을 등록해야합니다.');
    		count = 1;
    	}
    	
		});
    });
});
</script>
 
</html>
