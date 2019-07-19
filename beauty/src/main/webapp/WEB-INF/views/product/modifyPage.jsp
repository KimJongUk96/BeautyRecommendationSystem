<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
					<h3 class="box-title">MODIFY PRODUCT</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">

				    <input type='hidden' name='prodNo' value="${productVO.prodNo}"> 
					<input type='hidden' name='page' value="${cri.page}">
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">


					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">제품 사진</label> 
						    <input type="text" name='img' class="form-control" id="imgName" value="${productVO.img}" readonly="readonly">
						    <hr>
						    <div class="fileDrop">
						    	<span>현재 사진을 먼저 삭제 후 사진을 드래그 하거나 </br></span>
						 	    <span> <label for="fileUpload">"여기"</label>를 클릭해주세요 </span>
						 	    <p hidden><input type="file" id="fileUpload"></p>
						    </div>
						    <hr>
						    <div>
						    <ul class="mailbox-attachments clearfix uploadedList">
						    			<div id="imgNow">
								  			 <img src='displayFile?fileName=${productVO.img}'/>
								             <small data-src="${productVO.img}">X</small>
								        </div>
						    	</ul>
						    </div>
						</div>
						
					    <div class="form-group">
							<label for="exampleInputEmail1">제품명</label> 
							<textarea class="form-control" name="name" rows="3">${productVO.name}</textarea>
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">사용자 성별</label> 
							<select name = "cusGender">
								<option value = "U1" <c:out value="${productVO.cusGender eq 'U1'?'selected':'U1'}"/>>여성용</option>
								<option value = "U2" <c:out value="${productVO.cusGender eq 'U2'?'selected':'U2'}"/>>남성용</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">제품 회사</label>
							<textarea class="form-control" name="compName" rows="3">${productVO.compName}</textarea>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">제품 가격</label>
							<textarea class="form-control" name="price" rows="3">${productVO.price}</textarea>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">구매 링크</label>
							<textarea class="form-control" name="link" rows="3">${productVO.link}</textarea>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">제품 종류</label>
							<textarea class="form-control" name="prodtypeNo" rows="3">${productVO.prodtypeNo}</textarea>
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">글쓴이</label> 
							<input type="text" name="adminNo" class="form-control" value="${productVO.adminNo}" readonly>
						</div>

					<!-- /.box-body -->
				</form>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">SAVE</button>
					<button type="submit" class="btn btn-warning">CANCEL</button>
				</div>

<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning")
				.on("click",function() {
					self.location = "/product/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});

		$(".btn-primary").on("click",
				function() {
					formObj.submit();
				});
	});
</script>




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
								  +"<small data-src="+data+">X</small></div></div>";
					  }
					  
					  $(".uploadedList").append(str);
					  
					  document.getElementById("imgName").value = data;
					 
				  }
				});	
		});
		
		$(".uploadedList").on("click", "small", function(event){
			
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



