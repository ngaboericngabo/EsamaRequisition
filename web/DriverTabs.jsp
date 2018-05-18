<!DOCTYPE html>
<html>
<head>
<style>
body {font-family: "Lato", sans-serif;}

/* Style the tab */
div.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #ace5fb;
}

/* Style the buttons inside the tab */
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
div.tab button.active {
    background-color: #ff6600;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ff6600;
    border-top: none;
    table-layout: auto;
}
</style>
</head>
<body>
<%
String msg=null;
msg=request.getParameter("msg");
if(msg==null){

}else{%>
<p class="alert-success"><%=msg%><p> 
    
<%}%>
<ul class="m" style="font-weight: bold;list-style-type: none;   margin: 0;padding: 0;overflow: hidden; background-color: #36bcff;">
   
   <li><a class="active" href="javascript:void(0)">My Page</a></li>
  <li><a href="mainPage.jsp?view=DriverReport.jsp">Report</a></li>
 

</ul>

    <form action="mainPage.jsp?view=DriverFillNeed.jsp" method="post">

<div class="whiteBackGround separeter">
    <div class="jumbotron">
        
        <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Search Requisition By</label>
    <div class="col-sm-4 col-dm-4">
        <label class="radio-inline"><input name="ty" value="ByDate" onclick="showBydate()" type="radio" >By Date</label>
        <label class="radio-inline"><input name="ty" value="ByNumber" onclick="showByRequisition()" type="radio" >Requisition Number</label>
      
    </div>
    <span class="text-danger" ></span>
</div>
        <div id="byDate" style="display: none">
            <div class="form-group row">
                            <label for="todate" class="col-sm-4 col-dm-4 control-label">From</label>
                            <div class="col-sm-4 col-dm-4">
                                <input name="fromDate" id="fromDate" type="text"  class="form-control date"  style="color: black" autocomplete="off" />
                            </div>
                            <span class="text-danger" ></span>
                        </div>
            <div class="form-group row">
                            <label for="todate" class="col-sm-4 col-dm-4 control-label">TO</label>
                            <div class="col-sm-4 col-dm-4">
                                <input name="toDate" id="toDate" type="text"  class="form-control date"  style="color: black" autocomplete="off" />
                            </div>
                            <span class="text-danger" ></span>
                        </div>
        </div>
        
        <div id="byRequistion" style="display: none">
            <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Requisition Number</label>
    <div class="col-sm-4 col-dm-4">
        <input type="text" name="requisitionNumber"  class="form-control date"  style="color: black" placeholder="Requisition Number"/>
    </div>
    <span class="text-danger" ></span>
</div> 
        </div>
        
    </div>
   

</div>

 
<!--button content-->
<div class="whiteBackGround separeter">
         <div class="btnsection">
        <input type="submit" value="Search"> 
         <input type="reset" value="Reset">
</div>
</div>

</form>

</body>
</html> 
