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
<title>Register new market</title>
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
    	<h2> New Shopping Place Registration </h2><br>
  	</div>
        
        <!-- aside -->
          <aside>
            <h2>Market <span>Form-</span></h2><br>

          </aside>
          <!-- content -->
          <section id="content">
            <article>
              <form id="admin-form" class="form" enctype="multipart/form-data" action="NewMarketServlet" method="post">
                <fieldset>
                <br>
                <br>
                  <div class="field">
                    <label>Name:</label>
                    <input type="text" placeholder="Palika Bazar" name="name"/>
                  </div>
                  <div class="field"><br>
                    <label>Address:</label>
                    <input type="text" placeholder="Location" name="address"/>
                  </div>
                  <div class="field"><br>
                    <label>Station:</label>
                    <input type="text" placeholder="Nearest Metro Station" name="station"/>
                  </div>
                  <div class="field"><br>
                    <label>Opening time:</label>
                    <input type="time" name="otime"/>
                  </div>
                  <div class="field"><br>
                    <label>Closing time:</label>
                    <input type="time" name="ctime"/>
				</div>
                  <div class="field"><br>
                    <label>Opening days:</label>
						<select name="days">
					   	<option value="Monday">Monday</option>
					   	<option value="Tuesday">Tuesday</option>
					   	<option value="Wednesday">Wednesday</option>
					   	<option value="Thursday">Thursday</option>
					   	<option value="Friday">Friday</option>
					   	<option value="Saturday">Saturday</option>
					   	<option value="Sunday">Sunday</option>
		        		</select>
		        		&nbsp;to&nbsp;
		        		<select name="todays">
					   	<option value="Monday">Monday</option>
					   	<option value="Tuesday">Tuesday</option>
					   	<option value="Wednesday">Wednesday</option>
					   	<option value="Thursday">Thursday</option>
					   	<option value="Friday">Friday</option>
					   	<option value="Saturday">Saturday</option>
					   	<option value="Sunday">Sunday</option>
		        		</select>
                  </div>
                  <div class="field"><br>
                    <label>Speciality:</label>
                    <textarea style="width:65%;" name="desc"></textarea>
                  </div>
                  <div class="field"><br>
                    <label>Upload Image:</label>
                    <input type="file" name="photo"/>
                  </div>
                  <div class= "field"><br>
                  	<input type="submit" value="Add Place" style="width:100%"/>
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