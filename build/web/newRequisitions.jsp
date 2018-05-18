<%@page import="computer.zone.domain.Requisition"%>
<%@page import="computer.zone.dao.impl.VehicleImpl"%>
<%@page import="computer.zone.dao.impl.RequisitionImpl"%>
<%@page import="computer.zone.domain.Users"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.dao.impl.UserImpl"%>
<%RequisitionImpl requisition=new RequisitionImpl(); %>

<div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>List Of New Requisitions</center>  </div>
    <div class="panel-body" style="overflow-x:auto;" >

   
    <table  id="table1" class="display bg-info" border="1" style="font-size: 10pt; ">
    <thead>
        <tr>
            <th>ssN0</th>
            <th>Requisition Number</th>
            <th>Names</th>
            <th>Departure/Return Date </th>
            <th>Departure/Return Time</th>
            <th>Purpose</th>
            <th>Destination</th>
            <th>Approve</th>
            <th>Reject</th>
           
        </tr>
    </thead>
    <tbody>
        <%
try{
                Requisition req=new Requisition();
                 Users person5 = new Users();
        person5 = (Users) session.getAttribute("userSession");
        person5.getUserId();
  
        
          if(person5.getUserCategory().getUserCatid()==2){
                int i=1;
                   	
        	for (Iterator iterator = requisition.getListRequisition().iterator(); iterator.hasNext();) {
								req = (Requisition) iterator.next();
                                                              //  out.println(req.getSupervisor());
           /*Supervisor*/           if((req.getApprovalLevel()==null)&&(req.getSupervisor()!=null &&person5.getUserId()==req.getSupervisor().getUserId())&&(req.getRequester().getUserCategory().getUserCatid()==5 )&&(req.getStatus().equals("Not Yet"))){                 
          %>
        <tr>
            <td><%=i%></td>
           <%if(req.getRequisitionNumber()==null){%>
            <td>Not yet </td>
            <%}else{%>
            <td><%=req.getRequisitionNumber()%></td>
            <%}%>
            <td><%=req.getLoginUser().getLname()%>/<%=req.getLoginUser().getFname()%></td>
            <td><%=req.getRequisitionDateIn()%>/<%=req.getRequisitionDateOut()%></td>
                <td><%=req.getRequisitionTimeIn()%>/<%=req.getRequisitionTimeOut()%></td>
                <td><%=req.getPurpose()%></td>
                <td><%=req.getDestination()%></td>
                <td ><a href="supervisorApproverController?requisitionId=<%=req.getRequisitionId()%>"><button class="btn btn-success glyphicon glyphicon-ok-sign"> Approve </button></a></td>
                <td ><a href="allRejections?requisitionId=<%=req.getRequisitionId()%>"><button class="btn btn-danger glyphicon glyphicon-remove"> Reject</button></a></td>
        </tr>

    <%i++;}}}else if((person5.getUserCategory().getUserCatid()==3)){
    int i=1;
        	for (Iterator iterator = requisition.getListRequisition().iterator(); iterator.hasNext();) {
							req = (Requisition) iterator.next();
/*Transport Officer*/ if(req.getStatus().equals("In Progress")){ %>
            <tr>
            <td><%=i%></td>
             <%if(req.getRequisitionNumber()==null){%>
            <td>Not yet </td>
            <%}else{%>
            <td><%=req.getRequisitionNumber()%></td>
            <%}%>
            <td><%=req.getLoginUser().getLname()%>/<%=req.getLoginUser().getFname()%></td>
            <td><%=req.getRequisitionDateIn()%>/<%=req.getRequisitionDateOut()%></td>
                <td><%=req.getRequisitionTimeIn()%>/<%=req.getRequisitionTimeOut()%></td>
                <td><%=req.getPurpose()%></td>
                <td><%=req.getDestination()%></td>
                <td ><a href="ApproverForm_TransportController?requisitionId=<%=req.getRequisitionId()%>"> <button class="btn btn-success glyphicon glyphicon-ok-sign"> Approve </button></a></td>
                <td ><a href="allRejections?requisitionId=<%=req.getRequisitionId()%>"><button class="btn btn-danger glyphicon glyphicon-remove"> Reject</button></a></td>
        </tr>
         <%  i++;}}}else if((person5.getUserCategory().getUserCatid()==4)){
    int i=1;
        	for (Iterator iterator = requisition.getListRequisition().iterator(); iterator.hasNext();) {
								req = (Requisition) iterator.next();
/*TDirector*/ if((req.getStatus().equals("Approved")&&(req.getTypeOfRequest().getTypeOfRequestId()==2||req.getTypeOfRequest().getTypeOfRequestId()==3))||(req.getRequester().getUserCategory().getUserCatid()==2&&!req.getStatus().equals("In Progress"))){ %>
                <tr>
            <td><%=i%></td>
                <%if(req.getRequisitionNumber()==null){%>
            <td>Not yet </td>
            <%}else{%>
            <td><%=req.getRequisitionNumber()%></td>
            <%}%>
            <td><%=req.getLoginUser().getLname()%>/<%=req.getLoginUser().getFname()%></td>
            <td><%=req.getRequisitionDateIn()%>/<%=req.getRequisitionDateOut()%></td>
                <td><%=req.getRequisitionTimeIn()%>/<%=req.getRequisitionTimeOut()%></td>
                <td><%=req.getPurpose()%></td>
                <td><%=req.getDestination()%></td>
                <td ><a href="ApproverForm_DirectorController?requisitionId=<%=req.getRequisitionId()%>"> <button class="btn btn-success glyphicon glyphicon-ok-sign"> Approve </button></a></td>
                <td ><a href="allRejections?requisitionId=<%=req.getRequisitionId()%>"><button class="btn btn-danger glyphicon glyphicon-remove"> Reject</button></a></td>
        </tr>
         <%  i++;}}}}catch(Exception jj){}

requisition=null;

         %>
    </tbody>
</table>



</div>
 </div>


