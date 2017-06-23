package com.apapp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apapp.dao.AdminDAO;
import com.apapp.model.Members;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String email=request.getParameter("email");
		 String pwd=request.getParameter("pwd");
		 
		 
		 
		 Members obj = new Members();
		 obj.setEmail(email);
		 obj.setPassword(pwd);
		 
		 
		 String sql="select * from members where email=? && pwd=?";
	     AdminDAO oo=new AdminDAO();
	     String msg=oo.ValidateUser(obj, sql);
	     if(msg.equals("success"))
	     {
	    	 HttpSession session=request.getSession();
	    	 session.setAttribute("user", email); 
	    	 response.sendRedirect("uhome.jsp");
	     }
	     else
	     {
	    	 response.sendRedirect("login.jsp?error=FAILED TO LOGIN");
	     }
	     
	}

}
