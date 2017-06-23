<!DOCTYPE html>
<%@page import="javax.websocket.Session"%>
<%@page import="com.apapp.model.Members"%>
<%@page import="com.apapp.dao.AdminDAO"%>
<%@ page import="java.sql.ResultSet" %>
<html lang="en">
<head>
  <title>Home Page | City Life</title>
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
  input.box {
  border-top-style: hidden;
  border-right-style: hidden;
  border-left-style: hidden;
  border-bottom-style: hidden;
  background: url(../images/gallerry-bg.gif) 0 0 repeat-x;
  }
  input.box:focus{
  outline:none;
  }
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
    	<h1><a href="index.jsp">City Life</a></h1>
      <nav>
        <ul>
        	<li><a href="index.jsp">Home</a></li>
          <li><a href="browse.jsp">Browse</a></li>
          <li><a href="showplaces.jsp">Places</a></li>
          <li><a href="showrestaurants.jsp">Restaurants</a></li>
          <li><a href="showmarkets.jsp">Markets</a></li>
          <li><a href="showevents.jsp">Events</a></li>
          <li><a href="uhome.jsp" class="current">Settings</a></li>
        </ul>
      </nav>
    </div>
	</header>
  <!-- #gallery -->
  <section id="gallery">
  	<div class="container">
	  	<aside>
	  	<%
	  		String path="";
	  		String email="";
	  		String privilege="";
	  		ResultSet rs=null;
	  		  		  	if(session.getAttribute("user")==null)
	  		  		  	{
	  		  		  		response.sendRedirect("login.jsp");
	  		  		  	}
	  		  		  	else{
	  		  		  		String sql="select name,pic,privilege,dob,contact,gender,address from members where email=?";
	  		  		  		email=session.getAttribute("user").toString();
	  		  		  		AdminDAO obj = new AdminDAO();
	  		  		  		rs = obj.GetDetails(email,sql);
	  		  		  		privilege=rs.getString(3) ;
	  		  		  		path = "/images/"+rs.getString(2);
	  		  		  	}
	  	%>
	  		<img alt="" src="<%out.println(path); %>" style="width:100%;height:50%;margin:50px"/>
	  		<form action="PicUploadServlet" method="post" enctype="multipart/form-data" style="margin-left: 50px" name="photo">
	  			<input type="file" name="photo"/><br><br>
	  			<input type="submit" value="Upload"/>
	  		</form><br><br>
	  	</aside>
	  	<div id="content" >
	  	<h2 style="float:right;color:#da0110;font-size:1.5em;margin:30px"><a href="logout.jsp">LOG OUT</a></h2>
	  	<form action="uhome.jsp" method="post">
	  	<ul class="contacts" style="margin:80px">
	  		<li><h2 style="font-size:1.4em">Email: <input class="box" type="text" value="<% out.println(email); %>" name="email" readonly/></h2></li>
	  		<li><h2 style="font-size:1.4em">Name: <input class="box" type="text" value="<% out.println(rs.getString(1)); %>" name="name"/></h2></li>
	  		<li><h2 style="font-size:1.4em">DOB: <input class="box" type="text" value="<% out.println(rs.getString(4)); %>" name="dob"/></h2></li>
	  		<li><h2 style="font-size:1.4em">Sex: <input class="box" type="text" value="<% out.println(rs.getString(6)); %>" readonly/></h2></li>
	  		<li><h2 style="font-size:1.4em">Address: <input class="box" type="text" value="<% out.println(rs.getString(7)); %>" name="address"/></h2></li>
	  		<li><h2 style="font-size:1.4em">Contact: <input class="box" type="text" value="<% out.println(rs.getString(5)); %>" name="phone"/></h2></li>
	  		<li><input type="submit" value="Update" name="update"/></li>
	  	</ul>
	  	</form>
	  	</div>
  	</div>
  </section>
  <!-- /#gallery -->
        
  <% if(privilege.equals("1")) {%>
  <div class="main-box">
    <div class="container" >
      <div class="inside" >
        <div class="wrapper" >
      <a href="managepanel.jsp"><h2 style="width:50%;margin:0 auto;">Management <span>Panel</span></h2></a>
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
<aside>
		<ul style="margin-left:80px">
		
	        <li><a href="newmember.jsp">Add Team Member</a></li><br>
        	<li><a href="newrestaurant.jsp">Add Restaurants</a></li><br>
	        <li><a href="newplace.jsp">Add Tourist Attractions</a></li><br>
	        <li><a href="newmarket.jsp">Add Shopping Places</a></li><br>
	        <li><a href="newevent.jsp">Add Events</a></li><br>
        </ul>
</aside>     
       <section id="content" >
	  	<ul style="margin-left:100px">
	  		<li><a href="managepanel.jsp">Manage Users</a></li><br>
	  		<li><a href="managerestaurants.jsp">Manage Restaurants</a></li><br>
	  		<li><a href="manageplaces.jsp">Manage Tourist Attractions</a></li><br>
	  		<li><a href="managemarkets.jsp">Manage Shopping Places</a></li><br>
	  		<li><a href="manageevents.jsp">Manage Events</a></li><br>
	  	</ul>
	  	</section>
	  	</div>
      </div>
    </div>
  </div>
  <%} %>
  
  <%
  	if(request.getParameter("update")!=null){
		 String uname=request.getParameter("name");
		 String dob=request.getParameter("dob");
		 String contact=request.getParameter("phone");
		 String address=request.getParameter("address");
		 

		 Members obj=new Members();
		 obj.setName(uname);
		 obj.setDob(dob);
		 obj.setPhone(contact);
		 obj.setAddress(address);
		 obj.setEmail(email);
		 
		 String sql="update members set name=?,dob=?,contact=?,address=? where email=?";
	     AdminDAO oo=new AdminDAO();
	     String msg=oo.UpdateMember(obj, sql);
	     if(msg.equals("success"))
	     {
	    	 response.sendRedirect("login.jsp");
	     }
	     else
	     {
	    	 response.sendRedirect("login.jsp?error=FAIL TO INSERT RECORD");
	     }
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
