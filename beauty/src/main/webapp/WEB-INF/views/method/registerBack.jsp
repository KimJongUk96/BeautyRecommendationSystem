 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                        <h4 class="header-title">세안법 등록</h4>
                                       

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <form role='form' name="frm" id="frm" method="post">
                                                	

                         <div class="form-group mb-3">
                            <label for="example-select">피부타입</label>
							<select class="form-control" name="skinType">
							<option value="DR">건성</option>
							<option value="NE">중성</option>
							<option value="OI">지성</option>
							<option value="CO">복합성</option>
							<option value="SE">민감성</option>
							</select>
						</div>
						
						<div class="form-group mb-3">
							<label for="example-select">화장정도</label>
							<select class="form-control" name="makeUpDegree">
							<option value="NM">노 메이크업</option>
							<option value="YM">메이크업</option>
							<option value="SM">색조 메이크업</option>
							</select> 
						</div>
						
						<div class="form-group mb-3">
							<label for="example-select">세안법 Step</label>
							<select class="form-control" name="methodStep" id="methodStep">
							<option value="1" id="step1">step1</option>
							<option value="2" id="step2">step2</option>
							<option value="3" id="step3">step3</option>
							</select>
						</div>
						
							 <input type="hidden" name="step" class="form-control" value="0" id="step">
						
						<div class="form-group mb-3" id="method01">
							<label for="simpleinput">세안법</label>
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step1 세안법" id="method"></textarea>
						</div>
						
						<div class="form-group" id="prodNo">
							<label for="example-select">사용제품명</label>
							<select class="form-control" name="prodNo" id="prodNo">
							<c:forEach items="${prodList}" var="productVO">
							<option value="${productVO.prodNo}">${productVO.name}</option>
							</c:forEach>
							</select>
						</div> 
						
						<div class="form-group mb-3" id="method02">
							<label for="simpleinput">세안법2</label>
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step2 세안법" id="method2"></textarea>
						</div>
						
						<div class="form-group mb-3" id="prodNo2">
							<label for="example-select">사용제품명2</label>
							<select class="form-control" name="prodNo" id="prodNo">
							<c:forEach items="${prodList}" var="productVO">
							<option value="${productVO.prodNo}">${productVO.name}</option>
							</c:forEach>
							</select>
						</div> 
						
						<div class="form-group mb-3" id="method03">
							<label for="simpleinput">세안법3</label>
							<textarea class="form-control" name="method" rows="5"
								placeholder="Step3 세안법" id="method3"></textarea>
						</div>
						
						<div class="form-group" id="prodNo3">
							<label for="example-select">사용제품명3</label>
							<select class="form-control" name="prodNo" id="prodNo">
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
							<label for="example-select">계절</label>
							&nbsp;
							<input type="radio" name="season" id="season" value="S1" checked="checked">&nbsp;봄
							<input type="radio" name="season" id="season" value="S2">&nbsp;여름
							<input type="radio" name="season" id="season" value="S3">&nbsp;가을
							<input type="radio" name="season" id="season" value="S4">&nbsp;겨울
						</div>  
						
						
						<div class="form-group">
							<label for="example-select">날씨</label>
							&nbsp;
							<input type="radio" name="weather" id="weather" value="W1" checked="checked">&nbsp;맑음
							<input type="radio" name="weather" id="weather" value="W2">&nbsp;흐림
							<input type="radio" name="weather" id="weather" value="W3">&nbsp;눈/비
						</div>
						
						<div class="form-group">
							<label for="example-select">미세먼지</label>
							&nbsp;
							<input type="radio" name="dust" id="dust" value="D1" checked="checked">&nbsp;좋음
							<input type="radio" name="dust" id="dust" value="D2">&nbsp;보통
							<input type="radio" name="dust" id="dust" value="D3">&nbsp;나쁨
							<input type="radio" name="dust" id="dust" value="D4">&nbsp;매우나쁨
						</div>
						
							<input type="hidden" name="adminNo" value="${login.adminNo}" class="form-control">
						
												<div class="box-footer" align="center">
													<button type="submit" id="btn" class="btn btn-outline-success btn-rounded">등록</button>
													<button type="button" class="btn btn-outline-danger btn-rounded">취소</button>
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
	$('#method01').show();
	$('#prodNo').show();
	$('#method02').hide();
	$('#prodNo2').hide();
	$('#method03').hide();
	$('#prodNo3').hide();

jQuery('#methodStep').change(function(){
	
	var value = jQuery('#methodStep option:selected').val();	
	
	if(value == '1'){
		$('#method01').show();
		$('#prodNo').show();
		$('#method02').hide();
		$('#prodNo2').hide();
		$('#method03').hide();
		$('#prodNo3').hide();
		
	}else if(value == '2'){
		$('#method01').show();
		$('#prodNo').show();
		$('#method02').show();
		$('#prodNo2').show();
		$('#method03').hide();
		$('#prodNo3').hide();
		
	}else if(value == '3'){
		$('#method01').show();
		$('#prodNo').show();
		$('#method02').show();
		$('#prodNo2').show();
		$('#method03').show();
		$('#prodNo3').show();
		}
	});
});
</script>

<script type="text/javascript">
$(document).ready(function(){
	   $('#btn').click(function(){
		   return check();        
	    });
	   
});

	check = function(){
		var method = $("#method").val();
	
		if(method == "" || method == null){
			alert("세안법을 작성해주세요.");
			return false;
		}
		if($(':radio[name="season"]:checked').length < 1){
				alert("계절을 선택해주세요.");
				return false;
		}
		if($(':radio[name="weather"]:checked').length < 1){
			alert("날씨를 선택해주세요.");
			return false;
	  	}
		if($(':radio[name="dust"]:checked').length < 1){
			alert("미세먼지정도를 선택해주세요.");
			return false;
		}

		else{
			return true;
		}
	}

</script>

<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);
		$(".btn-outline-danger")
				.on("click",function() {
					self.location = "/method/list";
				});
	});
</script>
</html>
