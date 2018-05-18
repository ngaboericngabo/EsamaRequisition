<%@page import="computer.zone.domain.Users"%>
<%@page import="computer.zone.dao.impl.UserImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.dao.impl.VehicleImpl"%>
<%@page import="computer.zone.domain.Vehicle"%>
<%@page import="computer.zone.dao.impl.RequisitionImpl"%>
<%@page import="computer.zone.domain.Requisition"%>
<!--Top content-- AND HERE FORM TAG AND CLOSS THE TAG AT THE END OF THE DIVI ex: <form action="controller.jsp" method ="post">-->
<%
Requisition req=new Requisition();
RequisitionImpl reqImpl=new RequisitionImpl();


String error=null;
error=request.getParameter("error");

int reqid=0;
String reqn=null;
reqn =request.getParameter("requisitionId");
if(reqn==null){}else{
         try {
                req = reqImpl.getModelWithMyHQL(new String[]{"requisitionId"}, new Object[]{Integer.parseInt(reqn)}, "from Requisition");

            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
reqid=req.getRequisitionId();
%>

<div class="whiteBackGround separeter">
   <%
   if(error!=null){
  %>
  <p class="alert-danger"><%=error%></p> 
  <%}%>
<style>
table {
    border-collapse: collapse;
    border-spacing: 1;
    width: 100%;
    border: 1px solid #ddd;
}

th, td {
    border: none;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>
<div class="sectionDiv">
  Requisition Details
</div>

<div style="overflow-x:auto;">
   <div class="jumbotron">
<table class="table table-striped">
    <tr>
        
        <td>Requisition Type</td>
        <td><%=req.getTypeOfRequest().getTypeOfRequestName()%></td>
    </tr>
    <tr>
        <td>Requisition Number</td>
        <td><p class="badge">Not Yet Generated</p></td>
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
    
    

<%}%>
</div>
</div>   
<div class="sectionDiv">
   Confirmation Section 
</div>

<form action="ApproverByTransportOfficerCntroller" method="post">
    <input name="requisitionId" type="hidden" value="<%=reqid%>">
        <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Approve Comment</label>
    <div class="col-sm-4 col-dm-4">
        <textarea class="form-control date" name="comment" rows="4" cols="20"> </textarea>
        
    </div>
    <span class="text-danger" ></span>
</div> 
        <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Cost Charged</label>
    <div class="col-sm-4 col-dm-4">
        <input type="number" name="cost" value="" class="form-control" required/>
        
    </div>
    <span class="text-danger" ></span>
</div>
        
                    <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Select Vehicle</label>
                                <div class="col-sm-4 col-dm-4">
                                    <select name="vehicleId" class="form-control"  id="productnumber">

                                        <option value="default">select Vehicle </option>
                                        <%
                                            Vehicle v = new Vehicle();
                                            VehicleImpl vImpl = new VehicleImpl();
                                            int i = 1;
                                            for (Iterator iterator = vImpl.getListVehicle().iterator(); iterator.hasNext();) {
                                                v = (Vehicle) iterator.next();
                                               
                                                if(v.getStatus().equals("Available")){

                                            %> <option value="<%=v.getVehicleId()%>"><%=v.getPlateNumber()%>/<%=v.getVehicleType()%></option>
                                        <%}}%>
                                    </select>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
                    <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Select driver</label>
                                <div class="col-sm-4 col-dm-4">
                                    <select name="driverId" class="form-control"  id="driverId">

                                        <option value="default">select driver </option>
                                        <%
                                           Users dr = new Users();
                                             UserImpl drImpl = new UserImpl();
                                            int ii = 1;
                                            for (Iterator iterator = drImpl.getListUsers().iterator(); iterator.hasNext();) {
                                                dr = (Users) iterator.next();
                                               
                                                if(dr.getUserCategory().getUserCatid()==6){

                                            %> <option value="<%=dr.getUserId()%>"><%=dr.getFname()%>/<%= dr.getLname()%>/ <%=  dr.getPhone()%></option>
                                        <%}}%>
                                    </select>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
      
   <div class="btnsection">
        
        <input type="submit" value="Approve">   
   
    </div> 
      </form>
        <form method="post" action="CancelTransReq">
     <div class="btnsection">
         
         <input type="submit" class="btn btn-danger" value="Cancel">   
   
    </div> 
        </form>

<!--button content-->
<div class="whiteBackGround separeter">
     
</div>


