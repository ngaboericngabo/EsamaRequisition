<%-- 
    Document   : header
    Created on : 25-Mar-2017, 15:36:37
    Author     : RTAP4
--%>

<%@page import="computer.zone.domain.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vehicle Requisition</title>
    </head>
    <body>
<%
    try{
      Users person = new Users();
        person = (Users) session.getAttribute("userSession");
        person.getFname();
      


%>
        <div   id="header" class="container-fluid mainBackGround" style="background-color: #2fa4e7; height:7.5%;" >
            <div class="container">
              
                <div class="col-md-5" > <img src="layout/image/Bannerogg.png"> </div>
                <div class="col-md-7">

                    <ul style="float: right;">
               
                     
                <ul class="topnav2" >
                 
                    
                    <li class="right"><a style="background-color: #66ccff;font-weight: bold;color:red" href="LogOut" ><span class="glyphicon glyphicon-off"></span> Sign out</a></li>
                     <li class="right"><a href="javascript:void(0)" >Welcome :<%=person.getFname()%> </a></li>
                     <li class="right"><a style="background-color: #66ccff;font-weight: bold;color:green" href="UpdatePassPageController" ><span class="glyphicon glyphicon-edit"></span>Password</a></li>
                   
                </ul>
                     
                    </ul>
                </div>


            </div>

        </div>
                    
    </div>
    <%}catch(Exception ex){
         
       
    }%>
</body>
</html>
