<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
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
        <div id="detached-topbar-placeholder"></div>
        <!-- Begin page -->
        <div class="wrapper">

            <div id="vertical-sidebar-placeholder"></div>
            <div id="detached-sidebar-placeholder"></div>

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">

                    <div id="vertical-topbar-placeholder"></div>
                    <div id="horizontal-topbar-placeholder"></div>
					<div><h3></h3></div>
                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                       

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">세안법 상세보기</h4>
                                       

                                        <div class="row">
                                            <div class="col-lg-6">
                                            
                      <form role="form" method="post">

						<input type='hidden' name='methodNo' value="${methodSuggestVO.methodNo}">
						<input type='hidden' name='page' value="${cri.page}"> 
	 					<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
						
						<div class="form-group">
							<label for="example-select">세안법 Step</label>
							<select class="form-control" name="methodStep" id="methodStep">
							<option value="1" id="step1"<c:out value="${methodSuggestVO.methodStep eq '1'?'selected':''}"/>>Step1</option>
							<option value="2" id="step2"<c:out value="${methodSuggestVO.methodStep eq '2'?'selected':''}"/>>Step2</option>
							<option value="3" id="step3"<c:out value="${methodSuggestVO.methodStep eq '3'?'selected':''}"/>>Step3</option>
							</select>
						</div>
                                                	
						
						<div class="form-group mb-3" id="method">
							<label for="simpleinput">세안법</label>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:if test="${status.count eq '1'}">
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step1 세안법" readonly="readonly">${methodDetailVO.method}</textarea>
								</c:if>
								</c:forEach>
						</div>
						
						<div class="form-group mb-3" id="prodNo">
							<label for="simpleinput">사용제품</label>
							<c:forEach items="${prodList}" var="productVO" varStatus="status">
							<c:if test="${status.count eq '1'}">
							<input type="text" name="prodNo" value="${productVO.name}" readonly="readonly">
								</c:if>
								</c:forEach>
						</div>
						
						<div class="form-group mb-3" id="method2">
							<label for="simpleinput">세안법2</label>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:if test="${status.count eq '2'}">
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step2 세안법" readonly="readonly">${methodDetailVO.method}</textarea>
							</c:if>
								</c:forEach>
						</div>
						
						<div class="form-group mb-3" id="prodNo2">
							<label for="simpleinput">사용제품</label>
							<c:forEach items="${prodList}" var="productVO" varStatus="status">
							<c:if test="${status.count eq '2'}">
							<input type="text" name="prodNo" value="${productVO.name}" readonly="readonly">
								</c:if>
								</c:forEach>
						</div>
						
						
						<div class="form-group mb-3" id="method3">
							<label for="simpleinput">세안법3</label>
							<c:forEach items="${detailList}" var="methodDetailVO" varStatus="status">
							<c:if test="${status.count eq '3'}">
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step3 세안법" readonly="readonly">${methodDetailVO.method}</textarea>
							</c:if>
								</c:forEach>
						</div>
						
						<div class="form-group mb-3" id="prodNo3">
							<label for="simpleinput">사용제품</label>
							<c:forEach items="${prodList}" var="productVO" varStatus="status">
							<c:if test="${status.count eq '3'}">
							<input type="text" name="prodNo" value="${productVO.name}" readonly="readonly">
								</c:if>
								</c:forEach>
						</div>
						
					</form>
						<div class="box-footer" align="center">
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

		$(".btn-outline-info").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/methodSuggest/list");
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
