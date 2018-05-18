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



<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'London')">User</button>

  <button class="tablinks" onclick="openCity(event, 'Rwanda')">Vehicle</button>
  <button class="tablinks" onclick="openCity(event, 'Kigali')">Department</button>
  
</div>

<div id="London" class="tabcontent">
 <%
    try{
 String pageContent2="User.jsp";
 if(null!=pageContent2 ||!pageContent2.isEmpty()){
%>
<jsp:include page="<%=pageContent2%>"/>
<%}else{%>
<h2>Page Not found !</h2>
<%}
    }catch(Exception ex){
     %>
<h2>Page Not found !</h2>
<%   
    }
%>
</div>


<div id="Rwanda" class="tabcontent" >
 <%
    try{
 String pageContent2="Vehicle.jsp";
 if(null!=pageContent2 ||!pageContent2.isEmpty()){
%>
<jsp:include page="<%=pageContent2%>"/>
<%}else{%>
<h2>Page Not found !</h2>
<%}
    }catch(Exception ex){
     %>
<h2>Page Not found !</h2>
<%   
    }
%>
</div>
<div id="Kigali" class="tabcontent" >
 <%
    try{
 String pageContent2="Department.jsp";
 if(null!=pageContent2 ||!pageContent2.isEmpty()){
%>
<jsp:include page="<%=pageContent2%>"/>
<%}else{%>
<h2>Page Not found !</h2>
<%}
    }catch(Exception ex){
     %>
<h2>Page Not found !</h2>
<%   
    }
%>
</div>

<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
     
</body>
</html> 
