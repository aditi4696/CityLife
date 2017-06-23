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
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

/**
 * Servlet implementation class AttendServlet
 */
@WebServlet("/AttendServlet")
public class AttendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendServlet() {
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
		String mail=request.getParameter("umail");
		  	String id=request.getParameter("eid");
		  	if(mail.length()!=0 & id.length()!=0){
			int eid=Integer.parseInt(id);
			
			String sqla="select id,contact,name from members where email=?";
			AdminDAO o=new AdminDAO();
			ResultSet rsa=o.GetDetails(mail, sqla);
			try {
				if(rsa.getString(1)!=null){
				int uid=Integer.parseInt(rsa.getString(1));
				sqla="insert into attend(uid,eid) values (?,?)";
				System.out.println("<p>IDs- "+uid+" "+eid+"</p>");
				String msg=o.attend(uid,eid,sqla);
				if(msg.equals("success"))
			     {
			    	  
					Message.creator(new PhoneNumber("+91"+rsa.getString(2)),
	    					  new PhoneNumber("+12014904147"), 
	    			  "Congrats, "+rsa.getString(3)+"! Your booking for the event has been confirmed. You will be contacted by the event representatives soon.")
	    			  .create();
	    	  		
			    	   //System.out.println("<script> alert(Working- "+message.getSid()+");</script>"); 
			    	 response.sendRedirect("showevents.jsp");
			    	  //System.out.println(((Message) message).getSid());
			     }
			     else
			     {
			    	 response.sendRedirect("showevents.jsp?error=FAILED TO INSERT RECORD");
			     }
				}
				else{
					response.sendRedirect("showevents.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  	}
	}

}
