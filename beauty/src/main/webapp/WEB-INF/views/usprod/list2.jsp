<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>MIS 출결 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
   content="A fully featured admin theme which can be used to build CRM, CMS, etc."
   name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
   href="../../../../resources/dist/assets/images/favicon.ico">

<!-- inline style to handle loading of various element-->
<style>
body.loading {
   visibility: hidden;
}
</style>

<!-- App css -->
<link href="../../../../resources/dist/assets/css/icons.min.css"
   rel="stylesheet" type="text/css" />
<link href="../../../../resources/dist/assets/css/app.min.css"
   rel="stylesheet" type="text/css" id="main-style-container" />

</head>

<body class="loading">
   <!-- Begin page -->
   <div class="wrapper">

      <div id="vertical-sidebar-placeholder"></div>

      <!-- ============================================================== -->
      <!-- Start Page Content here -->
      <!-- ============================================================== -->

      <div class="content-page">
         <div class="content">

            <div id="vertical-topbar-placeholder"></div>

            <form  role="form" class="form-horizontal" method="post">
            <input type="hidden" id="arrayUser" name="arrayUser" />
               <!-- Start Content-->
               <div class="container-fluid">

                  <!-- start page title -->
                  <div class="row">
                     <div class="col-12">
                        <div class="page-title-box">

                           <h3 class="page-title">MIS 출결 관리</h3>
                        </div>
                     </div>
                  </div>
                  <!-- <input type="text" name="userNo"> -->

                  <div class="row">
                     <div class="col-xl-12">

                        <div class="card">
                           <div class="card-body">
                              <h4 class="mb-3 header-title">출결 등록</h4>



                              <div class="form-group row mb-3">
                                 <label for="times" class="col-3 col-form-label">회차</label>
                                 <div class="col-1">
                                    <input type="text" class="form-control" name="times"
                                       placeholder="">
                                 </div>
                              </div>

                              <div class="form-group row mb-3">
                                 <label for="title" class="col-3 col-form-label">제목</label>
                                 <div class="col-3">
                                    <input type="text" class="form-control" name="title"
                                       placeholder="">
                                 </div>
                              </div>

                              <div class="form-group row mb-3">
                                 <label for="misDate" class="col-3 col-form-label">날짜
                                    선택</label>
                                 <div class="col-3">
                                    <input type="text" class="form-control date"
                                       name="misDate" data-toggle="date-picker"
                                       data-single-date-picker="true">
                                 </div>
                              </div>

                              <div class="form-group row mb-3">
                                 <label for="grade" class="col-3 col-form-label">학년</label>
                                 <div class="col-1">
                                 
                                    <select class="form-control" name="grade" id="grade">
                                       <option value="all">전체</option>
                                       <option value="4">4</option>
                                       <option value="3">3</option>
                                       <option value="2">2</option>
                                       <option value="1">1</option>
                                    </select>
                                 
                                 </div>
                              </div>


                              <br>
                              <div class="row">
                                 <div class="col-lg-12">
                                    <div class="row">
                                       <div class="col-lg-6">
                                          <h4 class="header-title">전체 학생 목록</h4>
                                          <div style="text-align: right;">
                                             <button type="button" class="btn btn-outline-primary" id="add">추가</button>
                                          </div>

                                          <br>
                                          <div class="table-responsive-sm">
                                             <table class="table table-centered w-100 dt-responsive nowrap" id="stuList">
                                                <thead class="thead-light">
                                                   <tr>
                                                      <th class="all" style="width: 20px;">
                                                         <div class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" id="customCheck1" name="allChcek">                                                                
                                                               <label class="custom-control-label" for="customCheck1">&nbsp;</label>
                                                         </div>
                                                      </th>
                                                      <!-- <th class="all">NO</th> -->
                                                      <th>학년</th>
                                                      <th>학번</th>
                                                      <th>이름</th>

                                                   </tr>
                                                </thead>

                                                <tbody>
                                                   <c:forEach items="${stuList}" var="uVo"
                                                      varStatus="listStat">
                                                      <tr class="stu${uVo.grade}">
                                                         <td>
                                                            <input type="checkbox" name="check" value="${uVo.userNo}" class="checkBox">
                                                         </td>
                                                         <%-- <td>${listStat.count}</td> --%>
                                                         <td class="tdGrade">${uVo.grade}</td>
                                                         <td>${uVo.userNo}</td>
                                                         <td>${uVo.userName}</td>
                                                      </tr>
                                                   </c:forEach>
                                                </tbody>
                                             </table>
                                          </div>
                                       </div>


                                       <div class="col-lg-6">
                                          <h4 class="header-title">출결 학생 목록</h4>

                                          <div style="text-align: right;">
                                             <button type="button" class="btn btn-outline-danger" id="delete">삭제</button>
                                          </div>

                                          <br>

                                          <div class="table-responsive-sm">
                                             <div class="table-responsive-sm">
                                                <table class="table table-centered w-100 dt-responsive nowrap" id="attList">
                                                
                                                   <thead class="thead-light">
                                                      <tr>
                                                         <th class="all" style="width: 20px;">
                                                            <div class="custom-control custom-checkbox">
                                                               <input type="checkbox" class="custom-control-input" id="customCheck1" name="check2"> 
                                                                  <label class="custom-control-label" for="customCheck1">&nbsp;</label>
                                                            </div>
                                                         </th>
                                                         <!-- <th class="all">NO</th> -->
                                                         <th>학년</th>
                                                         <th>학번</th>
                                                         <th>이름</th>

                                                      </tr>
                                                   </thead>

                                                   <tbody>
                                                   </tbody>
                                                </table>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <!-- end table-responsive-->
                              </div>
                              <!-- end table-responsive-->
                           </div>
                           <!-- end card body-->
                        </div>
                        <!-- end card -->
                     </div>
                     <!-- end col-->


                     <!-- end card-body -->
                  </div>



                  <!-- end card -->
                  <div style="text-align: right;">
                     <button type="submit" class="btn btn-primary" id="btn_submit">등록</button>
                     <button type="button" onclick="location.href='list'"
                        class="btn btn-light">취소</button>
                  </div>
               </div>
            </form>
            <!-- end col -->
         </div>
      </div>
   </div>

   <!-- Footer Start -->
   <footer class="footer">
      <div class="container-fluid">
         <div class="row">
            <div class="col-md-6">2018 - 2019 © Hyper - Coderthemes.com</div>
            <div class="col-md-6">
               <div class="text-md-right footer-links d-none d-md-block">
                  <a href="javascript: void(0);">About</a> <a
                     href="javascript: void(0);">Support</a> <a
                     href="javascript: void(0);">Contact Us</a>
               </div>
            </div>
         </div>
      </div>
   </footer>
   <!-- end Footer -->
   

   <!-- ============================================================== -->
   <!-- End Page content -->
   <!-- ============================================================== -->


   <!-- App js -->
   <script src="../../../../resources/dist/assets/js/app_admin.js"></script>

   <!-- third party js -->
   <script
      src="../../../../resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
   <script
      src="../../../../resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
   <!-- third party js ends -->

   <!-- demo app -->
   <script
      src="../../../../resources/dist/assets/js/pages/demo.calendar.js"></script>
   <!-- end demo js-->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

   
<script>
$(document).ready(
   function() {

      var formObj = $("form[role='form']");

      console.log(formObj);

      /* $(".btn-warning")
            .on("click",function() {
               self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
                     + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
            }); */

      $("#btn_submit").on("click", function() {
         
         var send_array = Array();
         var send_cnt = 0;
         var chkbox = $(".checkBox2");
         

         for(i=0;i<chkbox.length;i++) {
                 send_array[send_cnt] = chkbox[i].value;
                 send_cnt++;
         }

         $("#arrayUser").val(send_array);
         
         formObj.submit(); });
   });
</script>


   <script>
      $(document).ready(function() {
         
         $("#detached-check input:radio").click(function() {

            alert("clicked");

         });

         $("input:radio:first").prop("checked", true).trigger("click");

      });

      // 추가
      $("#add")
            .click(
                  function() {
                     var checkbox = $("input[name=check]:checked");

                     checkbox
                           .each(function(i) {
                              /* var tr = checkbox.parent().parent().parent().eq(i); */
                              var tr = checkbox.parent().parent().eq(
                                    i);
                              var td = tr.children();
                              var userNo = $(this).val();
                              var cnt = td.eq(1).html();
                              var grade = td.eq(2).text();
                              var id = td.eq(3).html();
                              var userName = td.eq(4).text();
                              var row = "<tr>"
                                    + "<td>"
                                    + "<input type=\"checkbox\" class=\"checkBox2\" name=\"check2\" value=\"" + userNo + "\"" + ">"
                                    + "</td>" + "<td>" + cnt
                                    + "</td>" + "<td>" + grade
                                    + "</td>" + "<td>" + id
                                    + "</td>" + "<td>" + userName
                                    + "</td>" + "</tr>";

                              // 숨긴 값의 체크박스를 false 상태로 바꿈
                              $(this).prop("checked", false);

                              // allcheck할 경우 숨긴 값의 체크박스도 체크되어서 class 값을 바꿈
                              $(this).attr("class", "hide");
                              tr.remove();
                              $("#attList > tbody").append(row);
                           });
                  });
      
      //삭제
      $("#delete")
      .click(
            function() {
               var checkbox = $("input[name=check2]:checked");

               checkbox
                     .each(function(i) {
                        /* var tr = checkbox.parent().parent().parent().eq(i); */
                        var tr = checkbox.parent().parent().eq(i);
                        var td = tr.children();
                        var userNo = $(this).val();
                        var cnt = td.eq(1).html();
                        var grade = td.eq(2).text();
                        var id = td.eq(3).html();
                        var userName = td.eq(4).text();
                        var row = "<tr class=\"stu"+ grade+"\"> "
                              + "<td>"
                              + "<input type=\"checkbox\" class=\"checkBox\" name=\"check\" value=\"" + userNo + "\"" + ">"
                              + "</td>" + "<td>" + cnt
                              + "</td>" + "<td>" + grade
                              + "</td>" + "<td>" + id
                              + "</td>" + "<td>" + userName
                              + "</td>" + "</tr>";

                        // 숨긴 값의 체크박스를 false 상태로 바꿈
                        $(this).prop("checked", false);
                        
                        // allcheck할 경우 숨긴 값의 체크박스도 체크되어서 class 값을 바꿈
                        $(this).attr("class", "hide");
                        tr.hide();
                        $("#stuList > tbody").append(row);
                     });
            });
      
   
   </script>
   <script src="../../../../resources/dist/assets/js/vendor/dataTables.checkboxes.min.js"></script>
</body>

<!-- 학년 체크 -->
<script>

$("#grade").change(function(){
   
   var search = $("#grade option:selected").val();
   
   var tr4 = $(".stu4");
   var tr3 = $(".stu3");
   var tr2 = $(".stu2");
   var tr1 = $(".stu1");
   
   if(search == '4'){
      tr4.show();
      
      //기존  3,2,1은 hide
      tr3.hide();
      tr2.hide();
      tr1.hide();
   }else if(search == '3'){
      tr3.show();
      
      tr4.hide();
      tr2.hide();
      tr1.hide();
   }else if(search == '2'){
      tr2.show();
      
      tr4.hide();
      tr3.hide();
      tr1.hide();
   }else if(search == '1'){
      tr1.show();
      
      tr4.hide();
      tr3.hide();
      tr2.hide();
   }else if(search == 'all'){
      
      tr4.show();
      tr3.show();
      tr2.show();
      tr1.show();
   }
   
});
   </script>
</html>