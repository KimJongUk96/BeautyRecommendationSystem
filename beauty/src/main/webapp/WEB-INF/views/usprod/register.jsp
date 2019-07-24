<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<!--
	Intensify by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->

<html>
<head>
<title>Beauty</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="/resources/templated-intensify/assets/css/main.css" />

</head>
<body class="subpage">

	<!-- Header -->
	<header id="header">
		<nav class="left">
			<a href="#menu"><span>Menu</span></a>
		</nav>
		<a href="index.html" class="logo">intensify</a>
		<nav class="right">
			<a href="#" class="button alt">Log in</a>
		</nav>
	</header>

	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><a href="index.html">Home</a></li>
			<li><a href="/usprod/list">세안 제품 목록</a></li>
			<li><a href="/productSuggest/infoInput">세안 제품 추천</a></li>
			<li><a href="/methodSuggest/suggest">세안법 추천</a></li>
		</ul>
		<ul class="actions vertical">
			<li><a href="#" class="button fit">Login</a></li>
		</ul>
	</nav>

	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">
		<div text-align="center">
			<h2>리뷰 등록</h2>
			
			</p>
			</div>
			<form method="post">
			<input type="hidden" name="userEmail" value="${login.email}">
		    <input type='hidden' name='prodNo' value="${productVO.prodNo}"> 
			<input type='hidden' name='page' value="${cri.page}"> 
			<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
			<input type='hidden' name='searchType' value="${cri.searchType}">
			<input type='hidden' name='keyword' value="${cri.keyword}">
				<h4></h4>
				<div>
					<label>제품 명</label> 
					<input type="text" id="name" name='name' class="form-control" readonly value = '${productVO.name }' style="width:300px">
					
				</div>
				<div>
					<label>카테고리</label> 
					<input type="text" id="categoryName" name='categoryName' class="form-control" readonly value = '${productVO.categoryName }' style="width:300px">
					
				</div>
				<div>
					<label>제품 타입</label> 
					<input type="text" id="prodtypeName" name='prodtypeName' class="form-control" readonly  value = '${productVO.prodtypeName }' style="width:300px">
					
				</div>
				<div>
					<label>이미지</label> 
					<input type="text" id="img" name='img' class="form-control" readonly value = '${productVO.img }'>
					
				</div>
				<div>
					<label>별점</label> 
					<input type="text" id="rating" name='rating' class="form-control" placeholder="별점 " style="width:100px">
					
				</div>
				<div>
					<label>리뷰</label> 
					<input type="text" id="reviewText" name='reviewText' class="form-control" placeholder="리뷰를 적어주세요."style="width:300px">
					
				</div>
				<div class="form-group mb-3">
		          <label>추천여부</label>
		               <select name="command" style="width:150px">
		               <option value ="0" selected>추천</option>
		               <option value ="1">비추천</option>
		           </select>
		        </div>
				<div>
					<h1></h1>
				</div>
				
		</div>

		<div class="box-footer" align="center">
			<button type="submit" class="button small">제품 리뷰 등록</button>
		</div>

		</form>
		</div>
	</section>

	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<h2>Get In Touch</h2>
			<ul class="actions">
				<li><span class="icon fa-phone"></span> <a href="#">(000)
						000-0000</a></li>
				<li><span class="icon fa-envelope"></span> <a href="#">information@untitled.tld</a></li>
				<li><span class="icon fa-map-marker"></span> 123 Somewhere
					Road, Nashville, TN 00000</li>
			</ul>
		</div>
		<div class="copyright">
			&copy; Untitled. Design <a href="https://templated.co">TEMPLATED</a>.
			Images <a href="https://unsplash.com">Unsplash</a>.
		</div>
	</footer>

	<!-- Scripts -->
	<script src="/resources/templated-intensify/assets/js/jquery.min.js"></script>
	<script
		src="/resources/templated-intensify/assets/js/jquery.scrolly.min.js"></script>
	<script src="/resources/templated-intensify/assets/js/skel.min.js"></script>
	<script src="/resources/templated-intensify/assets/js/util.js"></script>
	<script src="/resources/templated-intensify/assets/js/main.js"></script>
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

</body>
</html>