<%@page import="computer.zone.common.Formating"%>
<%@page import="computer.zone.domain.Requisition"%>
<%@page import="computer.zone.dao.impl.VehicleImpl"%>
<%@page import="computer.zone.dao.impl.RequisitionImpl"%>
<%@page import="computer.zone.domain.Users"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.dao.impl.UserImpl"%>



<%
    RequisitionImpl requisition = new RequisitionImpl();
 Users person1 = new Users();
        person1 = (Users) session.getAttribute("userSession");
        person1.getUserCategory().getUsercategoryName();
%>
<ul class="m" style="font-weight: bold;list-style-type: none;   margin: 0;padding: 0;overflow: hidden; background-color: #36bcff;">
 <li><a class="active" href="javascript:void(0)">Approved Requisition</a></li>
  <li><a href="mainPage.jsp?view=DriverTabs.jsp">My Page</a></li>
</ul>
<div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>Approved  Requisitions  </center>  </div>
    <div class="panel-body" style="overflow-x:auto;" >


        <table  id="table1" class="display bg-info" border="1" style="font-size: 10pt; ">
            <thead>
                <tr>
                    <th>N0</th>
                    <th>Requisition Number</th>
                    <th>Names</th>
                    <th>Requisition Date</th>
                    <th>Departure/Return Date </th>
                    <th>Departure/Return Time</th>
                    <th>Purpose</th>
                    <th>Destination</th>
                    <th>Status</th>
                    <th>Departure</th>
                    <th>Return</th>
             

                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Requisition req = new Requisition();
                       
                        Formating fmt = new Formating();
                      String reqNumber = null;
    String fromDate = null;
    String toDate = null;
    String ty = null;

    reqNumber = request.getParameter("requisitionNumber");
    fromDate = request.getParameter("fromDate");
    toDate = request.getParameter("toDate");
    ty = request.getParameter("ty");
    String querytouse = null;
    if (ty.equals("ByDate")) {
        querytouse = "byDate";

    } else {
        querytouse = "byReq";
    }
    if(querytouse.equals("byDate")){
                    int i = 1;
                    
 for (Iterator iterator = requisition.getListByDateBewteen("requisitionDate", fmt.getFormtDateReturnMysqlFormat(fromDate), fmt.getFormtDateReturnMysqlFormat(toDate)).iterator(); iterator.hasNext();) {
                        req = (Requisition) iterator.next();
                       
if (req.getDriver()!=null &&  req.getDriver().getUserId()== person1.getUserId() &&((req.getApprovalLevel()!=null && req.getApprovalLevel().getApprovalLevelId()==3&&req.getTypeOfRequest().getTypeOfRequestId()==1))||((req.getApprovalLevel()!=null &&req.getApprovalLevel().getApprovalLevelId()==2&&(req.getTypeOfRequest().getTypeOfRequestId()==2||req.getTypeOfRequest().getTypeOfRequestId()==3)))) { %>
            
<tr>
                    <td><%=i %></td>
                    <%if (req !=null && req.getRequisitionNumber() == null) {%>
                    <td>Not yet </td>
                    <%} else {%>
                    <td><%=req.getRequisitionNumber()%></td>
                    <%}%>
                    <td><%=req.getLoginUser().getLname()%>/<%=req.getLoginUser().getFname()%></td>
                    <td><%=req.getRequisitionDate()%></td>
                    <td><%=req.getRequisitionDateIn()%>/<%=req.getRequisitionDateOut()%></td>
                    <td><%=req.getRequisitionTimeIn()%>/<%=req.getRequisitionTimeOut()%></td>
                    <td><%=req.getPurpose()%></td>
                    <td><%=req.getDestination()%></td>
                    <td><%=req.getStatus()%></td>
                    <%if(req.getTotalMileage()==0){%>
                    <td ><a href="mainPage.jsp?view=RequisitionDeparture.jsp?requisitionId=<%=req.getRequisitionId()%>"> <button class="btn bg-info glyphicon-chevron-left" > Out </button></a></td>
                    <td ><a href="mainPage.jsp?view=RequisitionReturn.jsp?requisitionId=<%=req.getRequisitionId()%>"> <button class="btn btn-success glyphicon-circle-arrow-right"> Back </button></a></td>
<%  }else{%>
    <td >Closed</td>
   <td >Closed By <%=req.getTotalMileage()%> Km</td>

<%}%>
                </tr>
                <%  i++;
}} }else{
    
                        int i = 1;
                                for (Iterator iterator = requisition.getGenericListWithHQLParameter(new String[]{"requisitionNumber"}, new Object[]{reqNumber}, "Requisition").iterator(); iterator.hasNext();) {
                        req = (Requisition) iterator.next();
              
if (req.getDriver()!=null && req.getDriver().getUserId()== person1.getUserId() &&((req.getApprovalLevel()!=null && req.getApprovalLevel().getApprovalLevelId()==3&&req.getTypeOfRequest().getTypeOfRequestId()==1))||((req.getApprovalLevel()!=null && req.getApprovalLevel().getApprovalLevelId()==2&&(req.getTypeOfRequest().getTypeOfRequestId()==2||req.getTypeOfRequest().getTypeOfRequestId()==3)))) {%>
                <tr>
                    <td><%=i%></td>
                    <%if (req.getRequisitionNumber() == null) {%>
                    <td>Not yet </td>
                    <%} else {%>
                    <td><%=req.getRequisitionNumber()%></td>
                    <%}%>
                    <td><%=req.getLoginUser().getLname()%>/<%=req.getLoginUser().getFname()%></td>
                    <td><%=req.getRequisitionDate()%></td>
                    <td><%=req.getRequisitionDateIn()%>/<%=req.getRequisitionDateOut()%></td>
                    <td><%=req.getRequisitionTimeIn()%>/<%=req.getRequisitionTimeOut()%></td>
                    <td><%=req.getPurpose()%></td>
                    <td><%=req.getDestination()%></td>
                    <td><%=req.getStatus()%></td>
                        <td ><a href="mainPage.jsp?view=RequisitionDeparture.jsp?requisitionId=<%=req.getRequisitionId()%>"> <button class="btn bg-info glyphicon-chevron-left" > Out </button></a></td>
                    <td ><a href="mainPage.jsp?view=RequisitionReturn.jsp?requisitionId=<%=req.getRequisitionId()%>"> <button class="btn btn-success glyphicon-circle-arrow-right"> Back </button></a></td>

                </tr>
                <%  i++;
}}
    
    
    }
                    }catch(Exception e){
                         out.println("Not able to get data try after some time");
                         out.println(e.getMessage());
                         e.printStackTrace();
                                }
                %>
            </tbody>
        </table>



    </div>
</div>


