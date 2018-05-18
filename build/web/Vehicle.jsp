<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.domain.Vehicle"%>
<%@page import="computer.zone.dao.impl.VehicleImpl"%>
<!--Top content-- AND HERE FORM TAG AND CLOSS THE TAG AT THE END OF THE DIVI ex: <form action="controller.jsp" method ="post">-->
<%VehicleImpl vehlImpl=new VehicleImpl(); %>
<%
    VehicleImpl vehImpl = new VehicleImpl();
%>
<form action="VehicleController" method="post">
    
<div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>Set Vehicle Details </center>  </div>
    <div class="panel-body">



    
    <center>  <div>

       <div class="login-form">
    <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Vehicle Type</label>
    <div class="col-sm-4 col-dm-4">
        <input name="vehicletype" type="text"  class="form-control date"  style="color: black" placeholder="Enter Vehicle Type"/>
    </div>
    
    <span class="text-danger" ></span>
</div>
        <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Plate No</label>
    <div class="col-sm-4 col-dm-4">
        <input name="plateno" type="text"  class="form-control date"  style="color: black" placeholder="Enter Plate No"/>
    </div>
    
    <span class="text-danger" ></span>
</div>    
   
   
      <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Comment</label>
    <div class="col-sm-4 col-dm-4">
        <input name="comment" type="text"  class="form-control date"  style="color: black" placeholder="Enter Comment"/>
    </div>
    
    <span class="text-danger" ></span>
</div>     
           
    <input type="submit" value="Save">  
    
           </div>
</div>
</center>
</div>

 
<!--button content-->
     
</div>

</form>
<div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>List of Vehicles</center>  </div>
    <div class="panel-body">

        <form action="" method="post">

            <table  id="table5" class="display bg-info" border="1" style="float: left">
                <thead>
                    <tr>
                        <th>NUMBER</th>
                        <th>Vehicle Type</th>
                        <th>Plate No</th>
                        <th>Status</th>
                        <th>Comment</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                Vehicle veh=new Vehicle();
                int i=1;
        	for (Iterator iterator = vehlImpl.getListVehicle().iterator(); iterator.hasNext();) {
								veh = (Vehicle) iterator.next();
                          
        %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=veh.getVehicleType()%></td>
                        <td><%=veh.getPlateNumber()%></td>
                        <td><%=veh.getStatus()%></td>
                        <td><%=veh.getComment()%></td>
                    </tr>
                 
<%i++;}%>
                </tbody>
            </table>

        </form>


    </div>
</div>