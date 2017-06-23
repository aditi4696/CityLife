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

<body>
  <!-- header -->
  <header>
    <div class="container">
    	<h1><a href="index.jsp">City Life</a></h1>
      <nav>
        <ul>
        	<li><a href="index.jsp">Home</a></li>
          <li><a href="browse.jsp" class="current">Browse</a></li>
          <li><a href="showplaces.jsp">Places</a></li>
          <li><a href="showrestaurants.jsp">Restaurants</a></li>
          <li><a href="showmarkets.jsp">Markets</a></li>
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
  <!-- #gallery -->
  <section id="gallery">
  	<div class="container">
    	<ul id="myRoundabout">
      	<li><img src="images/new1.jpg" alt=""></li>
        <li><img src="images/new5.jpg" alt=""></li>
        <li><img src="images/new3.jpg" alt=""></li>
        <li><img src="images/new4.jpg" alt=""></li>
        <li><img src="images/new2.jpg" alt=""></li>
      </ul>
  	</div>
  </section>
  <!-- /#gallery -->
  <div class="main-box">
    <div class="container">
      <div class="inside">
        <div class="wrapper">
        	<!-- aside -->
          <aside>
            <h2>Browse <span>Categories</span></h2>
            <!-- loopedSlider begin -->
            <div id="loopedSlider">	
              <div class="wrap">
                <div class="slides">
                  <div><a href="showplaces.jsp"><img src="images/new1.jpg" alt="" height=295></a></div>
                  <div><a href="showrestaurants.jsp"><img src="images/restaurant.jpg" alt="" height=295 ></a></div>
                  <div><a href="showmarkets.jsp"><img src="images/moi.jpg" alt="" height=295></a></div>
                  <div><a href=""><img src="images/events.jpg" alt="" height=295></a></div>
                </div>
              </div>
              <ul class="nav-controls">
              	<li><a href="#" class="previous">Previous Page</a></li>
              	<li><a href="#" class="next">Next Page</a></li>
              </ul>
            </div>
            <!-- loopedSlider end -->
          </aside>
          <!-- content -->
          <section id="content">
            <article>
            	<h2>Searching <span>Options</span></h2><br>
<script type="text/javascript"><!--
google_ad_client = "ca-pub-1845532317325027";
/* banner-468 */
google_ad_slot = "6181797301";
google_ad_width = 468;
google_ad_height = 60;
//-->
</script>
<script type="text/javascript"
src="//pagead2.googlesyndication.com/pagead/show_ads.js">
</script><!-- <h2 style="font-size:1.4em">
		<ul>
			<li><a href="">Search restaurant by name</a></li><br><br>
			<li><a href="">Search restaurant by cost range</a></li><br><br>
			<li><a href="">Search places by category</a></li><br><br>
			<li><a href="">Search markets by speciality</a></li><br><br>
		</ul> -->
		
		<table border="1"><tr><td style='padding:7px'>
		<form action="" method="post">
				<select name="table">
			   	<option value="places" selected>Tourist Attractions</option>
			   	<option value="restaurants">Restaurants</option>
			   	<option value="markets">Markets</option>
			   	<option value="hotels">Hotels</option>
        		</select>&nbsp;</td><td style='padding:7px'>
				<select name="column">
			   	<option value="name" selected>Name</option>
			   	<option value="address">Address</option>
			   	<option value="station">Station</option>
			   	<option value="category">Category</option>
        		</select>&nbsp;</td><td colspan="2" style='padding:7px;padding-left:15px'>
        		<input type="text" name="keyword" placeholder="What are you looking for?"/>&nbsp;</td>
        		<td style='padding:7px'>
        		<input type="submit" value="Search"/>&nbsp;</td></tr>
		</form>
<%
  if(request.getParameter("keyword")!=null)
  {
	  String table=request.getParameter("table");
	  String column=request.getParameter("column");
	  String columndiff=null, columndiffdiff=null;
	  String keyword=request.getParameter("keyword");
	  if(table.equals("restaurants")){
		  columndiff="cuisine";
		  if(column.equals("category")){
			  column=columndiff;
		  }
	  }
	  else if(table.equals("places")){
		  columndiff="category";
		  if(column.equals("category")){
			  column=columndiff;
		  }
	  }
	  else if(table.equals("markets")){
		  columndiff="speciality";
		  if(column.equals("category")){
			  column=columndiff;
		  }
	  }
	  else
	  {
		  
	  }
	  String sql="select pic, name, address, station,"+columndiff+" from "+ table +" where "+ column +" =?";
	  AdminDAO obj=new AdminDAO();
	  ResultSet rs=obj.searchDetails(keyword, sql);
	  //out.println(sql+" "+keyword);
	  //while(rs.next())
	  //out.println(rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5));
	  out.println("<tr>");
	  out.println("<td style='border: 2px solid black;padding:5px'>PIC</td>");
	  out.println("<td style='border: 2px solid black;padding:5px'>NAME</td>");
	  out.println("<td style='border: 2px solid black;padding:5px'>ADDRESS</td>");
	  out.println("<td style='border: 2px solid black;padding:5px'>STATION</td>");
	  out.println("<td style='border: 2px solid black;padding:5px'>"+columndiff+"</td>");
	  while(rs.next())
	  {
		  out.println("<tr>");
		  out.println("<td style='border: 2px solid black;padding:5px'><img src='images/"+rs.getString(1)+"' height=105 width=150 /></td>");
		  out.println("<td style='border: 2px solid black;padding:5px'>"+rs.getString(2)+"</td>");
		  out.println("<td style='border: 2px solid black;padding:5px'>"+rs.getString(3)+"</td>");
		  out.println("<td style='border: 2px solid black;padding:5px'>"+rs.getString(4)+"</td>");
		  out.println("<td style='border: 2px solid black;padding:5px'>"+rs.getString(5)+"</td>");
		  out.println("</tr>");
	  }
	  
	  

  
  
  }


%>
			</table>
            </article> 
          </section>
        </div>
      </div>
    </div>
  </div>
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
