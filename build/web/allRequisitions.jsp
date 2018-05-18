
<form action="mainPage.jsp?menuPage=serachRequisitionResult.jsp&view=sideBar.jsp" method="post">
<div class="whiteBackGround separeter">
    <div class="jumbotron">
        
        <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Search By</label>
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
