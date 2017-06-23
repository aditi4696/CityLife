<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
  <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
  <script type="text/javascript" src="js/jquery-1.4.2.min.js" ></script>
  <script type="text/javascript" src="js/cufon-yui.js"></script>
  <script type="text/javascript" src="js/Humanst521_BT_400.font.js"></script>
  <script type="text/javascript" src="js/Humanst521_Lt_BT_400.font.js"></script>
  <script type="text/javascript" src="js/cufon-replace.js"></script>
<title>Register new restaurant</title>
</head>
<body>

<%
if(session.getAttribute("user")==null)
{
	response.sendRedirect("login.jsp");
}
%>


<div class="main-box">
    <div class="container">
      <div class="inside">
        <div class="wrapper">
        
  	<div class="container" style="width:40%; margin:0 auto;"><br>
    	<h2> New Restaurant Registration </h2><br>
  	</div>
        
        <!-- aside -->
          <aside>
            <h2>Restaurant <span>Form-</span></h2><br>

          </aside>
          <!-- content -->
          <section id="content" >
            <article >
              <form class="form" enctype="multipart/form-data" action="NewRestaurantServlet" method="post" style="width:120%">
                <fieldset >
                <br>
                <br>
                  <div class="field" >
                    <label>Name:</label>
                    <input type="text" placeholder="Registered Restaurant Name" name="rname"/>
                  </div>
                  <div class="field"><br>
                    <label>Cost for Two:</label>
                    <input type="text" placeholder="1000" name="cost"/>
                  </div>
                  <div class="field"><br>
                    <label>Phone:</label>
                    <input type="text" placeholder="Phone Number" name="phone"/>
                  </div>
                  <div class="field"><br>
                    <label>Address:</label>
                    <input type="text" placeholder="Location" name="address"/>
                  </div>
                  <div class="field"><br>
                    <label>Cuisine:</label>
                    <input type="text" placeholder="Cuisine" name="cuisine"/>
                  </div>
                  <div class="field"><br>
                    <label>Capacity:</label>
                    <input type="text" placeholder="Max. people" name="max"/>
                  </div>
                  <div class="field"><br>
                    <label>Opening time:</label>
                    <input type="time" name="opentime"/>
                  </div>
                  <div class="field"><br>
                    <label>Closing time:</label>
                    <input type="time" name="closetime"/>
                  </div>
                  <div class="field"><br>
                    <label>Open 7 days:</label>
                    <input type="checkbox" name="open"/>
                  </div>
                  <div class="field"><br>
                    <label>Card Accepted:</label>
                    <input type="checkbox" name="card"/>
                  </div>
                  <div class="field"><br>
                    <label>PayTm Accepted:</label>
                    <input type="checkbox" name="paytm"/>
                  </div>
                  <div class="field"><br>
                    <label>FreeWifi:</label>
                    <input type="checkbox" name="freewifi"/>
                  </div>
                  <div class="field"><br>
                    <label>Full Bar Available:</label>
                    <input type="checkbox" name="bar"/>
                  </div>
                  <div class="field"><br>
                    <label>Live Music:</label>
                    <input type="checkbox" name="music"/>
                  </div>
                  <div class="field"><br>
                    <label>Live Sports Screening:</label>
                    <input type="checkbox" name="sports"/>
                  </div>
                  <div class="field"><br>
                    <label>Smoking Area:</label>
                    <input type="checkbox" name="smoking"/>
                  </div>
                  <div class="field"><br>
                    <label>Upload Image:</label>
                    <input type="file" name="photo"/>
                  </div>
                  <div class= "field"><br>
                  	<input type="submit" value="Add Restaurant" style="width:100%"/>
                  </div>
                </fieldset>
              </form>
            </article> 
          </section>
        </div>
      </div>
    </div>
  </div>

</body>
</html>