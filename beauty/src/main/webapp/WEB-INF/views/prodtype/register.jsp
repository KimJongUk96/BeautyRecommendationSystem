<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                                        <h4 class="header-title">Product Type Register</h4>
                                       

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <form method="post" name="frm">
                                                	

                                                    <div class="form-group mb-3">
                                                        <label for="simpleinput">제품 타입 명</label>
                                                        <input type="text" id="name" name='name' class="form-control">
                                                    </div>

                                                    <div class="form-group mb-3">
                                                        <label for="example-select">카테고리</label>
                                                        <select class="form-control" id="categoryNo" name='categoryNo'>
                                                            <option value = "1000"> 클렌징 </option>
															<option value = "1001"> 모이스춰라이저 </option>
															<option value = "1002"> 토너 </option>
															<option value = "1003"> 썬스크린 </option>
                                                        </select>
                                                    </div>
												<div class="box-footer" align="center">
													<button class="btn btn-outline-success btn-rounded" id="btn">등록</button>
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

    
    <script type="text/javascript">
$(document).ready(function(){
	   $('#btn').click(function(){
		   return check();        
	    });
	   
});

	check = function(){
		var name = $("#name").val();
	
		if(name == "" || name == null){
			alert("제품타입명을 작성해주세요.");
			return false;
		}

		else{
			return true;
		}
	}

</script>
</html>
