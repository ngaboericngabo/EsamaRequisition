<%-- 
    Document   : index
    Created on : 26-Mar-2017, 16:22:05
    Author     : RTAP4
--%>

<%@page import="computer.zone.domain.Requisition"%>
<%@page import="computer.zone.dao.impl.RequisitionImpl"%>
<%@page import="computer.zone.dao.impl.ApprovalLevelImpl"%>
<%@page import="computer.zone.domain.ApprovalLevel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="computer.zone.dao.impl.LoginHistoricImpl"%>
<%@page import="java.util.Date"%>
<%@page import="computer.zone.domain.LoginHistoric"%>
<%@page import="java.io.PrintWriter"%>

<%@page import="computer.zone.dao.impl.DepartementImpl"%>
<%@page import="computer.zone.dao.impl.VehicleImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.dao.impl.UserImpl"%>
<%@page import="computer.zone.dao.impl.UserCategoryImpl"%>
<%@page import="computer.zone.dao.impl.LoginImpl"%>
<%@page import="sun.security.jgss.LoginConfigImpl"%>
<%@page import="computer.zone.domain.Users"%>
<%@page import="computer.zone.domain.UserCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%RequisitionImpl requisition=new RequisitionImpl(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<String> er= new ArrayList<String>();
        er=(List<String>)session.getAttribute("errorList");
        
        if(er==null){
       
              
        }else{
        int i=1;
  
        	for (String errorMsg : er) {
		%>
                <p class="alert-danger"><%=i%> <%=errorMsg%></p>
        <%
		i++;}
                
        }

        %>
        
        <form action="validTest" method="post">
            
            <input type="text" placeholder="name" value="" name="name"><br/>
            <input type="text" placeholder="email" value="" name="email"><br/>
            <input type="text" placeholder="cash" value="" name="cash"><br/>
            <input type="submit" value="save">
        </form>
         <%
        
        UserImpl g=new UserImpl();
        g.createTable();
        %>
      
    </body>
</html>
