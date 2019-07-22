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
        
        	<style>
				.fileDrop {
				  width: 80%;
				  height: 100px;
				  border: 1px dotted gray;
				  margin: auto;
				  
				}
			</style>
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
		                                <h4 class="header-title">제품 등록</h4>
		                                
		
		                                <div class="row">
		                                    <div class="col-lg-6">
		                                        <form role="form" method="post">
		                                        <input type="hidden" name="userEmail" value="${login.email}">
		                                        <input type='hidden' name='prodNo' value="${productVO.prodNo}"> 
												<input type='hidden' name='page' value="${cri.page}"> 
												<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
												<input type='hidden' name='searchType' value="${cri.searchType}">
												<input type='hidden' name='keyword' value="${cri.keyword}">
		                                        	<div class="form-group mb-3">
		                                                <label for="simpleinput"><br/>제품 명</label>
		                                                <input type="text" id="name" name='name' class="form-control" readonly 
		                                                value = '${productVO.name }'>
		                                            </div>
		                                            <div class="form-group mb-3">
		                                                <label for="simpleinput"><br/>카테고리</label>
		                                                <input type="text" id="categoryName" name='categoryName' class="form-control" readonly 
		                                                value = '${productVO.categoryName }'>
		                                            </div>
		                                            <div class="form-group mb-3">
		                                                <label for="simpleinput"><br/>제품타입</label>
		                                                <input type="text" id="prodtypeName" name='prodtypeName' class="form-control" readonly 
		                                                value = '${productVO.prodtypeName }'>
		                                            </div>
		                                             <div class="form-group mb-3">
		                                                <label for="simpleinput"><br/>이미지</label>
		                                                <input type="text" id="img" name='img' class="form-control" readonly 
		                                                value = '${productVO.img }'>
		                                            </div>
		                                        
		                                        
		                                            <div class="form-group mb-3">
		                                                <label for="simpleinput"><br/>별점</label>
		                                                <input type="text" id="rating" name='rating' class="form-control" placeholder="제품명 입력">
		                                            </div>
		
		
		                                            <div class="form-group mb-3">
		                                                <label for="simpleinput">리뷰</label>
		                                                <input type="text" id="reviewText" name='reviewText' class="form-control" placeholder="회사명 입력">
		                                            </div>
		
		                                            <div class="form-group mb-3">
		                                                <label for="simpleinput">추천여부</label>
		                                                <select name="command">
		                                                <option value ="0" selected>추천</option>
		                                                <option value ="1">비추천</option>
		                                                </select>
		                                            </div>
		
		
		                                            <div class="box-footer" align="center">
		                                                <button type="submit" class="btn btn-outline-success btn-rounded">등록하기</button>
		                                            </div>
		                                        </form>
		                                    </div> <!-- end col -->
		                                </div> <!-- end row-->
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

	    <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	
		<script>
			function checkImageType(fileName){
				
				var pattern = /jpg|gif|png|jpeg/i;
				return fileName.match(pattern);
				
			}
			
			function getImageLink(fileName){
				
				if(!checkImageType(fileName)){
					return;
				}
				var front = fileName.substr(0,12);
				var end = fileName.substr(14);
				
				return front + end;
				
			}
			
	
		
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
			});
			
			
		    //클릭으로 파일 업로드할 때 호출되는 함수
		    $("#fileUpload").on("change", function(event) {
		        event.preventDefault();
	
		        var uploaded = $("#uploadCount").val();
		        
		        
	
		        if (uploaded >= 10) {
		            alert('이미지는 10개 까지 업로드할 수 있습니다.');
		            return;
		        }
	
		        // 파일업로드 인풋에서 파일을 받음
		        var file = document.getElementById("fileUpload").files[0];
	
		        // 새로운 폼데이터를 생성
		        var formData = new FormData();
	
		        // 폼데이터에 파일을 붙임
		        formData.append("file", file);
	
		        // AJAX로 uploadAjax 메소드를 호출해서 파일을 업로드함
		        $.ajax({
		            url : '/uploadAjax',
		            data : formData,
		            dataType : 'text',
		            processData : false,
		            contentType : false,
		            type : 'POST',
		            success : function(data) {
		            	
	
		                var str = "";
	
		                if (checkImageType(data)) {
				                	str ="<div>"
									  +"<img src='displayFile?fileName="+data+"'/>"
									  +"<big data-src="+data+">X</big></div>";
						  }else{
							         str = "<div><a href='displayFile?fileName="+data+"'>" 
									  + getOriginalName(data)+"</a>"
									  +"<big data-src="+data+"> X </big></div></div>";
						  }
	
		                $(".uploadedList").append(str);
		                document.getElementById("imgName").value = data;
		            }
		        });
		    });
	
				
	
			$(".fileDrop").on("drop", function(event){
				event.preventDefault();
				
				var files = event.originalEvent.dataTransfer.files;
				
				var file = files[0];
	
				//console.log(file);
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					  url: '/uploadAjax',
					  data: formData,
					  dataType:'text',
					  processData: false,
					  contentType: false,
					  type: 'POST',
					  success: function(data){
						  
						  var str ="";
						  
						  
						  if(checkImageType(data)){
							  str ="<div>"
								  +"<img src='displayFile?fileName="+data+"'/>"
								  +"<big data-src="+data+">X</big></div>";
						  }else{
							  str = "<div><a href='displayFile?fileName="+data+"'>" 
									  + getOriginalName(data)+"</a>"
									  +"<big data-src="+data+"> X </big></div></div>";
						  }
						  
						  $(".uploadedList").append(str);
						  
						  document.getElementById("imgName").value = data;
						  //document.getElementById("info").hidden;
						 
					  }
					});	
			});
			
	
			
			
			
			$(".uploadedList").on("click", "big", function(event){
				
				 var that = $(this);
			
			   $.ajax({
				   url:"deleteFile",
				   type:"post",
				   data: {fileName:$(this).attr("data-src")},
				   dataType:"text",
				   success:function(result){
					   if(result == 'deleted'){
						   that.parent("div").remove();
					   }
					   
					   document.getElementById("imgName").value = "null";
				   }
			   });
		});
			
	
			
	
		</script>
	
	
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
</html>