<%@page import="computer.zone.domain.Users"%>
<%

        Users person1 = new Users();
        person1 = (Users) session.getAttribute("userSession");

%>
<div class="row">
    <div class="col-dm-4"  style="height: 40%">
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
          <li class="active"><a href="mainPage.jsp?menuPage=newRequisitions.jsp&view=sideBar.jsp">New Requisitions<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-bell"></span></a></li>
          <li class="active"><a href="mainPage.jsp?menuPage=allRequisitions.jsp&view=sideBar.jsp">All Requisitions<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-bell"></span></a></li>
       
            <li ><a href="mainPage.jsp?menuPage=journReporDriver.jsp&view=sideBar.jsp">Driver Report<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-calendar"></span></a></li>
            <%if(person1.getUserCategory().getUserCatid()==2){%>
         <li ><a href="mainPage.jsp?menuPage=RequisitionForm.jsp&view=sideBar.jsp">Request Requisition<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-asterisk"></span></a></li>
         <%}%>
         <li ><a href="mainPage.jsp?menuPage=ReportParameter.jsp&view=sideBar.jsp">Requisition Reports<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tags"></span></a></li>
             <%if(person1.getUserCategory().getUserCatid()==3){%>
         <li ><a href="mainPage.jsp?menuPage=journeyReportForm.jsp&view=sideBar.jsp">Journey Report<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-asterisk"></span></a></li>
         <%}%>
      </ul>
    </div>
  </div>
</nav>  
    </div>
    <%
         try{
    String msg=null;
    msg=request.getParameter("msg");
    if(msg==null){
    
    }else{%>
    <p class="alert-success"><%=msg%></p>
    <%}
    %>
    <div class="col-dm-8"  style="float:right;overflow-x: auto;width: 82%">
   
<%

    String pageContent4=null; 
 pageContent4=request.getParameter("menuPage");
 if(null!=pageContent4 ||!pageContent4.isEmpty()){
%>
<jsp:include page="<%=pageContent4%>"/>
<%}else{%>
<jsp:include page="newRequisitions.jsp"/>
<%}
    }catch(Exception ex){
     %>
<jsp:include page="newRequisitions.jsp"/>
<%   
    }
%>

</div>

</div>
<!--button content-->
<div class="whiteBackGround separeter">
     
</div>
  