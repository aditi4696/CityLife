<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Table</title>
</head>
<body>
<form id="restaurant-form" class="form" action="NewRestaurantServlet" method="post" style="width:120%">
                <fieldset >
                <br>
                <br>
                  <div class="field" >
                    <label>Name:</label>
                    <input type="text" placeholder="Loading restaurant name..." />
                  </div>
                  <div class="field"><br>
                    <label>No.of people:</label>
                    <input type="text" placeholder="6" name="nop"/>
                  </div>
                  <div class="field"><br>
                    <label>From:</label>
                    <input type="time" name="opentime"/>
                  </div>
                  <div class="field"><br>
                    <label>To:</label>
                    <input type="time" name="closetime"/>
                  </div>
                  <div class= "field"><br>
                  	<input type="submit" value="Confirm Booking" style="width:100%"/>
                  </div>
                </fieldset>
              </form>
</body>
</html>