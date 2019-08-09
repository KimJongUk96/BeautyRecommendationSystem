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
                                        <h4 class="header-title">세안법 상세보기</h4>
                                       

                                        <div class="row">
                                            <div class="col-lg-12">
                                            
                      <form role="form" action="modify" method="post">

						<input type='hidden' name='methodNo' value="${methodVO.methodNo}">
						<input type='hidden' name='page' value="${cri.page}"> 
						<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
                                                	

                        <div class="form-group mb-3">
							<label for="example-select">피부타입</label>
							<select class="form-control" name="skinType">
							<option disabled="disabled" value="DR"<c:out value="${methodVO.skinType eq 'DR'?'selected':''}"/>>건성</option>
							<option disabled="disabled" value="NE"<c:out value="${methodVO.skinType eq 'NE'?'selected':''}"/>>중성</option>
							<option disabled="disabled" value="OI"<c:out value="${methodVO.skinType eq 'OI'?'selected':''}"/>>지성</option>
							<option disabled="disabled" value="CO"<c:out value="${methodVO.skinType eq 'CO'?'selected':''}"/>>복합성</option>
							<option disabled="disabled" value="SE"<c:out value="${methodVO.skinType eq 'SE'?'selected':''}"/>>민감성</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="example-select">화장정도</label>
							<select class="form-control" name="makeUpDegree">
							<option disabled="disabled" value="NM"<c:out value="${methodVO.makeUpDegree eq 'NM'?'selected':''}"/>>노 메이크업</option>
							<option disabled="disabled" value="YM"<c:out value="${methodVO.makeUpDegree eq 'YM'?'selected':''}"/>>메이크업</option>
							<option disabled="disabled" value="SM"<c:out value="${methodVO.makeUpDegree eq 'SM'?'selected':''}"/>>색조메이크업</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="example-select">세안법 Step</label>
							<select class="form-control" name="methodStep" id="methodStep">
							<option disabled="disabled" value="1" id="step1"<c:out value="${methodVO.methodStep eq '1'?'selected':''}"/>>Step1</option>
							<option disabled="disabled" value="2" id="step2"<c:out value="${methodVO.methodStep eq '2'?'selected':''}"/>>Step2</option>
							<option disabled="disabled" value="3" id="step3"<c:out value="${methodVO.methodStep eq '3'?'selected':''}"/>>Step3</option>
							</select>
						</div>
						
						<div class="form-group mb-3">
							<c:forEach items="${detailList}" var="methodDetailVO">
							<input type="hidden" name="step" id="step" value="${methodDetailVO.step}">
							</c:forEach>
						</div>
						
						<div class="form-group mb-3" id="method">
							<label for="simpleinput">세안법</label>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:if test="${status.count eq '1'}">
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step1 세안법" readonly="readonly" style="font-weight:bold;font-size:12pt;">${methodDetailVO.method}</textarea>
								</c:if>
								</c:forEach>
						</div>
						
						<div class="form-group" id="prodNo">
							<label for="example-select">사용제품명</label>
							<select class="form-control" name="prodNo" id="prodNo">
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:forEach items="${prodList}" var="productVO">
							<c:if test="${status.count eq '1'}">
							<option disabled="disabled" value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							</c:forEach>
							</c:forEach>
							</select>
						</div> 
						
						<div class="form-group mb-3" id="method2">
							<label for="simpleinput">세안법2</label>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:if test="${status.count eq '2'}">
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step2 세안법" readonly="readonly" style="font-weight:bold;font-size:12pt;">${methodDetailVO.method}</textarea>
							</c:if>
								</c:forEach>
						</div>
						
						<div class="form-group" id="prodNo2">
							<label for="example-select">사용제품명2</label>
							<select class="form-control" name="prodNo" id="prodNo">
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:forEach items="${prodList}" var="productVO">
							<c:if test="${status.count eq '2'}">
							<option disabled="disabled" value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							</c:forEach>
							</c:forEach>
							</select>
						</div> 
						
						<div class="form-group mb-3" id="method3">
							<label for="simpleinput">세안법3</label>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:if test="${status.count eq '3'}">
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step3 세안법" readonly="readonly" style="font-weight:bold;font-size:12pt;">${methodDetailVO.method}</textarea>
							</c:if>
								</c:forEach>
						</div>
						
						<div class="form-group" id="prodNo3">
							<label for="example-select">사용제품명3</label>
							<select class="form-control" name="prodNo" id="prodNo">
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:forEach items="${prodList}" var="productVO">
							<c:if test="${status.count eq '3'}">
							<option disabled="disabled" value="${productVO.prodNo}"<c:out value="${methodDetailVO.prodNo eq productVO.prodNo ?'selected':''}"/>>${productVO.name}</option>
							</c:if>
							</c:forEach>
							</c:forEach>
							</select>
						</div> 
						
						<div class="form-group">
							<label for="exampleInputEmail1">계절</label>
							&nbsp;
							<input type="radio" name="season" value="S1" disabled="disabled"<c:out value="${methodVO.season eq 'S1'?'checked':''}"/>>&nbsp;봄
							<input type="radio" name="season" value="S2" disabled="disabled"<c:out value="${methodVO.season eq 'S2'?'checked':''}"/>>&nbsp;여름
							<input type="radio" name="season" value="S3" disabled="disabled"<c:out value="${methodVO.season eq 'S3'?'checked':''}"/>>&nbsp;가을
							<input type="radio" name="season" value="S4" disabled="disabled"<c:out value="${methodVO.season eq 'S4'?'checked':''}"/>>&nbsp;겨울
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">날씨</label>
							&nbsp;
							<input type="radio" name="weather" value="W1" disabled="disabled"<c:out value="${methodVO.weather eq 'W1'?'checked':''}"/>>&nbsp;맑음
							<input type="radio" name="weather" value="W2" disabled="disabled"<c:out value="${methodVO.weather eq 'W2'?'checked':''}"/>>&nbsp;흐림
							<input type="radio" name="weather" value="W3" disabled="disabled"<c:out value="${methodVO.weather eq 'W3'?'checked':''}"/>>&nbsp;눈/비
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">미세먼지</label>
							&nbsp;
							<input type="radio" name="dust" value="D1" disabled="disabled"<c:out value="${methodVO.dust eq 'D1'?'checked':''}"/>>&nbsp;좋음
							<input type="radio" name="dust" value="D2" disabled="disabled"<c:out value="${methodVO.dust eq 'D2'?'checked':''}"/>>&nbsp;보통
							<input type="radio" name="dust" value="D3" disabled="disabled"<c:out value="${methodVO.dust eq 'D3'?'checked':''}"/>>&nbsp;나쁨
							<input type="radio" name="dust" value="D4" disabled="disabled"<c:out value="${methodVO.dust eq 'D4'?'checked':''}"/>>&nbsp;매우나쁨
						</div>
											</form>
												<div class="box-footer" align="center">
													<button type="submit" class="btn btn-outline-danger btn-rounded">삭제</button>
													<button type="submit" class="btn btn-outline-success btn-rounded">수정</button>
													<button type="submit" class="btn btn-outline-info btn-rounded">목록</button>
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
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-outline-success").on("click", function() {
			formObj.attr("action", "/method/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-outline-danger").on("click", function() {
			formObj.attr("action", "remove");
			formObj.submit();
		});

		$(".btn-outline-info").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/method/list");
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
</html>
