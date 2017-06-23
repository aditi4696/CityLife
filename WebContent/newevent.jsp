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
<title>Register new event</title>
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
    	<h2> New Event Registration </h2><br>
  	</div>
        
        <!-- aside -->
          <aside>
            <h2>Event <span>Form-</span></h2><br>

          </aside>
          <!-- content -->
          <section id="content">
            <article>
              <form id="admin-form" enctype="multipart/form-data" class="form" action="NewEventServlet" method="post">
                <fieldset>
                <br>
                <br>
                  <div class="field">
                    <label>Name:</label>
                    <input type="text" placeholder="Dance Show" name="name"/>
                  </div>
                  <div class="field"><br>
                    <label>Venue:</label>
                    <input type="text" placeholder="Location" name="address"/>
                  </div>
                  <div class="field"><br>
                    <label>Phone:</label>
                    <input type="text" placeholder="Contact number" name="phone"/>
                  </div>
                  <div class="field"><br>
                    <label>Starting date:</label>
                    <input type="date" name="oday"/>
                  </div>
                  <div class="field"><br>
                    <label>Ending date:</label>
                    <input type="date" name="eday"/>
                  </div>
                  <div class="field"><br>
                    <label>Starting time:</label>
                    <input type="time" name="otime"/>
                  </div>
                  <div class="field"><br>
                    <label>Ending time:</label>
                    <input type="time" name="ctime"/>
				</div>
                  <div class="field"><br>
                    <label>Category:</label>
                    <select name="category">
                    	<option value="Education" selected>Education</option>
                    	<option value="Arts">Arts</option>
                    	<option value="Literary">Literary</option>
                    	<option value="Business">Business</option>
                    	<option value="Dance">Dance</option>
                    	<option value="Music">Music</option>
                    	<option value="Food">Food</option>
                    	<option value="Conference">Conference</option>
                    	<option value="Photography">Photography</option>
                    	<option value="Religious">Religious</option>
                    	<option value="Other">Other</option>                    
                    </select>
                  </div>
                  <div class="field"><br>
                    <label>Cost:</label>
                    <input type="text" placeholder="Entry charges(if any)" name="entry"/>
                  </div>
                  <div class="field"><br>
                    <label>Maximum Capacity:</label>
                    <input type="text" placeholder="300" name="cap"/>
                  </div>
                  <div class="field"><br>
                    <label>Registration Link:</label>
                    <input type="text" placeholder="www.register-here.com" name="link"/>
                  </div>
                  <div class="field"><br>
                    <label>Upload Image:</label>
                    <input type="file" name="photo"/>
                  </div>
                  <div class= "field"><br>
                  	<input type="submit" value="Add Event" style="width:100%"/>
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