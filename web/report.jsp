<%@page import="computer.zone.common.Formating"%>
<%@page import="computer.zone.dao.impl.ApprovalRoutingImpl"%>
<%@page import="computer.zone.domain.ApprovalRouting"%>
<%@page import="computer.zone.dao.impl.RequisitionImpl"%>
<%@page import="computer.zone.domain.Requisition"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.dao.impl.TypeOfRequestImpl"%>
<%@page import="computer.zone.domain.TypeOfRequest"%>
<%@page import="computer.zone.domain.Users"%>
<%@page import="computer.zone.dao.impl.VehicleImpl"%>
<%@page import="computer.zone.domain.Vehicle"%>

    <style>
        td,th{
      font-size: 10pt;border: 1px solid black;
        }
    </style>
<%
Requisition req=new Requisition();
RequisitionImpl reqImpl=new RequisitionImpl();
ApprovalRouting rt=new ApprovalRouting();
ApprovalRoutingImpl rtImpl=new ApprovalRoutingImpl();
 Users person12 = new Users();
        person12 = (Users) session.getAttribute("userSession");
      
       String fromDate=request.getParameter("fromDate");
       String toDate=request.getParameter("toDate");
       
%>

 <input onclick="PrintElem('#tprint','hideDive')" type="button" class="glyphicon glyphicon-print" value="Print">
        
<div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>Requisition Report From <span style="color: black"><%=fromDate%> to <%=toDate%> </span></center>  </div>
    <div id="tprint" class="panel-body" style="overflow-x: auto">
  <div style="display: none" id="hideDive"> <img style="" src="layout/image/Bannerogg.png" alt="..." width="600px" class="img-rounded"/> 
        <h2 style="">Journey  of  Requisitions Report from <%=fromDate%> to <%=toDate%>  </h2>
        </div>
    <table   class="table table-striped" border="1">
    <thead>
        <tr>
            <th>#</th>
            <th>Requisition Number</th>
            <th>purpose</th>
            <th>Destination</th>
            <th>Requested date</th>
            <th>Departure Date</th>
            <th>Return Date</th>
            <th>Type</th>
            <th>Vehicle No</th>
            <th>Approval Level</th>
            <th>Approver</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <%
        
        /*
        try {
            rt = rtImpl.getModelWithMyHQL(new String[]{"requisition"}, new Object[]{req}, "from ApprovalRouting");
rt.getUsers().getFname();
        } catch (Exception ex) {
            
        }

        */
       Formating fmt=new Formating();
int i=0;
  if(person12.getUserCategory().getUserCatid()==2){
              for (Iterator iterator = reqImpl.getListByDateBewteen("requisitionDate", fmt.getFormtDateReturnMysqlFormat(fromDate), fmt.getFormtDateReturnMysqlFormat(toDate)).iterator(); iterator.hasNext();) {
                                                req = (Requisition) iterator.next();
  if(req.getRequester().getUserCategory().getUserCatid()==5){ 
                     i++;                                
        %>
        <tr>
            <td><%=i%></td>
             <%if (req.getRequisitionNumber() == null) {%>
                    <td>Not yet </td>
                    <%} else {%>
                    <td><%=req.getRequisitionNumber()%></td>
                    <%}%>
            <td><%=req.getPurpose()%></td>
            <td><%=req.getDestination()%></td>
            <td><%=req.getRequisitionDate()%> </td>
            <td><%=req.getRequisitionDateIn()%> </td>
            <td><%=  req.getRequisitionDateOut()%></td>
            <td><%=req.getTypeOfRequest().getTypeOfRequestName()%></td>
            <%if(req.getVehicle()==null){%>
            <td>Not Yet assigned</td>
            <%}else{%>
              <td><%=req.getVehicle().getPlateNumber()%></td>
            <%}%>
            <%if(req.getApprovalLevel()==null){%>
            <td>Not yet</td>
            <td>Not Yet</td>
            <%}else{ 
            %>
            <td><%=req.getApprovalLevel().getLevelName()%></td>
            <td><%= req.getApprovalLevel().getUserCategory().getUsercategoryName()%>  </td>
            <%}%>
       <td><%=req.getStatus()%> </td>
        </tr>
          <%}}}else if((person12.getUserCategory().getUserCatid()==3)){

               for (Iterator iterator = reqImpl.getListByDateBewteen("requisitionDate", fmt.getFormtDateReturnMysqlFormat(fromDate), fmt.getFormtDateReturnMysqlFormat(toDate)).iterator(); iterator.hasNext();) {
                                                      req = (Requisition) iterator.next();

                     i++;                       //out.println(req.getRequester().getUsers().getUserId());   
          %>
     <tr>
            <td><%=i%></td>
            <%if (req.getRequisitionNumber() == null) {%>
                    <td>Not yet </td>
                    <%} else {%>
                    <td><%=req.getRequisitionNumber()%></td>
                    <%}%>
            <td><%=req.getPurpose()%></td>
            <td><%=req.getDestination()%></td>
            <td><%=req.getRequisitionDate()%> </td>
            <td><%=req.getRequisitionDateIn()%> </td>
            <td><%=  req.getRequisitionDateOut()%></td>
            <td><%=req.getTypeOfRequest().getTypeOfRequestName()%></td>
           <%if(req.getVehicle()==null){%>
            <td>Not Yet assigned</td>
            <%}else{%>
              <td><%=req.getVehicle().getPlateNumber()%></td>
            <%}%>
            <%if(req.getApprovalLevel()==null){%>
            <td>Not yet</td>
            <td>Not Yet</td>
            <%}else{   %>
            <td><%=req.getApprovalLevel().getLevelName()%></td>
            <td><%= req.getApprovalLevel().getUserCategory().getUsercategoryName()%>  </td>
            <%}%>
       <td><%=req.getStatus()%> </td>
        </tr>      
        
        <%          
 }}else if((person12.getUserCategory().getUserCatid()==4)){
            for (Iterator iterator = reqImpl.getListByDateBewteen("requisitionDate", fmt.getFormtDateReturnMysqlFormat(fromDate), fmt.getFormtDateReturnMysqlFormat(toDate)).iterator(); iterator.hasNext();) {
                                                            req = (Requisition) iterator.next();
  if(req.getRequester().getUserCategory().getUserCatid()==2){
     
i++;
        %>
  <tr>
            <td><%=i%></td>
            <%if (req.getRequisitionNumber() == null) {%>
                    <td>Not yet </td>
                    <%} else {%>
                    <td><%=req.getRequisitionNumber()%></td>
                    <%}%>
            <td><%=req.getPurpose()%></td>
            <td><%=req.getDestination()%></td>
            <td><%=req.getRequisitionDate()%> </td>
            <td><%=req.getRequisitionDateIn()%> </td>
            <td><%=  req.getRequisitionDateOut()%></td>
            <td><%=req.getTypeOfRequest().getTypeOfRequestName()%></td>
            <%if(req.getVehicle()==null){%>
            <td>Not Yet assigned</td>
            <%}else{%>
              <td><%=req.getVehicle().getPlateNumber()%></td>
            <%}%>
            <%if(req.getApprovalLevel()==null){%>
            <td>Not yet</td>
            <td>Not Yet</td>
            <%}else{    %>
            <td><%=req.getApprovalLevel().getLevelName()%></td>
            <td><%= req.getApprovalLevel().getUserCategory().getUsercategoryName()%>  </td>
            <%}%>
       <td><%=req.getStatus()%> </td>
        </tr>      
        
<%

}}}%>

    </tbody>
</table>

   

</div>

 
<!--button content-->

     
</div>
<!--button content-->
<div class="whiteBackGround separeter">

</div>


