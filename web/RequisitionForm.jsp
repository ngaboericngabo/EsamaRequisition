<%@page import="computer.zone.dao.impl.UserCategoryImpl"%>
<%@page import="computer.zone.dao.impl.UserImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.dao.impl.TypeOfRequestImpl"%>
<%@page import="computer.zone.domain.TypeOfRequest"%>
<%@page import="computer.zone.domain.Users"%>
<%@page import="computer.zone.dao.impl.VehicleImpl"%>
<%@page import="computer.zone.domain.Vehicle"%>
<!--Top content-- AND HERE FORM TAG AND CLOSS THE TAG AT THE END OF THE DIVI ex: <form action="controller.jsp" method ="post">-->
<%UserImpl u=new UserImpl(); %>
<%
    UserCategoryImpl uscat = new UserCategoryImpl();
%>
<ul class="m" style="font-weight: bold;list-style-type: none;   margin: 0;padding: 0;overflow: hidden; background-color: #36bcff;">
   
    <li><a class="active" href="javascript:void(0)">Requisition Form</a></li>
  <li><a href="mainPage.jsp?view=requisition.jsp">My Requisition</a></li>
 

</ul>
<form action="requestRequisitionController" method="post">
    <div class="whiteBackGround separeter">
        <%
            Vehicle veh = new Vehicle();
            VehicleImpl vehImpl = new VehicleImpl();
            TypeOfRequest tp = new TypeOfRequest();
            TypeOfRequestImpl typimpl = new TypeOfRequestImpl();
             Users person3 = new Users();
            person3 = (Users) session.getAttribute("userSession");

            
          

String error=null;
error=request.getParameter("error");
if(error==null){

}else{%>
<p class="alert-danger"><%=error%><p> 
    
<%}%>
        <div class="panel panel-primary"  >
            <!-- Default panel contents -->
            <div class="panel-heading"><center>VEHICLE REQUISITION FORM </center>  </div>
            <div class="panel-body">

                <div class="form-group row">
                    <label for="todate" class="col-sm-4 col-dm-4 control-label">Select Vehicle Use</label>
                    <div class="col-sm-4 col-dm-4">
                        <%  try {
                                for (Iterator iterator = typimpl.getListTypeOfRequest().iterator(); iterator.hasNext();) {
                                    tp = (TypeOfRequest) iterator.next();
                    
%>
                        <label class="radio-inline"><input value="<%=tp.getTypeOfRequestId()%>" type="radio" name="typeOfUse" /><%=tp.getTypeOfRequestName()%></label>
 <%}
                            } catch (Exception ex) {
                                out.println(ex.getMessage());
                            }
                        %>

                    </div>
                    <span class="text-danger" ></span>
                </div>

                <div>

                    <div class="form-group row">
                        <label for="todate" class="col-sm-4 col-dm-4 control-label">Requester Names</label>
                        <div class="col-sm-4 col-dm-4">
                            <input type="text"  value="<%=person3.getFname()%> /<%=person3.getLname()%>" class="form-control"  style="color: black"   disabled/>
                        </div>
                        <span class="text-danger" ></span>
                    </div> 
                   
                    <!-- Vehicle id-->
             

                    <span class="text-danger" ></span>
                </div>
                        
                                    
                                    <%if(person3.getUserCategory().getUserCatid()==2){%>
                                      <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Select Director </label>
                                <div class="col-sm-4 col-dm-4">
                                    <select name="selectSupervisor" class="form-control"  id="productnumber">

                                        <option value="default">Select Director </option>
                                        <%
                                            Users us = new Users();
                                            
                                            for (Iterator iterator = u.getListUsers().iterator(); iterator.hasNext();) {
                                                us = (Users) iterator.next();
                                                
                                               if(us.getUserCategory().getUserCatid()==4){
                                     

                                            %> <option value="<%=us.getUserId()%>"><%=us.getFname()%> <%=us.getLname()%></option>
                                        <%}}%>
                                    </select>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
<%}else{%>
 <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Select Supervisor</label>
                                <div class="col-sm-4 col-dm-4">
                                    <select name="selectSupervisor" class="form-control"  id="productnumber">

                                        <option value="default">Select Supervisor </option>
                                        <%
                                            Users us = new Users();
                                            
                                            
                                            for (Iterator iterator = u.getListUsers().iterator(); iterator.hasNext();) {
                                                us = (Users) iterator.next();
                                                
                                               if(us.getUserCategory().getUserCatid()==2){
                                     

                                            %> <option value="<%=us.getUserId()%>"><%=us.getFname()%> <%=us.getLname()%></option>
                                        <%}}%>
                                    </select>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
<%}%>
                <div class="form-group row">
                    <label for="todate" class="col-sm-4 col-dm-4 control-label">Destination</label>
                    <div class="col-sm-4 col-dm-4">
                        <input name="destination" type="text"  class="form-control date"  style="color: black" placeholder="Enter Destionation" required/>
                    </div>
                    <span class="text-danger" ></span>
                </div> 
                <div class="form-group row">
                    <label for="todate" class="col-sm-4 col-dm-4 control-label">Purpose</label>
                      <div class="col-sm-4 col-dm-4">
        <textarea class="form-control date" name="purpose" rows="4" cols="20"> </textarea>
        
                                                </div>

                    <span class="text-danger" ></span>
                </div> 

                <div class="panel panel-primary"  >
                    <!-- Default panel contents -->
                    <div class="panel-heading"><center>Duration Information </center>  </div>
                    <div class="panel-body">

                        <div class="form-group row">
                            <label for="todate" class="col-sm-4 col-dm-4 control-label">Departure Date</label>
                            <div class="col-sm-4 col-dm-4">
                                <input name="dateIn" id="toDate" type="text"  class="form-control date"  style="color: black" autocomplete="off" required/>
                            </div>
                            <span class="text-danger" ></span>
                        </div>
                        <div class="form-group row">
                            <label for="todate" class="col-sm-4 col-dm-4 control-label">Departure Time</label>
                            <div  class="col-sm-4 col-dm-4 bootstrap-timepicker timepicker">
                                <input name="timeIn" id="timepicker1" type="text" class="form-control" autocomplete="off" required/>

                            </div>
                            <span class="text-danger" ></span>
                        </div>


                        <div class="form-group row">
                            <label for="todate" class="col-sm-4 col-dm-4 control-label">Returning  Date</label>
                            <div class="col-sm-4 col-dm-4">
                                <input name="dateOut" id="fromDate" type="text"  class="form-control date"  style="color: black" autocomplete="off" required/>
                            </div>
                            <span class="text-danger" ></span>
                        </div>
                        <div class="form-group row">
                            <label for="todate" class="col-sm-4 col-dm-4 control-label">Returning Time</label>
                            <div  class="col-sm-4 col-dm-4 bootstrap-timepicker timepicker">
                                <input name="timeOut" id="timepicker2" type="text" class="form-control" autocomplete="off" required/>

                            </div>
                            <span class="text-danger" ></span>
                        </div> 

                    </div>

                </div>




                <input type="submit" value="Submit">  

            </div>
        </div>

    </div>

</form>
<!--button content-->
<div class="whiteBackGround separeter">

</div>


