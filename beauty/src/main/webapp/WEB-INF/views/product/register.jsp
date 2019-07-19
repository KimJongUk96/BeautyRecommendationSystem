<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  margin: auto;
  
}
</style>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER PRODUCT</h3>
				</div>
				<!-- /.box-header -->

<form id='registerForm' role="form" method="post">
					<div class="box-body">
					
<!-- 						<div class="form-group"> -->
<!-- 							<label for="exampleInputEmail1">사진</label>  -->
<!-- 							<input type="text" name='img' class="form-control" placeholder="사진 첨부"> -->
<!-- 						</div> -->
						
											
						<div class="form-group">
							<label for="exampleInputEmail1">제품 이름</label> 
							<input type="text" name='name' class="form-control" placeholder="제품명 입력">
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">사용자 성별</label>
							<select name="cusGender">
								<option value= "U1"> 여성용</option>
								<option value= "U2"> 남성용</option>
							</select> 
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1"> 제품 회사</label>
							<input type="text" name='compName' class="form-control" placeholder="회사명 입력">
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">제품 가격</label>
							<input type="text" name='price' class="form-control" placeholder="가격 입력">
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">제품 구매 링크</label> 
							<input type="text" name='link' class="form-control" placeholder="구매 링크 입력">
						</div>
						
						
						<div class="form-group">
							<label for="exampleInputEmail1">제품 종류</label> 
							<input type="text" name='prodtypeNo' class="form-control" placeholder="제품 종류">
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">관리자</label> 
<%-- 							<input type="text" name="adminNo" class="form-control" value='${AdminVO.adminNo}' readonly="readonly"> --%>
							<input type="text" name="adminNo" class="form-control" value='1000' readonly="readonly">
						</div>

						
<!-- 						 <div class="form-group"> -->
<!-- 							<label for="exampleInputEmail1">Writer</label>  -->
<!-- 							<input type="text" name="adminNo" class="form-control" placeholder="Enter Writer"> -->
<!-- 						 </div> -->

					<div class="form-group">
						 <label for="exampleInputEmail1">사진첨부</label>
						 <input type="text" name='img' class="form-control" id="imgName" readonly="readonly">
						 <hr>
						 <div class="fileDrop">
						 	    <span>사진을 드래그 하거나 </br></span>
						 	    <span> <label for="fileUpload">"여기"</label>를 클릭해주세요 </span>
						 	    <p hidden><input type="file" id="fileUpload"></p>
						 </div>
						 
					</div>
					

					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<div>
							<hr>
							<ul class="mailbox-attachments clearfix uploadedList"></ul>
						</div>
						
						
						<div>
							<hr>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form>


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

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> -->

<!-- <script type="text/javascript"> -->

// function getFileInfo(fullName){
		
// 	var fileName,imgsrc, getLink;
	
// 	var fileLink;
	
// 	if(checkImageType(fullName)){
// 		imgsrc = "/product/displayFile?fileName="+fullName;
// 		fileLink = fullName.substr(14);
		
// 		var front = fullName.substr(0,12); // /2015/07/01/ 
// 		var end = fullName.substr(14);
		
// 		getLink = "/displayFile?fileName="+front + end;
		
// 	}
	
// 	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	
// 	return  {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
	
// }
<!-- </script> -->


<!-- <script id="template" type="text/x-handlebars-template"> -->
<!-- <li> -->
<!--   <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span> -->
<!--   <div class="mailbox-attachment-info"> -->
<!-- 	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a> -->
<!-- 	<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i id='removeBtn' data-src="{{fullName}}" class="fa fa-fw fa-remove"></i></a> -->
<!-- 	</span> -->
<!--   </div> -->
<!-- </li>                 -->
<!-- </script>     -->


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
		
// 		var template = Handlebars.compile($("#template").html());
	
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
// 	            	var fileInfo = getFileInfo(data);
// 	            	var html = template(fileInfo);
// 	            	$(".uploadedList").append(html);
	            	

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
		
// 		$("#removeBtn").on("click", "i", function(event){
// 			alert("check!");
// 			var that = $(this);
			
// 			   $.ajax({
// 				   url:"deleteFile",
// 				   type:"post",
// 				   data: {fileName:$(this).attr("data-src")},
// 				   dataType:"text",
// 				   success:function(result){
// 					   if(result == 'deleted'){
// 						   that.parent("li").remove();
// 					   }
					   
// 					   document.getElementById("imgName").value = "null";
// 				   }
// 			   });
				 
// 	    });
		
		
		
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
		
// 		$("#registerForm").submit(function(event){
// 			event.preventDefault();
			
// 			var that = $(this);
			
// 			var str ="";
// 			$(".uploadedList .delbtn").each(function(index){
// 				 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
// 			});
			
// 			that.append(str);

// 			that.get(0).submit();
// 		});
		

	</script>


