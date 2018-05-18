<%@page import="computer.zone.dao.impl.JourneyInfoImpl"%>
<%@page import="computer.zone.domain.JourneyInfo"%>
<%@page import="computer.zone.common.Formating"%>
<%@page import="computer.zone.domain.Requisition"%>
<%@page import="computer.zone.dao.impl.VehicleImpl"%>
<%@page import="computer.zone.dao.impl.RequisitionImpl"%>
<%@page import="computer.zone.domain.Users"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.dao.impl.UserImpl"%>



<%
   String  fromDate = request.getParameter("fromDate");
    String toDate = request.getParameter("toDate");
%>
<ul class="m" style="font-weight: bold;list-style-type: none;   margin: 0;padding: 0;overflow: hidden; background-color: #36bcff;">
 <li><a class="active" href="javascript:void(0)">Approved Requisition</a></li>
  <li><a href="mainPage.jsp?view=DriverTabs.jsp">My Page</a></li>
</ul>
<div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>Journey  of  Requisitions Report from <%=fromDate%> to <%=toDate%>  </center>  </div>
    <div class="panel-body" style="overflow-x:auto;" >


        <table  id="table1" class="display bg-info" border="1" style="font-size: 10pt; ">
            <thead>
                <tr>
                    <th>N0</th>
                    <th>Requisition Number</th>
                    <th>Names</th>
                    <th>Requisition Date</th>
                    <th>Journey Departure/Return Date </th>
                    <th>Journey Type</th>
                    <th>total Mileage/out and In</th>
                    
             

                </tr>
            </thead>
            <tbody>
                <%
                    try {
                       
                       JourneyInfo j = new JourneyInfo();
                       JourneyInfoImpl jImpl = new JourneyInfoImpl();
             Formating fmt=new Formating();

       Users person1 = new Users();
        person1 = (Users) session.getAttribute("userSession");
  
int i=1;
 
 for (Iterator iterator = jImpl.getListByDateBewteenOtherCriteria("recordingDate", fmt.getFormtDateReturnMysqlFormat(fromDate), fmt.getFormtDateReturnMysqlFormat(toDate),new String[]{"users"}, new Object[]{person1}).iterator(); iterator.hasNext();) {
                        j = (JourneyInfo) iterator.next();
                  
%>
                <tr>
                    <td><%=i%></td>
                    <%if (j.getRequistion().getRequisitionNumber() == null) {%>
                    <td>Not yet </td>
                    <%} else {%>
                    <td><%=j.getRequistion().getRequisitionNumber()%></td>
                    <%}%>
                    <td><%=j.getRequistion().getLoginUser().getLname()%>/<%=j.getRequistion().getLoginUser().getFname()%></td>
                    <td><%=j.getRequistion().getRequisitionDate()%></td>
                    <td><%=j.getBeginningDate()%>/<%=j.getBeginningTime()%></td>
                    <td><%=j.getJourneyType()%></td>
                    <td><%=j.getRequistion().getTotalMileage()%> Km</td>
                   
                </tr>
                <% } i++;

                    }catch(Exception e){
                         out.println("Not able to get data try after some time");
                         out.println(e.getMessage());
                                }
                %>
            </tbody>
        </table>



    </div>
</div>


