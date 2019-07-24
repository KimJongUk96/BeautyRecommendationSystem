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
			<li><a href="generic.html">세안 제품 목록</a></li>
			<li><a href="elements.html">세안 제품 추천</a></li>
			<li><a href="elements.html">세안법 추천</a></li>
		</ul>
		<ul class="actions vertical">
			<li><a href="#" class="button fit">Login</a></li>
		</ul>
	</nav>

	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">
		<div text-align="center">
			<h2>세안법 추천</h2>
			<p>
			<hr>
			피부 타입과 피부 고민에 따른 <br />나만의 맞춤형 세안법을 추천 받으세요
			<hr>
			</p>
			</div>
			<form method="post">
				<h4>피부정보 입력</h4>
				<div>
					<label>피부 타입</label> <select name="skinType" id="skinType" style="width:100px">
						<!-- 	<option value="DR">건성</option> -->
						<option value="DR">건성</option>
						<option value="NE">중성</option>
						<option value="OI">지성</option>
						<option value="CO">복합성</option>
						<option value="SE">민감성</option>
					</select>
				</div>
				<div>
					<h3></h3>
				</div>
				<div>
					<label>화장정도</label> <select name="makeUpDegree" id="makeUpDegree" style="width:150px">
						<option value="NM">노 메이크업</option>
						<option value="YM">메이크업</option>
						<option value="SM">색조메이크업</option>
					</select>
				</div>
				<div>
					<h1></h1>
				</div>
				<h4>날씨 정보 입력</h4>
				<div>
					<label>날씨</label>
					<input type="radio" name="weather" value="W1" id="W1"><label for="W1">맑음</label> 
					<input type="radio" name="weather" value="W2" id="W2"><label for="W2">흐림</label> 
					<input type="radio" name="weather" value="W3" id="W3"><label for="W3">눈/비</label>
				</div>
				<div>
					<h3></h3>
				</div>
				<div>
					<label>미세먼지</label>
					<div></div>
					<input type="radio" name="dust" value="D1" id="D1"><label
						for="D1">좋음</label> <input type="radio" name="dust" value="D2"
						id="D2"><label for="D2">보통</label> <input type="radio"
						name="dust" value="D3" id="D3"><label for="D3">나쁨</label>
					<input type="radio" name="dust" value="D4" id="D4"><label
						for="D4">매우나쁨</label>
				</div>
		</div>

		<div class="box-footer" align="center">
			<button type="submit" class="button small">세안법 추천 받기</button>
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