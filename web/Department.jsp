<%@page import="computer.zone.domain.Departement"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.dao.impl.DepartementImpl"%>
<!--Top content-- AND HERE FORM TAG AND CLOSS THE TAG AT THE END OF THE DIVI ex: <form action="controller.jsp" method ="post">-->
<%
    DepartementImpl us = new DepartementImpl();
%>
<form action="DepartmentController" method="post">
    
<div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>Set Department </center>  </div>
    <div class="panel-body">

  

    
    <center>  
       <div class="login-form">
    <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Name</label>
    <div class="col-sm-4 col-dm-4">
        <input name="departement" type="text"  class="form-control date"  style="color: black" placeholder="Enter Name of Department"/>
    </div>
    <span class="text-danger" ></span>
</div>
           
    <input type="submit" value="Save">  
    
           </div>

</center>
</div>

 
<!--button content-->

     
</div>
 


</form>

<div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>List of Departments</center>  </div>
    <div class="panel-body">

        <form action="" method="post">

           <table  id="table6" class="display bg-info" border="1" style="float: left">
                <thead>
                    <tr>
                        <th>NUMBER</th>
                        <th>Department</th>
                        <th>Status</th>
                        
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                Departement dep=new Departement();
                int ii=1;
        	for (Iterator iterator = us.getListDepartment().iterator(); iterator.hasNext();) {
								dep = (Departement) iterator.next();
                          
        %>
                    <tr>
                        <td><%=ii%></td>
                        <td><%=dep.getDepartementName()%></td>
                        <td ><button style="background-color: #033c73; color: white"> Unlocked </button></td>
                        
                    </tr>
                 
<%ii++;}%>
                </tbody>
            </table>

        </form>


    </div>
</div>