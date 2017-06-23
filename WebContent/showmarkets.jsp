    <%@ page import="com.apapp.dao.AdminDAO"  %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Browse | City Life</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
  <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
  <script type="text/javascript" src="js/jquery-1.4.2.min.js" ></script>
  <script type="text/javascript" src="js/cufon-yui.js"></script>
  <script type="text/javascript" src="js/Humanst521_BT_400.font.js"></script>
  <script type="text/javascript" src="js/Humanst521_Lt_BT_400.font.js"></script>
  <script type="text/javascript" src="js/cufon-replace.js"></script>
	<script type="text/javascript" src="js/roundabout.js"></script>
  <script type="text/javascript" src="js/roundabout_shapes.js"></script>
  <script type="text/javascript" src="js/gallery_init.js"></script>
  <script type="text/javascript" src="js/loopedslider.min.js"></script>
  <style>
#main{
display:inline-block;
width:25%;
margin:30px;
}
h3{
font-size:1em;
}
.w3-card-4{box-shadow:0 4px 10px 0 rgba(0,0,0,0.2),0 4px 20px 0 rgba(0,0,0,0.19)}
.w3-margin{margin:16px!important}
.w3-container{content:"";display:table;clear:both;}
.w3-display-container{position:relative}
.w3-text-white{color:#fff!important}
.w3-xlarge{font-size:1em!important}
.w3-padding{padding:8px 16px!important}
.w3-display-topright{position:absolute;right:0;top:0}
.w3-display-bottomleft{position:absolute;left:0;bottom:0}
</style>
  <script type="text/javascript">
		$(function(){
			// Option set as a global variable
			$('#loopedSlider').loopedSlider({
				container: ".wrap",
				containerClick: false
			});
		});
	</script>
  <!--[if lt IE 7]>
  	<link rel="stylesheet" href="css/ie/ie6.css" type="text/css" media="all">
  <![endif]-->
  <!--[if lt IE 9]>
  	<script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/IE9.js"></script>
  <![endif]-->
</head>

<body style="background:#ffffff">
  <!-- header -->
  <header>
    <div class="container">
    	<h1><a href="index.jsp">City Life</a></h1>
      <nav>
        <ul>
        	<li><a href="index.jsp">Home</a></li>
          <li><a href="browse.jsp">Browse</a></li>
          <li><a href="showplaces.jsp">Places</a></li>
          <li><a href="showrestaurants.jsp">Restaurants</a></li>
          <li><a href="showmarkets.jsp"   class="current">Markets</a></li>
          <li><a href="showevents.jsp">Events</a></li>
          <%
	  		String path="";
	  		  		  	if(session.getAttribute("user")==null)
	  		  		  	{
	%>
          <li><a href="login.jsp">Login</a></li>
          <%
	}
	else{
	%>
		<li><a href="uhome.jsp">Settings</a></li>
	<%
	}%>
        </ul>
      </nav>
    </div>
	</header>
  
  <div class="main-box">
    <div class="container">
      <div class="inside">
        <%
	  		ResultSet rs=null;
	  		String table="markets";
	  		String sql="select name, address, station, otime, ctime,odays, speciality,pic from "+ table;
	  		AdminDAO obj = new AdminDAO();
	  		rs = obj.GetAllDetails(sql);
 		  	while(rs.next()){
	  	 %>


<div class="w3-card-4" id="main">
<div class="w3-container w3-margin">
      <h3><%=rs.getString(1) %></h3>
    </div>
  <div class="w3-display-container w3-text-white">
  	<img src="images/<%=rs.getString(8) %>" alt="" style="height:200px;width:282px;background:#000000">
    <div class="w3-xlarge w3-display-topright w3-padding"><%=rs.getString(7) %></div>
    <div class="w3-xlarge w3-display-bottomleft w3-padding"><%=rs.getString(2) %></div>
  </div>
  <div class="w3-container w3-margin">
  <p>Nearest Station: <%=rs.getString(3) %></p>
  <hr>
      <h3>Timings: &nbsp;&nbsp;<%=rs.getString(4)+" - "+rs.getString(5)%></h3>
      <h3>Open: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(6)%></h3>
  </div>
</div>
<%} %>
      </div>
    </div>
  </div>
  <script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
