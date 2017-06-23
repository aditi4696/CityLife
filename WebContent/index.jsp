<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home | City Life</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
  <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
  <script type="text/javascript" src="js/jquery-1.4.2.min.js" ></script>
  <script type="text/javascript" src="js/cufon-yui.js"></script>
  <script type="text/javascript" src="js/Humanst521_BT_400.font.js"></script>
  <script type="text/javascript" src="js/Humanst521_Lt_BT_400.font.js"></script>
	<script type="text/javascript" src="js/roundabout.js"></script>
  <script type="text/javascript" src="js/roundabout_shapes.js"></script>
  <script type="text/javascript" src="js/gallery_init.js"></script>
  <script type="text/javascript" src="js/cufon-replace.js"></script>
  <!--[if lt IE 7]>
  	<link rel="stylesheet" href="css/ie/ie6.css" type="text/css" media="all">
  <![endif]-->
  <!--[if lt IE 9]>
  	<script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/IE9.js"></script>
  <![endif]-->
   
<body>
  <!-- header -->
  
  <header>
    <div class="container">
    	<h1><a href="index.jsp">City Life</a></h1>
      <nav>
        <ul>
        	<li><a href="index.jsp" class="current">Home</a></li>
          <li><a href="browse.jsp">Browse</a></li>
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
            <h2>Recent <span>News</span></h2>
            <!-- .news -->
            <ul class="news">
            	<li>
              	<figure><strong>To</strong>Day</figure>
                <h3><a href="#">Book a table!</a></h3>
                Get 15% off at one of these restaurants <a href="showrestaurants.jsp">...</a>
              </li>
              <li>
              	<figure><strong>To</strong>morrow</figure>
                <h3><a href="#">Take a tour</a></h3>
                Reserve a seat in the city sight seeing bus now and get an extra <a href="#">...</a>
              </li>
              <li>
              	<figure><strong>31</strong>June</figure>
                <h3><a href="#">Chill and music</a></h3>
                Attend the live concert of one of India's top singers<a href="#">...</a>
              </li>
              <li>
              	<figure><strong>25</strong>July</figure>
                <h3><a href="#">BIGGEST SALE</a></h3>
                Discount on top brand items. Cheap like never before. Use coupon: <a href="#">...</a>
              </li>
            </ul>
            <!-- /.news -->
          </aside>
          <!-- content -->
          <section id="content">
            <article>
            	<h2>Welcome to <span>City Life!</span></h2>
              <p>
              City Life is a guide for tourists visting Delhi for the first time. They can
              register <a href="newuser.jsp">here</a> and avail exciting offers from our clients!
              Not new to Delhi? You can still register and enjoy discounts at restaurants in Delhi
              by booking a table through our website.
              </p>
              
              <figure><a href="#"><!--<img src="images/banner1.jpg" alt="">--><script type="text/javascript"><!--
google_ad_client = "ca-pub-1845532317325027";
/* banner-468 */
google_ad_slot = "6181797301";
google_ad_width = 468;
google_ad_height = 60;
//-->
</script>
<script type="text/javascript"
src="//pagead2.googlesyndication.com/pagead/show_ads.js">
</script></a></figure>
              <p>This website also lets you book sight seeing buses online and track them!</p>
             We also update the website regularly with cultural activities happening in and around the city.
            </article> 
            <br><br><!-- start sw-rss-feed code --> 
<script type="text/javascript"> 
<!-- 
rssfeed_url = new Array(); 
rssfeed_url[0]="https://news.google.co.in/news?cf=all&hl=en&pz=1&ned=in&output=rss";  
rssfeed_frame_width="440"; 
rssfeed_frame_height="275"; 
rssfeed_scroll="on"; 
rssfeed_scroll_step="6"; 
rssfeed_scroll_bar="off"; 
rssfeed_target="_blank"; 
rssfeed_font_size="12"; 
rssfeed_font_face=""; 
rssfeed_border="on"; 
rssfeed_css_url=""; 
rssfeed_title="on"; 
rssfeed_title_name=""; 
rssfeed_title_bgcolor="#3366ff"; 
rssfeed_title_color="#fff"; 
rssfeed_title_bgimage=""; 
rssfeed_footer="off"; 
rssfeed_footer_name="rss feed"; 
rssfeed_footer_bgcolor="#fff"; 
rssfeed_footer_color="#333"; 
rssfeed_footer_bgimage=""; 
rssfeed_item_title_length="50"; 
rssfeed_item_title_color="#666"; 
rssfeed_item_bgcolor="#fff"; 
rssfeed_item_bgimage=""; 
rssfeed_item_border_bottom="on"; 
rssfeed_item_source_icon="off"; 
rssfeed_item_date="off"; 
rssfeed_item_description="on"; 
rssfeed_item_description_length="120"; 
rssfeed_item_description_color="#666"; 
rssfeed_item_description_link_color="#333"; 
rssfeed_item_description_tag="off"; 
rssfeed_no_items="0"; 
rssfeed_cache = "5751cbf3ac9e257b7a03bc679d2fb632"; 
//--> 
</script> 
<script type="text/javascript" src="//feed.surfing-waves.com/js/rss-feed.js"></script> 
<!-- The link below helps keep this service FREE, and helps other people find the SW widget. Please be cool and keep it! Thanks. --> 
<div style="text-align:right; width:440px;"><a href="http://www.surfing-waves.com/feed.htm" target="_blank" style="color:#ccc;font-size:10px">feedwidget @</a> <a href="http://www.surfing-waves.com" target="_blank" style="color:#ccc;font-size:10px">Surfing Waves</a></div> 
<!-- end sw-rss-feed code -->
          </section>
        </div>
      </div>
    </div>
  </div>
  <!-- footer -->
  <footer>
    <div class="container">
    	<div class="wrapper">
        <div class="fleft">Copyright - Type in your name here (Still working on it)</div>
        <div class="fright"><!--<a rel="nofollow" href="http://www.templatemonster.com/" target="_blank">Website template</a> designed by TemplateMonster.com&nbsp; &nbsp; |&nbsp; &nbsp; <a href="http://templates.com/product/3d-models/" target="_blank">3D Models</a> provided by Templates.com--></div>
      </div>
    </div>
  </footer>
  <script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
