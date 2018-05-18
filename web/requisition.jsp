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

 Users person12 = new Users();
        person12 = (Users) session.getAttribute("userSession");
       
%>
<ul class="m" style="font-weight: bold;list-style-type: none;margin: 0;padding: 0;overflow: hidden; background-color: #36bcff;">
   
    <li><a class="active" href="mainPage.jsp?view=requisition.jsp">Requisition</a></li>
    <%if(person12.getUserCategory().getUserCatid()==2){%>
      <li><a href="mainPage.jsp?menuPage=newRequisitions.jsp&view=sideBar.jsp">My Page</a></li>

 <%}else{%>
    <li><a href="mainPage.jsp?view=RequisitionForm.jsp">My Page</a></li>
<%}%>
</ul>

<div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>My Requisition Requisitions </center>  </div>
    <div class="panel-body" style="overflow-x: auto">

    <table  id="table1" class="display bg-info" border="1">
    <thead>
        <tr>
            <th>#</th>
            <th>Requisition Number</th>
            <th>purpose</th>
            <th>Destination</th>
            <th>Requested date</th>
            <th>Departure Date</th>
            <th>Return  Date</th>
            <th>Departure Time </th>
            <th>Return Time</th>
            <th>Type</th>
            <th>Vehicle No</th>
            <th>Approval Level</th>
            <th>Approver</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <%
int i=0;
              for (Iterator iterator = reqImpl.getListRequisition().iterator(); iterator.hasNext();) {
                                                req = (Requisition) iterator.next();
                                         //out.println(req.getRequester().getUsers().getUserId());       
          if(person12.getUserId()==req.getRequester().getUserId()) {                                     
                                              
                                                
        i++;
        %>
        <tr>
            <td><%=i%></td>
            <%if(req.getRequisitionNumber()==null){%>
            <td><span style="color: blue" >Not Approved</span></td>
            <%}else{%>
            <td><span style="font-weight: bold" class="badge"><%=req.getRequisitionNumber()%></span></td>
            <%}%>
            <td><%=req.getPurpose()%></td>
            <td><%=req.getDestination()%></td>
            <td><%=req.getRequisitionDate()%> </td>
            <td><%=req.getRequisitionDateIn()%> </td>
            <td><%=  req.getRequisitionDateOut()%></td>
            <td><%=  req.getRequisitionTimeIn()%></td>
            <td><%=  req.getRequisitionTimeOut()%></td>
            <td><%=req.getTypeOfRequest().getTypeOfRequestName()%></td>
            <%if(req.getVehicle()==null){%>
            <td> <span style="color: blue">Not yet Assigned</span></td>
             <%}else{%>
             <td ><span style="color: #00cc33"><%=req.getVehicle().getPlateNumber()%></span></td>
                <%}%>
            <%if(req.getApprovalLevel()==null){%>
            <td>Not yet</td>
            <td>Not Yet</td>
            <%}else{%>
            <td><%=req.getApprovalLevel().getLevelName()%></td>
            <td><%=req.getApprovalLevel().getUserCategory().getUsercategoryName()%></td>
            <%}%>

            
            <%if(req.getStatus().equals("In Progress")){%>
            <td><span style="color: #3dc1ff"><%=req.getStatus()%> </span></td>
       <%}else if(req.getStatus().equals("Not Yet")){%>
       <td><span style="color:#d57632"><%=req.getStatus()%> </span></td>
       <%}else if(req.getStatus().equals("Approved")){%>
       <td><span style="color:#36f77b"><%=req.getStatus()%> </span></td>
       <%}else if(req.getStatus().equals("Rejected")){%>
         <td><span style="color:red"><%=req.getStatus()%> </span></td>
       <%}else{%>
         <td><span style="color:red">Status Not Found!</span></td>
       <%}%>
        </tr>
          <%}}%>

    </tbody>
</table>

   

</div>

 
<!--button content-->

     
</div>
<!--button content-->
<div class="whiteBackGround separeter">

</div>


