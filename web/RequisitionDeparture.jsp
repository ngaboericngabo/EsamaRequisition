<%@page import="java.util.Date"%>
<%@page import="computer.zone.dao.impl.RequisitionImpl"%>
<%@page import="computer.zone.domain.Requisition"%>
<!--Top content-- AND HERE FORM TAG AND CLOSS THE TAG AT THE END OF THE DIVI ex: <form action="controller.jsp" method ="post">-->
<%
    String reqId=request.getParameter("requisitionId");
Requisition req=new Requisition();
RequisitionImpl reqImpl=new RequisitionImpl();
      try {
            req = reqImpl.getModelWithMyHQL(new String[]{"requisitionId"}, new Object[]{Integer.parseInt(reqId)}, "from Requisition");
            } catch (Exception ex) {
          ex.printStackTrace();
        }
    
String error=null;
error=request.getParameter("error");
if(error==null){

}else{%>
<p class="alert-danger"><%=error%><p> 
    
<%}%>
<ul class="m" style="font-weight: bold;list-style-type: none;   margin: 0;padding: 0;overflow: hidden; background-color: #36bcff;">
 <li><a class="active" href="javascript:void(0)">Approved Requisition</a></li>
  <li><a href="mainPage.jsp?view=DriverTabs.jsp">My Page</a></li>
</ul>
<form action="DriverFormController" method="post">
<div class="whiteBackGround separeter">
    
    <center>  
        <div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>Departure Form </center>  </div>
    <div class="panel-body">

        <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Req/Number</label>
    <div class="col-sm-4 col-dm-4">
        <input type="text" value="<%=req.getRequisitionNumber()%>"    class="form-control date"  style="color: black"  disabled="true"/>
    </div>
    <span class="text-danger" ></span>
</div>
        <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Names</label>
    <div class="col-sm-4 col-dm-4">
        <input type="text" value="<%=req.getRequester().getFname()%> / <%=req.getRequester().getLname()%>"   class="form-control date"  style="color: black" disabled="true"/>
        <input name="journeyType" type="hidden" value="departure"/>
        <input name="reqId" type="hidden" value="<%=reqId%>"/>
    </div>
    <span class="text-danger" ></span>
        </div>
        </div>

</div>
    <div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>Meter Reading </center>  </div>
    <div class="panel-body">

        <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">START </label>
    <div class="col-sm-4 col-dm-4">
        <input name="startingKm" type="number"  class="form-control"  style="color: black" placeholder="Current vehicle KM"/>
    </div>
    <span class="text-danger" ></span>
</div> 
         </div>

</div>
             <div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>Duration Information </center>  </div>
    <div class="panel-body">

        <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Departure Date</label>
    <div class="col-sm-4 col-dm-4">
        <input name="departureDate" type="text" id="fromDate" value="<%=new Date()%>"  class="form-control date"  style="color: black" disabled/>
    </div>
    <span class="text-danger" ></span>
</div>
        <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Departure Time</label>
    <div class="col-sm-4 col-dm-4">
        <input name="departureTime" type="text" id="timepicker2"  class="form-control date"  style="color: black" placeholder="Departure Time"/>
    </div>
    <span class="text-danger" ></span>
        </div>
        </div>

</div>
  
        <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">COMMENT ON VEHICLE</label>
    <div class="col-sm-4 col-dm-4">
        <input name="comment" type="text"  class="form-control"  style="color: black" placeholder="COMMENT ON VEHICLE" required/>
    </div>
    <span class="text-danger" ></span>
</div> 
    <input type="submit" value="Submit">  
    
   
</div>
</div>
</center>
</div>

 
<!--button content-->
<div class="whiteBackGround separeter">
     
</div>

</form>
