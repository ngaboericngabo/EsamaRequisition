<%@page import="computer.zone.domain.Users"%>
<%

String error=null;
error=request.getParameter("error");
if(error==null){

}else{%>
<p class="alert-danger"><%=error%><p> 
    
<%}%>
<form action="UpdatePasswordController" method="post" autocomplete='off'>
<div class="whiteBackGround separeter">
    
   <div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>Update Password</center>  </div>
    <div class="panel-body">

<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">New Password</label>
    <div class="col-sm-4 col-dm-4">
        <input type="password" autocomplete="off"  name="pass1" class="form-control date"  style="color: black" />
    </div>
    <span class="text-danger" ></span>
</div> 
        <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Confirm New Password</label>
    <div class="col-sm-4 col-dm-4">
        <input type="password" autocomplete="off"  name="pass2"  class="form-control date"  style="color: black" />
    </div>
    <span class="text-danger" ></span>
</div> 
    </div>

</div>

</div>

 
<!--button content-->
<div class="whiteBackGround separeter">
     
</div>
  <div class="btnsection">
       
        <input type="submit" value="Update">   
        <input class="cancelBtn" type="button" value="Cancel">   
    </div>
</form>
