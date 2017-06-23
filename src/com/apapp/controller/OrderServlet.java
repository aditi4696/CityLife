package com.apapp.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apapp.dao.AdminDAO;
import com.apapp.model.Order;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

    static{
    	String ACCOUNT_SID = "ACa0c22e33e95dcaf9a0b1370748855769";
   	 	String AUTH_TOKEN = "a3284143165be499d047f72ca789f2e0";
   	 	Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int nop = Integer.parseInt(request.getParameter("nop")) ;
		int restid = Integer.parseInt(request.getParameter("restid"));
		String bemail = request.getParameter("bemail");
		String to = request.getParameter("to");
		String from = request.getParameter("from");
		String date = request.getParameter("date");
		
		Order o=new Order();
		o.setRestid(restid);
		o.setBemail(bemail);
		o.setDate(date);
		o.setTo(to);
		o.setFrom(from);
		o.setNop(nop);
		
		String sqla="select id,contact,name from members where email=?";
		AdminDAO oo=new AdminDAO();
		ResultSet rsa=oo.GetDetails(bemail, sqla);
		try {
			if(rsa.getString(1)!=null){
		String sql="insert into booking(restid,bemail,date,bto,bfrom,nop)values(?,?,?,?,?,?)";
			String msg=oo.newOrder(o,sql);
	     if(msg.equals("success"))
	     {
	    	 Message.creator(new PhoneNumber("+91"+rsa.getString(2)),
					  new PhoneNumber("+12014904147"), 
			  "Congrats, "+rsa.getString(3)+"! Your table has been booked. You will be contacted by our representatives soon for confirmation and payment.")
			  .create();
	  		
	    	 response.sendRedirect("showrestaurants.jsp");
	     }
	     else
	     {
	    	 response.sendRedirect("showrestaurants.jsp?error=FAILED TO INSERT RECORD");
	     }
			}
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
