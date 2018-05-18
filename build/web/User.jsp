<%@page import="computer.zone.dao.impl.UserImpl"%>
<%@page import="computer.zone.domain.Users"%>
<%@page import="computer.zone.domain.Departement"%>
<%@page import="computer.zone.dao.impl.DepartementImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.domain.UserCategory"%>
<%@page import="computer.zone.dao.impl.UserCategoryImpl"%>
<!--Top content-- AND HERE FORM TAG AND CLOSS THE TAG AT THE END OF THE DIVI ex: <form action="controller.jsp" method ="post">-->

<%UserImpl users=new UserImpl(); %>
<%
    UserCategoryImpl uscat = new UserCategoryImpl();
  
%>
<form action="UserController" method="post">
    <div class="whiteBackGround separeter">
        <div class="panel panel-primary"  >
            <!-- Default panel contents -->
            <div class="panel-heading"><center>ENTER USER INFORMATION </center>  </div>
            <div class="panel-body">    <center>  <div>

                        <div class="login-form">
                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">First Name</label>
                                <div class="col-sm-4 col-dm-4">
                                    <input type="text" name="fname"  class="form-control date"  style="color: black" placeholder="Enter First Name" required/>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Last Name</label>
                                <div class="col-sm-4 col-dm-4">
                                    <input type="text" name="lname" class="form-control"  style="color: black" placeholder="Enter Last Name" required/>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Email</label>
                                <div class="col-sm-4 col-dm-4">
                                    <input type="email" name="email"  class="form-control"  style="color: black" placeholder="Enter E-mail"/>
                                </div>
                                <span class="text-danger" ></span>
                            </div> 
                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Address</label>
                                <div class="col-sm-4 col-dm-4">
                                    <input type="text" name="address"  class="form-control"  style="color: black" placeholder="Enter Address" required/>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Phone</label>
                                <div class="col-sm-4 col-dm-4">
                                    <input type="number" name="phone"  class="form-control date"  style="color: black" placeholder="Enter Number"/>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">User Name</label>
                                <div class="col-sm-4 col-dm-4">
                                    <input type="text" name="userName" class="form-control date"  style="color: black" placeholder="Enter User Name"/>
                                </div>
                                <span class="text-danger" ></span>
                            </div>

                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Password</label>
                                <div class="col-sm-4 col-dm-4">
                                    <input name="password" type="text" value="pass123" class="form-control date"  style="color: black" placeholder="pass123" disabled/>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Select Category</label>
                                <div class="col-sm-4 col-dm-4">
                                    <select name="userCategory" class="form-control"  id="productnumber">

                                        <option value="default">select User Category </option>
                                        <%
                                            UserCategory ucat = new UserCategory();
                                            int i = 1;
                                            for (Iterator iterator = uscat.getListUsercategory().iterator(); iterator.hasNext();) {
                                                ucat = (UserCategory) iterator.next();
                                               
                                                if(ucat.getUserCatid()!=1 || ucat.getUserCatid()!=4 || ucat.getUserCatid()!=3)

                                            %> <option value="<%=ucat.getUserCatid()%>"><%=ucat.getUsercategoryName()%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
                                     <div class="form-group row">
                            <label for="todate" class="col-sm-4 col-dm-4 control-label">Department</label>
                            <div class="col-sm-4 col-dm-4">
                                <select name="departement" class="form-control"  id="productnumber">
                                    <option value="default">Select Department</option>
                                   <%
                                            DepartementImpl reqimpl= new DepartementImpl();
                                            Departement did= new Departement();
                                          
                                            for (Iterator iterator = reqimpl.getListDepartment().iterator(); iterator.hasNext();) {
                                                did = (Departement) iterator.next();
                                               
                                           
                                            %> <option value="<%=did.getDepartementId()%>"><%= did.getDepartementName()%></option>
                                        <%}%>
                                </select>
                            </div>
                            <span class="text-danger" ></span>
                        </div>

                            <input type="submit" value="Save User">  

                        </div>
                    </div>
                </center>
            </div>
            <!--button content-->
            <div class="whiteBackGround separeter">

            </div>
        </div>

    </div>
</form>
<div class="panel panel-primary"  style="overflow-x: auto">
    <!-- Default panel contents -->
    <div class="panel-heading"><center>List of Users</center>  </div>
    <div class="panel-body">

        <form action="" method="post">

            <table  id="table1" class="display bg-info" border="1" style="float: left;font-size: 10pt">
    <thead>
        <tr>
            <th>N0</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>UserName</th>
            <th>Telephone</th>
            <th>Address</th>
            <th>Category</th>
            <th>Login Status</th>
        </tr>
    </thead>
    <tbody>
        <%
                Users u=new Users();
                int ii=1;
        	for (Iterator iterator = users.getListUsers().iterator(); iterator.hasNext();) {
								u = (Users) iterator.next();
                                                               
        %>
        <tr>
            <td><%=ii%></td>
            <td><%=u.getFname()%></td>
            <td><%=u.getLname()%></td>
                <td><%=u.getUserName()%></td>
                <td><%=u.getAddress()%></td>
                <td><%=u.getAddress()%></td>
                <td><%= u.getUserCategory().getUsercategoryName()%></td>
                <td><%= u.getLoginStatus()%></td>
            
        </tr>
<%ii++;}%>

    </tbody>
</table>

        </form>


    </div>
</div>