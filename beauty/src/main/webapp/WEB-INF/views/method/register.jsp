<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                        <h4 class="header-title">세안법 등록	</h4>
                                       

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <form role="form" method="post">
                                                	

                         <div class="form-group mb-3">
                            <label for="exampleInputEmail1">피부타입</label>
							<select name="skinType">
							<option value="DR">건성</option>
							<option value="NE">중성</option>
							<option value="OI">지성</option>
							<option value="CO">복합성</option>
							<option value="SE">민감성</option>
							</select>
						</div>
						
						<div class="form-group mb-3">
							<label for="exampleInputEmail1">화장정도</label>
							<select name="makeUpDegree">
							<option value="NM">노 메이크업</option>
							<option value="YM">메이크업</option>
							<option value="SM">색조 메이크업</option>
							</select>
						</div>
						
						<div class="form-group mb-3">
							<label for="exampleInputPassword1">세안법 Step</label>
							<select name="methodStep" id="methodStep">
							<option value="1" id="step1">step1</option>
							<option value="2" id="step2">step2</option>
							<option value="3" id="step3">step3</option>
							</select>
						</div>
						
						<div class="form-group mb-3">
							<label for="exampleInputEmail1">step</label> <input type="text"
								name="step" class="form-control" id="step">
						</div>
						
						<div class="form-group mb-3" id="method">
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
						
						<div class="form-group mb-3" id="method2">
							<label for="exampleInputPassword1">세안법2</label>
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step2 세안법"></textarea>
						</div>
						
						<div class="form-group mb-3" id="prodNo2">
							<label for="exampleInputEmail1">사용제품명2</label>
							<select name="prodNo" id="prodNo">
							<c:forEach items="${prodList}" var="productVO">
							<option value="${productVO.prodNo}">${productVO.name}</option>
							</c:forEach>
							</select>
						</div> 
						
						<div class="form-group mb-3" id="method3">
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
						
												<div class="box-footer" align="center">
													<button type="submit" class="btn btn-outline-success btn-rounded">Submit</button>
												</div>
											</form>
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
</html>
