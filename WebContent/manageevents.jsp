<!DOCTYPE html>
<%@page import="javax.websocket.Session"%>
<%@page import="com.apapp.dao.AdminDAO"%>
<%@ page import="java.sql.ResultSet" %>
<html lang="en">
<head>
  <title>Manager</title>
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
  <style type="text/css">
   ​  table, td, tr { border: 2px solid black; }
   td{padding:5px;}
  </style>
  <!--[if lt IE 7]>
  	<link rel="stylesheet" href="css/ie/ie6.css" type="text/css" media="all">
  <![endif]-->
  <!--[if lt IE 9]>
  	<script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/IE9.js"></script>
  <![endif]-->
</head>

<body>
  <!-- header -->
  <header>
    <div class="container">
    	<h1><a href="managepanel.jsp">Manager Panel</a></h1>
      <nav>
        <ul>
        	<li><a href="uhome.jsp">Back</a></li>
          <li><a href="managepanel.jsp">Users</a></li>
          <li><a href="managerestaurants.jsp">Restaurant</a></li>
          <li><a href="manageplaces.jsp"  >Places</a></li>
          <li><a href="managemarkets.jsp">Markets</a></li>
          <li><a href="manageevents.jsp" class="current">Events</a></li>
        </ul>
      </nav>
    </div>
	</header>
	<%
	  		String privilege="";
	  		ResultSet rs=null, rs1=null;
	  		String email="";
	  		  		  	if(session.getAttribute("user")==null)
	  		  		  	{
	  		  		  		response.sendRedirect("login.jsp");
	  		  		  	}
	  		  		  	else{
	  		  		  		String table="events";
	  		  		  		String sql="select * from "+ table;
	  		  		  		String sql1="select privilege from members where email=?";
	  		  		  		AdminDAO obj = new AdminDAO();
	  		  		  		email=session.getAttribute("user").toString();
	  		  		  		rs1=obj.GetDetails(email, sql1);
	  		  		  		rs = obj.GetAllDetails(sql);
	  		  		  		privilege=rs1.getString(1) ;
	  		  		  	}
	  		  		  	if(privilege.equals("1")){
	  	 %>
  <div class="main-box" >
    <div class="container">
      <div class="inside">
      <a href="managepanel.jsp"><h2 style="width:10%;margin:0 auto;">All <span>Events</span></h2></a>
      <br>
      <br>
      <br>
<script type="text/javascript"><!--
google_ad_client = "ca-pub-1845532317325027";
/* Bottome Banner */
google_ad_slot = "6626373189";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="//pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
   
   <form action="DeleteServlet" method="post">
       		<table >
       			<tr>
       			<td></td>
       			<td style="border: 2px solid black;padding:5px">Id </td>
       			<td style="border: 2px solid black;padding:5px">Picture</td>
       			<td style="border: 2px solid black;padding:5px">Name</td>
       			<td style="border: 2px solid black;padding:5px">Category</td>
       			<td style="border: 2px solid black;padding:5px">Venue</td>
       			<td style="border: 2px solid black;padding:5px">Phone</td>
       			<td style="border: 2px solid black;padding:5px">Days</td>
       			<td style="border: 2px solid black;padding:5px">Timing</td>
       			<td style="border: 2px solid black;padding:5px">Cost</td>
       			<td style="border: 2px solid black;padding:5px">Max.People</td>
       			<td style="border: 2px solid black;padding:5px">Link</td>
       			</tr>
       			<%while(rs.next()){ %>
       			<tr>
       			<td style="border: 2px solid black;padding:5px"><input type="checkbox" name='id' value="<%= rs.getString(1)%>"/></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(1)%></td>
       			<td style="border: 2px solid black;padding:5px"><img src="images/<%= rs.getString(12)%>" width=150 height=105/></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(2)%></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(11)%></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(3)%></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(4)%></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(7)+ " - " + rs.getString(8)%></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(5)+ " - " + rs.getString(6)%></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(9)%></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(10)%></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(13)%></td>
       			</tr>
       			<%} %>
       			
       		</table>
       		<input type="hidden" name="table" value="events"/>
       		<input type="hidden" name="page" value="manageevents.jsp"/>
       		<br>
       		<input type="submit" value="Delete Events(s)"/>
       		</form>
       			<br><br><br>
       			
       			<h2 style="font-size:1.4em"><a href="newevent.jsp">Add new event</a></h2>
	  	</div>
      </div>
    </div>
  <%}
	  		  		else{
  		  		  		out.println("<h2 style='background:#eeeeee;width:50%;margin:0 auto;height: 75%;padding-left:16px'><br>Sorry, you don't have access to this panel.Click back to go back to your profile.</h2>");
  		  		  	}
  %>
  <!-- footer -->
  <footer>
    <div class="container">
    	<div class="wrapper">
        <div class="fleft">Copyright - Type in your name here</div>
        <div class="fright"><!--<a rel="nofollow" href="http://www.templatemonster.com/" target="_blank">Website template</a> designed by TemplateMonster.com&nbsp; &nbsp; |&nbsp; &nbsp; <a href="http://templates.com/product/3d-models/" target="_blank">3D Models</a> provided by Templates.com--></div>
      </div>
    </div>
  </footer>
  <script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
