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
          <li><a href="manageplaces.jsp">Places</a></li>
          <li><a href="" class="current">Markets</a></li>
          <li><a href="manageevents.jsp">Events</a></li>
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
	  		  		  		String table="markets";
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
      <a href="managepanel.jsp"><h2 style="width:20%;margin:0 auto;">All <span>Markets</span></h2></a>
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
       		<table>
       			<tr>
       			<td></td>
       			<td style="border: 2px solid black;padding:5px">Id </td>
       			<td style="border: 2px solid black;padding:5px">Picture</td>
       			<td style="border: 2px solid black;padding:5px">Name</td>
       			<td style="border: 2px solid black;padding:5px">Speciality</td>
       			<td style="border: 2px solid black;padding:5px">Address</td>
       			<td style="border: 2px solid black;padding:5px">Station</td>
       			<td style="border: 2px solid black;padding:5px">Timings</td>
       			<td style="border: 2px solid black;padding:5px">Days Open</td>
       			</tr>
       			<%while(rs.next()){ %>
       			<tr>
       			<td style="border: 2px solid black;padding:5px"><input type="checkbox" name='id' value="<%= rs.getString(1)%>"/></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(1)%></td>
       			<td style="border: 2px solid black;padding:5px"><img src="images/<%= rs.getString(9)%>" width=150 height=105/></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(2)%></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(8)%></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(3)%></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(4)%></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(5)+ " - " + rs.getString(6)%></td>
       			<td style="border: 2px solid black;padding:5px"><%= rs.getString(7)%></td>
       			</tr>
       			<%} %>
       			
       		</table>
       		<input type="hidden" name="table" value="markets"/>
       		<input type="hidden" name="page" value="managemarkets.jsp"/><br>
       		<input type="submit" value="Delete Market(s)"/>
       		</form>
       			<br><br><br>
       			
       			<h2 style="font-size:1.4em"><a href="newmarket.jsp">Add new market</a></h2>
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
