
<%@page import="computer.zone.domain.UserCategory"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="computer.zone.domain.Users"%>
<%@page import="computer.zone.dao.impl.UserImpl"%>
<%@page import="computer.zone.dao.impl.LoginImpl"%>
<%@page import="computer.zone.dao.impl.UserCategoryImpl"%>
<!DOCTYPE html>
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
        <script type="text/javascript" src="layout/js/panelAnnimation.js"></script>
        <script type="text/javascript" src="layout/js/print.js"></script>
        
        <!---Date picker and Time Picker --->
        <link rel="stylesheet" href="layout/datePicker/jquery-ui.structure.min.css">
    <link rel="stylesheet" href="layout/datePicker/jquery-ui.css">
    <link rel="stylesheet" href="layout/datePicker/datePickerNext.css">
    <link rel="stylesheet" href="layout/datePicker/jquery-ui.theme.css">
    <link rel="stylesheet" href="JSS/jquery-ui.theme.min.css">
    <link rel="stylesheet"  href="layout/datePicker/timepicker.css" />
    <link rel="stylesheet" href="layout/datePicker/jquery-ui.js">
    
    <script src="layout/datePicker/jquery-ui.min.js"></script>
    <script type="text/javascript" src="layout/datePicker/timePicker.js"></script>
    
    <!--Side bar Menu-->
    <link href="layout/css/sidebarMenu.css" rel="stylesheet">

      <script>
  $(function() {
    $( "#fromDate").datepicker();
     $( "#toDate" ).datepicker();
     $( "#otherDate1" ).datepicker();
     $( "#otherDate2" ).datepicker();
  });
 </script>
    </head>

        <body>

        <jsp:include page="layout/header.jsp"/>

        <!-- Navigation -->
        
        
        <!-- Page Content -->
        <div class="container-fluid mainBackGround" style="margin-top: 40px;position: initial">
            <div class="container"  >


                <div class="row" class="col-md-12" style=" margin-top: 20px;">
                    <!--Business form-->
                    <div class="whiteBackGround">
<!--We need to pass here the page name as parameter so that it can be load here-->
 
<%
    try{
          Users person1 = new Users();
        person1 = (Users) session.getAttribute("userSession");
        person1.getUserCategory().getUsercategoryName();
        if (person1.getUserName() == null) {
            
            response.sendRedirect("login.jsp");
        }
        String apCatgory="::: under "+person1.getDepartement().getDepartementName()+" Departement";
  
 String pageContent=null;
 pageContent=request.getParameter("view");
 if(null!=pageContent ||!pageContent.isEmpty()){
     
%>
<div class="panel panel-primary" style="margin-left: -30px;" >
    <!-- Default panel contents -->
    <div class="panel-heading" style="background-image: url(layout/image/bgpanel.png)"><center><strong><%=person1.getUserCategory().getUsercategoryName()%> Form <%=apCatgory%></strong></center>  </div>
    <div class="panel-body">

<jsp:include page="<%=pageContent%>"/>
<%}else{%>
<h2>Page Not found !</h2>
<%}
    }catch(Exception ex){
        session.invalidate();
         response.sendRedirect("login.jsp");
     %>

<%   
    }
%>
  </div>

</div>
                    </div>
                    <!--End of the Business form-->
                </div>

            </div>
        </div>
        <!-- /.container -->

        <!-- Footer -->
        <jsp:include page="layout/footer.jsp"/>
        <!-- /.Footer -->



    </body>

</html>
