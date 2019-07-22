<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <title>제품 추천 받기</title>
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
		                                <h1>세안 제품 추천</h1>
		                                <p> 
		                                	<hr>
		                                	피부 타입과 피부 고민에 따른
		                                	<br/>나만의 맞춤형 세안 제품을 추천 받으세요
		                                	<hr>
		                                </p>

		                                        <form role="form" method="post">
		                                        <h3> 피부 정보 입력 </h3>
		                                        <br/><br/>
		                                        
		                                            <div class="form-group mb-3">
		                                                <label for="gender">제품 이름</label>
		                                                <fieldset>
												            
														                 여성 <input type="radio" name="gender" value="U1" checked />
														        &nbsp;
														        &nbsp;
														        &nbsp;         
														                 남성 <input type="radio" name="gender" value="U2" />
												        </fieldset>
		                                            </div>
													<hr>
		                                            <div class="form-group mb-3">
		                                                <label for="example-select">성별</label>
		                                                <select class="form-control" id="age" name="age" style="width:100px">
		                                                    <option value = "10"> 10대        </option>
		                                                    <option value = "20"> 20대        </option>
		                                                    <option value = "30"> 30대        </option>
		                                                    <option value = "40"> 40대        </option>
		                                                    <option value = "50"> 50대        </option>
		                                                </select>
		                                            </div>
													<hr>
		                                            <div class="form-group mb-3">
		                                                <label for="skinType">피부타입</label>     
		                                                <fieldset>
														                 건성 <input type="radio" name="skinType" value="DR" checked />
														        &nbsp;&nbsp;
														                 중성 <input type="radio" name="skinType" value="NE" />
														        &nbsp;&nbsp;
														                 지성 <input type="radio" name="skinType" value="OI" />
														        &nbsp;&nbsp;       
														                 복합성 <input type="radio" name="skinType" value="CO" />
														        &nbsp;&nbsp;         
														                 민감성 <input type="radio" name="skinType" value="SE" />
												        </fieldset>
		                                            </div>
		
		                                            <div class="box-footer" align="center">
		                                                <button type="submit" class="btn btn-outline-success btn-rounded">제품 추천 받기</button>
		                                            </div>
		                                            
		                                        </form>
		                                    
		                               
		                            </div> <!-- end card-body -->
		                        </div><!-- end card -->
		                    </div> <!-- end col -->
		                </div>
		                <!-- end row-->
		
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
	
	
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	
	
</html>