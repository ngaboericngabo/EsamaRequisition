


  <%
  String msg=null;
  String error=null;
  msg=request.getParameter("msg");
  error=request.getParameter("error");
  if(msg!=null){
  %>
  <p class="alert-success"><%=msg%></p>
  <%}
  if(error!=null){
  %>
  <p class="alert-danger" ><%=error%></p>
  <%}%>
  
<!--Top content-- AND HERE FORM TAG AND CLOSS THE TAG AT THE END OF THE DIVI ex: <form action="controller.jsp" method ="post">-->

<div class="row" style="position: initial">
    <div class="col-dm-4"  style="height: 40%;width: 20%">
 <nav class="navbar navbar-default sidebar" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>      
    </div>
    <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li class="active"><a href="mainPage.jsp?menuPage=listOfUsers.jsp&view=AdminPage.jsp">List Of users<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
          <li ><a href="mainPage.jsp?menuPage=NewEntry.jsp&view=AdminPage.jsp" style="background-color: #ff6600">Setting <span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-asterisk"></span></a></li>
 </ul>
    </div>
  </div>
</nav>  
    </div>
    <div class="col-dm-8"  style="float:right;width: 80%;">
   
<%
 try{
    String pageContent1=null; 
 pageContent1=request.getParameter("menuPage");

 if(null==pageContent1 ){
%>
<jsp:include page="listOfUsers.jsp"/>
<%}else if(pageContent1.equals("NewEntry.jsp")){%>
<jsp:include page="NewEntry.jsp"/>
<%}else if(pageContent1.equals("listOfUsers.jsp")){%>
<jsp:include page="listOfUsers.jsp"/>
<%}
else{
%><%
}
    }catch(Exception ex){
     %>

<%   
    }
%>

</div>

</div>
<!--button content-->
<div class="whiteBackGround separeter">
     
</div>

