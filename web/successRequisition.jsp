<%@page import="computer.zone.dao.impl.RequisitionImpl"%>
<%@page import="computer.zone.domain.Requisition"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.dao.impl.TypeOfRequestImpl"%>
<%@page import="computer.zone.domain.TypeOfRequest"%>
<%@page import="computer.zone.domain.Users"%>
<%@page import="computer.zone.dao.impl.VehicleImpl"%>
<%@page import="computer.zone.domain.Vehicle"%>
<%
Requisition req=new Requisition();
RequisitionImpl reqImpl=new RequisitionImpl();
    Users person1 = new Users();
        person1 = (Users) session.getAttribute("userSession");
String reqid=null;
 reqid =request.getParameter("reqn");

         try {
                req = reqImpl.getModelWithMyHQL(new String[]{"requisitionId"}, new Object[]{Integer.parseInt(reqid)}, "from Requisition");

            } catch (Exception ex) {
                out.println(ex.getMessage());
            }

%>
<ul class="m" style="list-style-type: none;margin: 0;padding: 0;overflow: hidden; background-color: #36bcff;font-weight: bold">
    <li><a class="active" href="mainPage.jsp?view=successRequisition.jsp?reqn="<%=reqid%>>Success Page</a></li>
    <li><a  href="mainPage.jsp?view=requisition.jsp">Requisitions</a></li>
    <%if(person1.getUserCategory().getUserCatid()==2){%>
  <li><a href="mainPage.jsp?menuPage=newRequisitions.jsp&view=sideBar.jsp">My Page</a></li>
 <%}else{%>
    <li><a href="mainPage.jsp?view=RequesterTabs.jsp">My Page</a></li>
<%}%>
</ul>

<div class="jumbotron">
<table class="table table-striped">
    <tr>
        
        <td>Requisition Type</td>
        <td><%=req.getTypeOfRequest().getTypeOfRequestName()%></td>
    </tr>
    <tr>
        <td>Requisition Number</td>
        <td><p class="badge">Will be generated after approve</p></td>
    </tr>
    <tr>
        <td>Destination</td>
        <td><%=req.getDestination()%></td>
    </tr>
    <tr>
        <td>Purpose</td>
        <td><%=req.getPurpose()%></td>
    </tr>
    <tr>
        <td>Departure Date</td>
        <td><%=req.getRequisitionDateIn()%></td>
    </tr>
    <tr>
        <td>Return Date</td>
        <td><%=req.getRequisitionDateOut()%></td>
    </tr>
    <tr>
        <td>Departure Time</td>
        <td><%=req.getRequisitionTimeIn()%></td>
    </tr>
    <tr>
        <td>Return Time</td>
        <td><%=req.getRequisitionTimeOut()%></td>
    </tr>
   
    
</table> 
    
    


</div>
<!--button content-->
<div class="whiteBackGround separeter">

</div>


