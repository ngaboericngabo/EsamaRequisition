<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        
             <!-- Custom CSS -->
        <link rel="stylesheet" href="layout/css/bootstrap.min_1.css"  type="text/css"/>
        <link href="layout/css/customer.css" rel="stylesheet">
        <link href="layout/css/main.css" rel="stylesheet">
        
         <!---Data table js--->
         <link rel="stylesheet" type="text/css" href="layout/dataTables/css/jquery.dataTables.css">
        <script type="text/javascript" src="layout/dataTables/js/jQuery.js"></script>
       <script type="text/javascript" src="layout/dataTables/js/jquery.dataTables.js"></script>
       
        <!---Main js--->
        <script type="text/javascript" src="layout/js/mian.js"></script>
        
        <!---Date picke --->
        <link rel="stylesheet" href="layout/datePicker/jquery-ui.js">
    <script src="layout/datePicker/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="layout/datePicker/jquery-ui.structure.min.css">
    <link rel="stylesheet" href="layout/datePicker/jquery-ui.css">
    <link href="layout/css/sidebarMenu.css" rel="stylesheet">

      <script>
  $(function() {
    $( "#fromDate" ).datepicker();
     $( "#toDate" ).datepicker();
     $( "#otherDate1" ).datepicker();
     $( "#otherDate2" ).datepicker();
  });
 </script>
    </head>

    <body>

    <div   id="header" class="container-fluid mainBackGround" style="background-color: #2fa4e7; height:7.25%" >
            <div class="container">
              
                <div class="col-md-8" > <img src="layout/image/Bannerogg.png"> </div>
                <div class="col-md-4">

                    <ul style="float: right;">
                
                     
                    </ul>
                </div>


            </div>

        </div>

        <!-- Navigation -->
        
       
        <!-- Page Content -->
        <div class="container-fluid mainBackGround" >
            <div class="container"  >


                <div class="row" class="col-md-12" style=" margin-top: 80px;">
                    <!--Business form-->
                    <div class="whiteBackGround">
                        <%
                            String msg=null;
                                  msg=  request.getParameter("msg");
                        if(msg==null){}else{
                        %>
                        <p class="alert-danger"><%=msg%></p>
                        <%}%>
                        <%
                            String msgP=null;
                                  msgP=  request.getParameter("msgP");
                        if(msgP==null){}else{
                        %>
                        <p class="alert-success"><%=msgP%></p>
                        <%}%>
<form action="LoginController" method="post">
    
    <center><div class="panel panel-primary" >
    <!-- Default panel contents -->
    <div class="panel-heading" style="background-color: #ff6600"><center>LOGIN</center>  </div>
    <div class="panel-body">

  

    
    <center>  <div class="login">
  <div class="login-header">
    <h1></h1>
  </div>
       <div class="login-form">
    <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">User Name</label>
    <div class="col-sm-4 col-dm-4">
        <input name="userName" type="text"  class="form-control date"  style="color: black" placeholder="User Name"/>
    </div>
    <span class="text-danger" ></span>
</div>
           <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Password</label>
    <div class="col-sm-4 col-dm-4">
        <input name="password" type="password"  class="form-control date"  style="color: black" placeholder="Password"/>
    </div>
    <span class="text-danger" ></span>
</div>
           <input type="submit" value="Login">
    
    <br>
    <h6 class="no-access">Can't access your account?</h6>
           </div>
</div>
</center>
</div>

 
<!--button content-->

     
        </div>
  
    </center>
    </form>
  </div>

</div>

</div>
              </div>
                    <!--End of the Business form-->
                </div>

            </div>
        </div>
        <!-- /.container -->

      



    </body>

</html>
