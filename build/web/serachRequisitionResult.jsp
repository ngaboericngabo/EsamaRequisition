<%@page import="computer.zone.common.Formating"%>
<%@page import="computer.zone.domain.Requisition"%>
<%@page import="computer.zone.dao.impl.VehicleImpl"%>
<%@page import="computer.zone.dao.impl.RequisitionImpl"%>
<%@page import="computer.zone.domain.Users"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.dao.impl.UserImpl"%>



<%
    RequisitionImpl requisition = new RequisitionImpl();

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
%>

<div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>List  Requisitions  </center>  </div>
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
                    <th>Approve</th>
                    <th>Reject</th>

                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Requisition req = new Requisition();
                        Users person5 = new Users();
                        person5 = (Users) session.getAttribute("userSession");
                        person5.getUserId();
                        Formating fmt = new Formating();
                        if (querytouse.equals("byDate")) {//Serching by date
                               out.println("Searchin By Date from "+fromDate +" To "+toDate);
                            if (person5.getUserCategory().getUserCatid() == 2) {
                                int i = 1;

                                for (Iterator iterator = requisition.getListByDateBewteen("requisitionDate", fmt.getFormtDateReturnMysqlFormat(fromDate), fmt.getFormtDateReturnMysqlFormat(toDate)).iterator(); iterator.hasNext();) {
                                    req = (Requisition) iterator.next();
                                    /*Supervisor*/ if ((req.getApprovalLevel() == null) && (person5.getDepartement().getDepartementId() == req.getRequester().getDepartement().getDepartementId()) && req.getRequester().getUserCategory().getUserCatid() == 5) {
                %>
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
                    <td ><a href="supervisorApproverController?requisitionId=<%=req.getRequisitionId()%>"><button style="background-color: #033c73; color: white"> Approve </button></a></td>
                    <td ><a href="allRejections?requisitionId=<%=req.getRequisitionId()%>"><button style="background-color: #ff6666; color: white"> Reject</button></a></td>
                </tr>

                <%i++;
                        }
                    }
                } else if ((person5.getUserCategory().getUserCatid() == 3)) {
                    int i = 1;
 for (Iterator iterator = requisition.getListByDateBewteen("requisitionDate", fmt.getFormtDateReturnMysqlFormat(fromDate), fmt.getFormtDateReturnMysqlFormat(toDate)).iterator(); iterator.hasNext();) {
                        req = (Requisition) iterator.next();
                           // out.println("jjjjjjjjjjjjjjjj"+req.getApprovalLevel().getLevelNumber());
/*Transport Officer*/ if ((req.getStatus().equals("In Progress")) ) {%>
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
                    <td ><a href="ApproverForm_TransportController?requisitionId=<%=req.getRequisitionId()%>"> <button style="background-color: #033c73; color: white"> Approve </button></a></td>
                    <td ><a href="allRejections?requisitionId=<%=req.getRequisitionId()%>"><button style="background-color: #ff6666; color: white"> Reject</button></a></td>
                </tr>
                <%  i++;
                        }else{
      
            }
                    }
                } else if ((person5.getUserCategory().getUserCatid() == 4)) {
                    int i = 1;
                    for (Iterator iterator = requisition.getListByDateBewteen("requisitionDate", fmt.getFormtDateReturnMysqlFormat(fromDate), fmt.getFormtDateReturnMysqlFormat(toDate)).iterator(); iterator.hasNext();) {
                        req = (Requisition) iterator.next();
                    
                 /*TDirector*/ if ((req.getApprovalLevel() == null) && (person5.getDepartement().getDepartementId() == req.getRequester().getDepartement().getDepartementId()) && req.getRequester().getUserCategory().getUserCatid() == 2) {%>
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
                    <td ><a href="ApproverForm_DirectorController?requisitionId=<%=req.getRequisitionId()%>"> <button style="background-color: #033c73; color: white"> Approve </button></a></td>
                    <td ><a href="allRejections?requisitionId=<%=req.getRequisitionId()%>"><button style="background-color: #ff6666; color: white"> Reject</button></a></td>
                </tr>
                <%  i++;
                                }
                            }
                        }
                            
                            //Searching By requisition Number
                        }else{
                            out.println("Searchin By Requisition Number");
  
                                int i = 1;

                                for (Iterator iterator = requisition.getGenericListWithHQLParameter(new String[]{"requisitionNumber"}, new Object[]{reqNumber}, "Requisition").iterator(); iterator.hasNext();) {
                                    req = (Requisition) iterator.next();

                %>
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
                     <td><%=req.getApprovalLevel().getLevelName()%></td>
                         <td>-</td>
                </tr>

                <%i++;
                        }
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


