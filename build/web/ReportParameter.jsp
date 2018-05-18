<form action="mainPage.jsp?menuPage=report.jsp&view=sideBar.jsp" method="post">
<div class="whiteBackGround separeter">
    <div class="jumbotron">

<div class="sectionDiv">
Requisition Report Parameter
</div>
        <div id="byDate">
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
