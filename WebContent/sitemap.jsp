<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sitemap | City Life</title>
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
    	<h1><a href="index.html">City Life</a></h1>
      <nav>
        <ul>
        	<li><a href="index.jsp">Home</a></li>
          <li><a href="about.jsp">About</a></li>
          <li><a href="browse.jsp">Browse</a></li>
          <li><a href="contact.jsp">Contact</a></li>
          <li><a href="contribute.jsp">Contribute</a></li>
          <li><a href="sitemap.jsp" class="current">Site Map</a></li><%
	  		String path="";
	  		  		  	if(session.getAttribute("user")==null)
	  		  		  	{
	%>
          <li><a href="login.jsp">Login</a></li>
          <li><a href="newuser.jsp">Sign Up</a></li>
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
      	<li><img src="images/slide3.jpg" alt=""></li>
        <li><img src="images/slide2.jpg" alt=""></li>
        <li><img src="images/slide5.jpg" alt=""></li>
        <li><img src="images/slide1.jpg" alt=""></li>
        <li><img src="images/slide4.jpg" alt=""></li>
      </ul>
  	</div>
  </section>
  <!-- /#gallery -->
  <div class="main-box">
    <div class="container">
      <div class="inside">
        <h2>Site <span>Map</span></h2>
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

        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur.</p>
        <ul class="list1">
        	<li><a href="index.html">Home</a></li>
          <li><a href="about.html">About us</a></li>
          <li><a href="privacy.html">Privacy Policy</a></li>
          <li><a href="gallery.html">Gallery</a></li>
          <li><a href="contacts.html">Contact us</a></li>
          <li><a href="sitemap.html">Site Map</a></li>
        </ul>
        At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non.
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
