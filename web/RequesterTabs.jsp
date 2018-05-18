<!DOCTYPE html>
<html>
<head>
<style>
body {font-family: "Lato", sans-serif;}


</style>
</head>
<body>





<div>

  <jsp:include page="RequisitionForm.jsp"/>

</div>


<script>
function openCity(evt, cityName) {
        document.getElementById('availabitity').style.display = "none";
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
