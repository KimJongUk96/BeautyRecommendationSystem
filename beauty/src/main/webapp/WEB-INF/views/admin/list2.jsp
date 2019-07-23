<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>


<!-- Main content -->
<section class="content">
   <div class="row">
      <!-- left column -->


      <div class="col-md-12">
         <!-- general form elements -->
         <div class='box'>
            <div class="box-header with-border">
               <h3 class="box-title">Admin Information</h3>
            </div>


            <div class="box-body">
            
               
               <button id='newBtn'>New Board</button>

            </div>
         </div>


         <div class="box">
            <div class="box-header with-border">
               <h3 class="box-title">ADMIN LIST</h3>
            </div>
            <div class="box-body">
            
               <table class="table table-bordered">
                  <tr>
                     <th style="width: 10px">NO</th>
                     <th>ID</th>
                     <th>NAME</th>
                     <th>REGDATE</th>
                     <th style="width: 10px">MANAGE</th>
                  </tr>
                  <c:forEach items="${list}" var="adminVO">
                     <tr>
                        <td>${adminVO.adminNo}
                        <td><a href="/admin/read&adminNo=${adminVO.adminNo}">${adminVO.id}</a></td>
                        <td>${adminVO.name}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd"
                              value="${adminVO.regdate}" /></td>
                              <td><a href ="/admin/list"><button type="button">remove</td></button></a>
                              
                     </tr>
                  </c:forEach>
                  </table>
                  </div>
                  <!-- /.box-body -->


            <div class="box-footer">

               <div class="text-center">
                  <ul class="pagination">

                     <c:if test="${pageMaker.prev}">
                        <li><a
                           href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
                     </c:if>

                     <c:forEach begin="${pageMaker.startPage }"
                        end="${pageMaker.endPage }" var="idx">
                        <li
                           <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
                           <a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
                        </li>
                     </c:forEach>

                     <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                        <li><a
                           href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
                     </c:if>

                  </ul>
               </div>
               
            </div>
            <!-- /.box-footer-->
         </div>
      </div>
      <!--/.col (left) -->

   </div>
   <!-- /.row -->
</section>
<!-- /.content -->


<script>
   var result = '${msg}';

   if (result == 'SUCCESS') {
      alert("처리가 완료되었습니다.");
   }
</script>

<script>
   $(document).ready(
         function() {
            

            $('#newBtn').on("click", function(evt) {

               self.location = "register";

            });
            
             $('#manageBtn').on("click", function(evt) {

               self.location = "remove";

            }); 
            
         });
</script>


