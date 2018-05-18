<%@page import="java.util.Date"%>
<%@page import="computer.zone.dao.impl.JourneyInfoImpl"%>
<%@page import="computer.zone.domain.JourneyInfo"%>
<%@page import="computer.zone.common.Formating"%>
<%@page import="computer.zone.domain.Requisition"%>
<%@page import="computer.zone.dao.impl.VehicleImpl"%>
<%@page import="computer.zone.dao.impl.RequisitionImpl"%>
<%@page import="computer.zone.domain.Users"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.dao.impl.UserImpl"%>

    <style>
        td,th{
      font-size: 10pt;border: 1px solid black;
        }
    </style>
  
<%
   String  fromDate = request.getParameter("fromDate");
    String toDate = request.getParameter("toDate");
     

%>
<div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>Journey  of  Requisitions Report from <%=fromDate%> to <%=toDate%>  </center>  </div>
    <div  class="panel-body" style="overflow-x:auto" id="tprint"  >
        <div style="display: none" id="hideDive"> <img style="" src="layout/image/Bannerogg.png" alt="..." width="600px" class="img-rounded"/> 
        <h2 style="">Journey  of  Requisitions Report from <%=fromDate%> to <%=toDate%>  </h2>
        </div>
        
        <table   id="table1" class="display bg-info" border="1" style="font-size: 10pt; "  >
             <thead>
                <tr >
                    <th>N0</th>
                    <th>Requisition Number</th>
                    <th>Names</th>
                    <th>Department</th>
                    <th>Requisition Date</th>
                   
                    <th>Destination</th>
                <th>Duration</th>
                    <th>total Mileage/out and In</th>
                    <th>Vehicle</th>
                    <th>Driver</th>
                    
             

                </tr>
            </thead>
                <tbody >
                   
                <%
                    try {
                       
                       JourneyInfo j = new JourneyInfo();
                       JourneyInfoImpl jImpl = new JourneyInfoImpl();
             Formating fmt=new Formating();

int i=1;
 
 for (Iterator iterator = jImpl.getListByDateBewteen("recordingDate", fmt.getFormtDateReturnMysqlFormat(fromDate), fmt.getFormtDateReturnMysqlFormat(toDate)).iterator(); iterator.hasNext();) {
                        j = (JourneyInfo) iterator.next();
                 
     
if(j!=null && j.getJourneyType().equals("return")){
     
%>
                <tr  style="font-size: 10pt;border: 1px solid black ">
                    <td><%=i%></td>
                    <%if (j.getRequistion().getRequisitionNumber() == null) {%>
                    <td>Not yet </td>
                    <%} else {%>
                    <td><%=j.getRequistion().getRequisitionNumber()%></td>
                    <%}%>
                    <td><%=j.getRequistion().getLoginUser().getLname()%>/<%=j.getRequistion().getLoginUser().getFname()%></td>
                    <td><%=j.getRequistion().getLoginUser().getDepartement().getDepartementName()%></td>
                    <td><%=j.getRequistion().getRequisitionDate()%></td>
                
                    <td><%=j.getRequistion().getDestination()%></td>
                    <td><%=j.getRequistion().getTotalDuration()%> </td>
                    
                    <td><%=j.getRequistion().getTotalMileage()%> Km</td>
                   
                    <td><%= j.getRequistion().getVehicle().getPlateNumber()%> / <%=j.getRequistion().getVehicle().getVehicleType()%></td>
                    <td><%=j.getUsers().getFname()%> /<%=j.getUsers().getLname()%></td>
                   
                </tr>
                <% i++; }
 }
                    }catch(Exception e){
                         out.println("Not able to get data try after some time");
                         out.println(e.getMessage());
                                }
                %>
                
                </tbody>
          
        </table>



    </div>
</div>


