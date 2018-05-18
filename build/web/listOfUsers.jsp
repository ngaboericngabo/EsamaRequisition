 <%@page import="computer.zone.domain.Users"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.dao.impl.UserImpl"%>
<%UserImpl users=new UserImpl(); %>
<div class="panel panel-primary" style="overflow-x: auto"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>List Of Users</center>  </div>
    <div class="panel-body">

   <form action="" method="post">
   
    <table  id="table1" class="display bg-info" border="1" style="float: left;font-size: 10pt">
    <thead>
        <tr>
            <th>N0</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Department</th>
            <th>UserName</th>
            <th>Telephone</th>
             <th>Category</th>
            <th>Account Status</th>
            <th>Lock</th>
            <th>UnLock</th>
             <th>Update</th>
        </tr>
    </thead>
    <tbody>
        <%
                Users u=new Users();
                int i=1;
        	for (Iterator iterator = users.getListUsers().iterator(); iterator.hasNext();) {
							u = (Users) iterator.next();
                  if(u.getUserCategory().getUserCatid()!=1) {                                            
        %>
        <tr>
            <td><%=i%></td>
            <td><%=u.getFname()%></td>
            <td><%=u.getLname()%></td>
                <td><%=u.getDepartement().getDepartementName()	%></td>
                <td><%=u.getUserName()%></td>
              <td><%=u.getPhone()%></td>
                <td><%= u.getUserCategory().getUsercategoryName()%></td>
            
            
                <%if(u.getStatus().equals("desactive")){%>
                <td ><p class="text-danger">Lock</p></td>
             
                <%}else{%>
                <td ><p class="text-sucess">UnLock</p></td>
                <%}%>
                
                 
                <td ><a href="UnLockUser?userId=<%=u.getUserId()%>" class="btn btn-success">UnLock</a></td>
             
               
                <td ><a href="LockUser?userId=<%=u.getUserId()%>" class="btn btn-danger">Lock</a></td>
           <td ><a href="mainPage.jsp?view=updateUsers.jsp?userId=<%=u.getUserId()%>" class="btn btn-primary glyphicon glyphicon-edit">Update</a></td>
        </tr>
<%i++;}}%>

    </tbody>
</table>

</form>
   

</div>
 </div>


