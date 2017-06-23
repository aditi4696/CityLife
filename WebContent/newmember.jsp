<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.apapp.dao.AdminDAO"%>
<%@ page import="java.sql.ResultSet" %>
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
<title>Register new member</title>
</head>
<body>

<%
	String privilege="";
	ResultSet rs1=null;
	String email="";
if(session.getAttribute("user")==null)
{
	response.sendRedirect("login.jsp");
}
else{
  		String sql1="select privilege from members where email=?";
  		AdminDAO obj = new AdminDAO();
  		email=session.getAttribute("user").toString();
  		rs1=obj.GetDetails(email, sql1);
  		privilege=rs1.getString(1) ;
  	}
  	if(privilege.equals("1")){
%>


<div class="main-box">
    <div class="container">
      <div class="inside">
        <div class="wrapper">
        
  	<div class="container" style="width:40%; margin:0 auto;"><br>
    	<h2> New Member Registration </h2><br>
  	</div>
        
        <!-- aside -->
          <aside>
            <h2>Member <span>Form-</span></h2><br>

          </aside>
          <!-- content -->
          <section id="content">
            <article>
              <form enctype="multipart/form-data" id="admin-form" class="form" action="NewMemberServlet" method="post">
                <fieldset>
                <br>
                <br>
                  <div class="field">
                    <label>Name:</label>
                    <input type="text" placeholder="Your full name" name="name"/>
                  </div>
                  <div class="field"><br>
                    <label>Email:</label>
                    <input type="email" placeholder="Your Registered Email" name="email"/>
                  </div>
                  <div class="field"><br>
                    <label>Phone:</label>
                    <input type="text" placeholder="Your Phone Number" name="phone"/>
                  </div>
                  <div class="field"><br>
                    <label>Address:</label>
                    <input type="text" placeholder="Your Current Address" name="address"/>
                  </div>
                  <div class="field"><br>
                    <label>Gender:</label>
                    Male<input type="radio" name="g" value="male" style="width:20%"/>
				</div>
				<div class="field">
                    <label></label>
                    <input type="radio" name="g" value="female" style="width:20%"/>Female
				</div>
                  <div class="field"><br>
                    <label>Birthday:</label>
                    <input type="date" placeholder="Your Birth Date" name="dob"/>
                  </div>
                  <div class="field"><br>
                    <label>Password:</label>
                    <input type="password" placeholder="Your Password" name="pwd"/>
                    <input type="hidden" name="privilege" value="2";/>
                  </div>
                  <div class="field"><br>
                    <label>Upload a picture:</label>
                    <input type="file" name="photo"/>
                  </div>
                  <div class= "field"><br>
                  	<input type="submit" value="Add Member" style="width:100%"/>
                  </div>
                </fieldset>
              </form>
            </article> 
          </section>
  <%}
  	else{
	  		out.println("<h2 style='background:#eeeeee;width:50%;margin:0 auto;height: 100%'>Sorry, you don't have access to this panel.Click back to go back to your profile.</h2>");
	  	}
  %>
        </div>
      </div>
    </div>
  </div>

</body>
</html>