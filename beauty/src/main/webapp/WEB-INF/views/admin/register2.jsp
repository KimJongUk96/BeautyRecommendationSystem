<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!-- Main content -->
<section class="content">
   <div class="row">
      <!-- left column -->
      <div class="col-md-12">
         <!-- general form elements -->
         <div class="box box-primary">
            <div class="box-header">
               <h3 class="box-title">REGISTER INFORMATION</h3>
            </div>
            <!-- /.box-header -->

            <form role="form" method="post">
               <div class="box-body">
                  <div class="form-group">
                     <label for="exampleInputEmail1">ID</label> <input type="text"
                        name='id' class="form-control" placeholder="Enter Id">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputPassword1">PASSWORD</label> <input type="password"
                        name='pw' class="form-control" placeholder="Enter Password">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputEmail1">NAME</label> <input type="text"
                        name='name' class="form-control" placeholder="Enter Name">
                  </div>
                  
               </div>
               <!-- /.box-body -->

               <div class="box-footer">
                  <button type="submit" class="btn btn-primary">Save</button>
                  <a href ="/admin/list"><button type="button" class="btn btn-danger">cancle</button></a>
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


