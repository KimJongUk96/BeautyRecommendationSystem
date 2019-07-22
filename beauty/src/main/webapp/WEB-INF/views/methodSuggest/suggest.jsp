<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post">
<h3>피부정보 입력</h3>
<div>
<label>피부 타입</label>
<select name="skinType" id="skinType">
<!-- 	<option value="DR">건성</option> -->
<option value="1">건성</option>
	<option value="NE">중성</option>
	<option value="OI">지성</option>
	<option value="CO">복합성</option>
	<option value="SE">민감성</option>
</select>
</div>
<div>
<label>화장정도</label>
<select name="makeUpDegree" id="makeUpDegree">
<%-- 	<option value="NM"<c:out value="${methodSuggestVO.makeUp eq 'NM'?'selected':''}"/>>노 메이크업</option> --%>
<option value="1">노 메이크업</option>
	<option value="YM">메이크업</option>
	<option value="SM">색조메이크업</option>
</select>
</div>
<div></div>
<h3>날씨 정보 입력</h3>
<div>
<label>날씨</label>
<%-- 	<input type="radio" name="weather" value="W1"<c:out value="${methodSuggestVO.weather eq 'W1'?'checked':''}"/>>맑음 --%>
<input type="radio" name="weather" value="1">맑음
	<input type="radio" name="weather" value="W2">흐림
	<input type="radio" name="weather" value="W3">눈/비
</div>
<div>	
<label>미세먼지</label> 
<%-- 	<input type="radio" name="dust" value="D1"<c:out value="${methodSuggestVO.dust eq 'D1'?'checked':''}"/>>좋음 --%>
<input type="radio" name="dust" value="1">좋음
	<input type="radio" name="dust" value="D2">보통
	<input type="radio" name="dust" value="D3">나쁨
	<input type="radio" name="dust" value="D4">매우나쁨
</div>	

<div class="box-footer" align="center">
	<button type="submit">Submit</button>
</div>

</form>								

</body>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){

				$('#searchBtn').on("click",function(event) {

// 							self.location = "list"
// 									+ '${pageMaker.makeQuery(1)}'
// 									+ "&skinType="
// 									+ $("select option:selected").val()
// 									+ "&makeUp="
// 									+ $("select option:selected").val()
// 									+ "&weather=" + $('#weather').val()
// 									+ "&dust=" + $('#dust').val();
							var skinType = $("#skinType").val();
							var makeUp = $("#makeUpDegree").val();
							var weather = $("input[name='weather']:checked").val();
							var dust = $("input[name='dust']:checked").val();
							
						});

			});


	
</script>
</html>