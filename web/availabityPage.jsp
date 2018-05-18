<%@page import="computer.zone.common.DbConstant"%>
<%@page import="computer.zone.dao.impl.RequisitionImpl"%>
<%@page import="computer.zone.domain.Requisition"%>
<%@page import="computer.zone.dao.impl.VehicleImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.domain.Vehicle"%>
<ul class="m" style="font-weight: bold;list-style-type: none;   margin: 0;padding: 0;overflow: hidden; background-color: #36bcff;">
   
    <li><a class="active" href="javascript:void(0)">My Page</a></li>
  <li><a href="mainPage.jsp?view=requisition.jsp">My Requisition</a></li>
 

</ul>
<div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>Vehicle availability</center>  </div>
    <div class="panel-body">

   <form action="" method="post">
   
    <table  id="table1" class="display bg-info" border="1" style="float: left">
    <thead>
        <tr>
            <th>NUMBER</th>
            <th>Plate Number</th>
            <th>Vehicle Type</th>
            <th>Comment</th>
             <th>STATUS</th>
             <th>Request</th>
        </tr>
    </thead>
    <tbody>
        <%
        String AVAILABLE = "Available";
        String BOOKED = "Booked";
                                            Vehicle vehic = new Vehicle();
                                    
                                            VehicleImpl Veimpl = new VehicleImpl();
                                            
                                          int i=1;
                                            for (Iterator iterator = Veimpl.getListVehicle().iterator(); iterator.hasNext();) {
                                                vehic = (Vehicle) iterator.next();
                                                vehic.getVehicleType();
                                                
                                             if(vehic.getStatus().equalsIgnoreCase(AVAILABLE)){
                                                 
                                                 %>
                    <tr>
            <td><%=i%></td>
            <td><%=vehic.getPlateNumber()%></td>
            <td><%=vehic.getVehicleType()%></td>
            <td><%=vehic.getComment()%></td>
            <td><%=vehic.getStatus()%> </td>
         
         
            <td><a href="RequesterVehicleController?vehicleId=<%=vehic.getVehicleId()%>"><span style="color:#66cc00;cursor: pointer " class="glyphicon glyphicon-ok-sign">Click to Request</span></a> </td>
           
           </tr>
                                      
                                                 
                                                 
                                                 <%
                                                 i++;}
                                                }
vehic=null;
Veimpl=null;
        %>
      
    </tbody>
</table>

</form>
   
        <script>
            
            function openContent(evt, cityName,vehicleId,plate,typ) {
        document.getElementById('availabitity').style.display = "none";
        document.getElementById('vehicleId').value =vehicleId;
        document.getElementById('plate').value =plate;
        document.getElementById('typ').value =typ;
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
  
}
        </script>
</div>
 </div>


