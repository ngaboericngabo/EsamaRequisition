<%@page import="computer.zone.dao.impl.UserImpl"%>
<%@page import="computer.zone.domain.Users"%>
<%@page import="computer.zone.domain.Departement"%>
<%@page import="computer.zone.dao.impl.DepartementImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="computer.zone.domain.UserCategory"%>
<%@page import="computer.zone.dao.impl.UserCategoryImpl"%>
<!--Top content-- AND HERE FORM TAG AND CLOSS THE TAG AT THE END OF THE DIVI ex: <form action="controller.jsp" method ="post">-->

<%
    UserImpl usersImp=new UserImpl(); 
    Users us=new Users();
    UserCategoryImpl uscat = new UserCategoryImpl();
    String userId=request.getParameter("userId");
          try {
              
            us = usersImp.getModelWithMyHQL(new String[]{"userId"}, new Object[]{Integer.parseInt(userId)}, "from Users");
        } catch (Exception ex) {
            ex.printStackTrace();
           
        } 
%>
<form action="UpadateUser" method="post">
    <div class="whiteBackGround separeter">
        <div class="panel panel-primary"  >
            <!-- Default panel contents -->
            <div class="panel-heading"><center>UPDATE USER INFORMATION </center>  </div>
            <div class="panel-body">    <center>  <div>

                        <div class="login-form">
                            <input style="display: none" type="text" name="userId"  value="<%=userId%>"/>
                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">First Name</label>
                                <div class="col-sm-4 col-dm-4">
                                    <input type="text" name="fname"  value="<%=us.getFname()%>" class="form-control date"  style="color: black" placeholder="Enter First Name" required/>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Last Name</label>
                                <div class="col-sm-4 col-dm-4">
                                    <input type="text" name="lname"  value="<%=us.getLname()%>"class="form-control"  style="color: black" placeholder="Enter Last Name" required/>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Email</label>
                                <div class="col-sm-4 col-dm-4">
                                    <input type="email" name="email"  value="<%=us.getEmail()%>" class="form-control"  style="color: black" placeholder="Enter E-mail"/>
                                </div>
                                <span class="text-danger" ></span>
                            </div> 
                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Address</label>
                                <div class="col-sm-4 col-dm-4">
                                    <input type="text" name="address" value="<%=us.getAddress()%>"  class="form-control"  style="color: black" placeholder="Enter Address" required/>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">Phone</label>
                                <div class="col-sm-4 col-dm-4">
                                    <input type="number" name="phone" value="<%=us.getPhone()%>"  class="form-control date"  style="color: black" placeholder="Enter Number"/>
                                </div>
                                <span class="text-danger" ></span>
                            </div>
                            <div class="form-group row">
                                <label for="todate" class="col-sm-4 col-dm-4 control-label">User Name</label>
                                <div class="col-sm-4 col-dm-4">
                                    <input type="text" name="userName" value="<%=us.getUserName()%>"class="form-control date"  style="color: black" placeholder="Enter User Name"/>
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

                                        <option value="<%= us.getUserCategory().getUserCatid()%>"><%= us.getUserCategory().getUsercategoryName()%></option>
                                        <%
                                       
                                            UserCategory ucat = new UserCategory();
                                            int i = 1;
                                            for (Iterator iterator = uscat.getListUsercategory().iterator(); iterator.hasNext();) {
                                                ucat = (UserCategory) iterator.next();
                                               
                                                if(ucat.getUserCatid()!=1 || ucat.getUserCatid()!=3 ||ucat.getUserCatid()!=4)

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
                                    <option value="<%= us.getDepartement().getDepartementId()%>"><%= us.getDepartement().getDepartementName()%></option>
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

                            <input type="submit" value="Update User">  

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

 