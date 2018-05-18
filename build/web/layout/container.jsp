<!--Form heading -->
<div class="formHeadingDiv">
    Request Appointment Form 
</div>
<!--Form heading In panel -->
<div class="formHeadingDivPanel">
    Request Appointment Form 
</div>

<!--Section div-->
<div class="sectionDiv">
    Section Details 
</div>

<!--===========Form data (Inputs) ================= -->
<!--1.Inputs  type Text-->
<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">LABEL NAME</label>
    <div class="col-sm-4 col-dm-4">
        <input type="text"  class="form-control date"  style="color: black" placeholder="Lebel name"/>
    </div>
    <span class="text-danger" ></span>
</div> 
<!--1.Inputs  type Text required-->
<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">LABEL NAME required</label>
    <div class="col-sm-4 col-dm-4">
        <input type="text"  class="form-control"  style="color: black" placeholder="Lebel name" required/>
    </div>
    <span class="text-danger" ></span>
</div> 
<!--1.Inputs  type Text With rejex pattern-->
<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">LABEL NAME REJEX VALIDATION</label>
    <div class="col-sm-4 col-dm-4">
        <input type="text" pattern="[A-Za-z]{3}" class="form-control" style="color: black" name="countryCoode"  title="Three letter country code">

    </div>
    <span class="text-danger" ></span>
</div> 

<!--2.Inputs  type Time-->
 <div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Time</label>
 <div  class="col-sm-4 col-dm-4 bootstrap-timepicker timepicker">
            <input id="timepicker1" type="text" class="form-control">
          
        </div>
</div> 
       
<!--2.Inputs  type Date -->
<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Date</label>
    <div class="col-sm-4 col-dm-4">
        <input id="fromDate" type="date"  class="form-control date"  style="color: black"/>
    </div>
    <span class="text-danger" ></span>
</div> 
<!--2.Inputs  type Date min="2000-01-02" -->

<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Date min 2000-01-02</label>
    <div class="col-sm-4 col-dm-4">
        <input id="toDate" type="date"  class="form-control date"  style="color: black" min="2000-01-02"/>
    </div>
    <span class="text-danger" ></span>
</div> 
<!--2.Inputs  type Date  max="1979-12-31-->

<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Date max 1979-12-31</label>
    <div class="col-sm-4 col-dm-4">
        <input id="otherDate1" type="date"  class="form-control date"  style="color: black"  max="1979-12-31"/>
    </div>
    <span class="text-danger" ></span>
</div> 
<!--2.Inputs  type Date  max="1979-12-31 AND MIN-->

<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Date max 1979-12-31 AND MIN</label>
    <div class="col-sm-4 col-dm-4">
        <input id="otherDate2" type="date"  class="form-control date"  style="color: black"  min="2000-01-02"  max="1979-12-31"/>
    </div>
    <span class="text-danger" ></span>
</div> 

<!--3.Inputs  type Email-->

<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Email</label>
    <div class="col-sm-4 col-dm-4">
        <input type="email"  class="form-control"  style="color: black"/>
    </div>
    <span class="text-danger" ></span>
</div> 


<!--4.Inputs  type Number-->
<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">LABEL Number</label>
    <div class="col-sm-4 col-dm-4">
        <input type="number"  class="form-control"  style="color: black"/>
    </div>
    <span class="text-danger" ></span>
</div> 
<!--4.Inputs  type Number  min="1" max="5"-->
<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">LABEL Number max and min</label>
    <div class="col-sm-4 col-dm-4">
        <input type="number"  class="form-control"  style="color: black"  min="1" max="5"/>
    </div>
    <span class="text-danger" ></span>
</div> 

<!--5.Inputs  type text Disabled-->
<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">LABEL DISABLED</label>
    <div class="col-sm-4 col-dm-4">
        <input type="text"  class="form-control"  style="color: black" disabled/>
    </div>
    <span class="text-danger" ></span>
</div> 
<!--6.Inputs  type text readonly-->
<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">LABEL DISABLED</label>
    <div class="col-sm-4 col-dm-4">
        <input type="text"  class="form-control"  style="color: black" readonly/>
    </div>
    <span class="text-danger" ></span>
</div> 
<!--6.Inputs  type text Maximum size-->
<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">LABEL size</label>
    <div class="col-sm-4 col-dm-4">
        <input type="text"  class="form-control"  style="color: black" size="40"/>
    </div>
    <span class="text-danger" ></span>
</div> 
<!--6.Inputs  type text max length-->
<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">LABEL max length</label>
    <div class="col-sm-4 col-dm-4">
        <input type="text"  class="form-control"  style="color: black" maxlength="10"/>
    </div>
    <span class="text-danger" ></span>
</div> 


<!--===========================Select option ===============--->
<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Select Name</label>
    <div class="col-sm-4 col-dm-4">
        <select name="selectName" class="form-control"  id="productnumber">
            <option value="default">select Name </option>
            <option value="">select Name2</option>
        </select>
    </div>
    <span class="text-danger" ></span>
</div>

<!--===========================Radio checkbox===============--->

<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Select Option</label>
    <div class="col-sm-4 col-dm-4">
        <label class="checkbox-inline"><input type="checkbox" value="">Option 1</label>
        <label class="checkbox-inline"><input type="checkbox" value="">Option 2</label>
        <label class="checkbox-inline"><input type="checkbox" value="">Option 3</label>

    </div>
    <span class="text-danger" ></span>
</div>
<!--===========================Radio radio===============--->

<div class="form-group row">
    <label for="todate" class="col-sm-4 col-dm-4 control-label">Select Option</label>
    <div class="col-sm-4 col-dm-4">
        <label class="radio-inline"><input type="radio" name="optradio">Option 1</label>
        <label class="radio-inline"><input type="radio" name="optradio">Option 2</label>
        <label class="radio-inline"><input type="radio" name="optradio">Option 3</label>
    </div>
    <span class="text-danger" ></span>
</div>

<!--------==========Table======================---------->
<table  id="table1" class="display bg-info" border="1">
    <thead>
        <tr>
            <th>NUMBER</th>
            <th>purpose</th>
            <th>Destination</th>
            <th>Requested date</th>
            <th>Requested by</th>
            <th>Approved by</th>
            <th>STATUS</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1 </td>
            <td>Gusura</td>
            <td>Kigali</td>
            <td>2017-4-4 </td>
            <td>Ngabo eric</td>
            <td>Pending </td>
            <td><a onclick=""  ><span style="color:red;cursor: pointer " class="glyphicon glyphicon-remove">Not yet Approved</span></a> </td>
        </tr>
        <tr>
            <td>2 </td>
            <td>Gusura</td>
            <td>Kigali</td>
            <td>2017-4-4 </td>
            <td>Ngabo eric</td>
            <td>Pending </td>
            <td><a onclick=""  ><span style="color:red;cursor: pointer " class="glyphicon glyphicon-remove">Not yet Approved</span></a> </td>
        </tr>

    </tbody>
</table>

<!-----===========Tab Panel 1----------->

<div class="panel panel-primary"  >
    <!-- Default panel contents -->
    <div class="panel-heading"><center>INFORMATION </center>  </div>
    <div class="panel-body">

    </div>

</div>

<!---============BUTTON==============----->
   <div class="btnsection">
        <input type="button" value="Button">
        <input type="reset" value="Reset">
        <input type="submit" value="Save">   
        <input class="cancelBtn" type="button" value="Cancel">   
    </div>  