<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <title>추천 제품 목록</title>
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
								<div class="col-xl-12">
									<div class="card">
										<div class="card-body">

										<!-- general form elements -->
										
											 <h2>제품 추천 순위</h2>
											 <hr>
											 <div align="left">
											 	<h4 id='gend' style="float: left"></h4>
											 	<h4 style="float: left">&nbsp;&nbsp;&nbsp;#${prodSuggestVO.age}대&nbsp;&nbsp;&nbsp;</h4>
											 	<h4 id='skin' style="float: left"></h4>
										     </div>
							
							
						
											<div class="table-responsive-sm">
												<table class="table table-hover table-centered mb-0">
												 <thead>
														<tr>
															<th style="width: 90px">순위</th>
															<th>제품 사진</th>
															<th>제품 정보</th>
															
															
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${list}" var="productVO" varStatus="status">
								
															<tr>
																<td id='rank'>${status.count}</td>
																<td>
																   <a href='/prodSuggest/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&prodNo=${productVO.prodNo}'>
																      <img height="125px" width="200px" src="displayFile?fileName=${productVO.img}" border="0" alt="이미지 없음"/> 
																   </a>
																</td>
																<td>
																	<a href='/prodSuggest/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&prodNo=${productVO.prodNo}'> ${productVO.name} </a>
																	<br/>
																	<p>제조사 : ${productVO.compName}</p>
																	<br/>
																	<p>타입 : ${productVO.prodtypeNo}</p>
																	<br/>
																	<p>가격 : ${productVO.price}</p>
																	<br/>
																	<a href="${productVO.link}">구매 링크</a>
																</td>

															</tr>
								
														</c:forEach>
												    </tbody>
												</table>
											</div>
											<!-- /.box-body -->
											
							
									</div> <!-- end card body-->
								</div> <!-- end card -->
							</div><!-- end col-->
							
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

</body>

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
  		<!-- App js -->
        <script src="/resources/dist/assets/js/app_admin.js"></script>

        <!-- third party js -->
        <script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
        <script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
        <!-- third party js ends -->

        <!-- demo app -->
        <script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
        <!-- end demo js-->

<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});
				
				$('#logout').on("click", function(evt) {

					self.location = "/admin/logout";

				});

			});
	
	
	function changeName(dataName) {
		switch(dataName){
		  case "U1" :
			  return "#여성";
			  break;
		  case "U2" :
			  return "#남성";
			  break;
		  case "DR" :
			  return "#건성";
			  break;
		  case "NE" :
			  return "#중성";
			  break;
		  case "OI" :
			  return "#지성";
			  break;
		  case "CO" :
			  return "#복합성";
			  break;
		  case "SE" : 
			  return "#민감성";
			  break;
		}
	}
	
	var gen = "${prodSuggestVO.gender}";
	var skn = "${prodSuggestVO.skinType}";
	
	document.getElementById("gend").innerHTML = changeName(gen);
	document.getElementById("skin").innerHTML = changeName(skn);
	
</script>
</html>