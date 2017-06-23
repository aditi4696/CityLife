package com.apapp.controller;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.apapp.dao.AdminDAO;
import com.apapp.model.Members;

/**
 * Servlet implementation class NewMemberServlet
 */
@WebServlet("/NewMemberServlet")
@MultipartConfig
public class NewMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewMemberServlet() {
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
		 String uname=request.getParameter("name");
		 String pwd=request.getParameter("pwd");
		 String email=request.getParameter("email");
		 String dob=request.getParameter("dob");
		 String contact=request.getParameter("phone");
		 String gender=request.getParameter("g");
		 String address=request.getParameter("address");
		 int privilege=Integer.parseInt(request.getParameter("privilege"));
		 
		 String Filename="";
			response.setContentType("text/html");
			InputStream inputStream = null;
			String savePath = getServletContext().getRealPath("/")+"/images/";
			
			Part filePart = request.getPart("photo");
			if (filePart.getSize()!=0) {

				// obtains input stream of the upload file
				inputStream = filePart.getInputStream();
				
				BufferedInputStream bf=new BufferedInputStream(inputStream);
				
				String header=filePart.getHeader("content-disposition");
				StringTokenizer st=new StringTokenizer(header,";");
				String fileToken=""; 
				while(st.hasMoreElements())
				{
					fileToken=st.nextToken();
				}
			    System.out.println(fileToken);
			    StringTokenizer st1=new StringTokenizer(fileToken,"=");
	            while(st1.hasMoreElements())
				{
					Filename=st1.nextToken();
					
				}

	            Filename=Filename.replace("\"", "");


	            FileOutputStream fout=new FileOutputStream(savePath+Filename);
	            int i=0;
	            while((i=bf.read())!=-1)
	            {
	            	fout.write(i);
	            }
	            fout.close();
			}
		else{
	    	Filename="default.jpg";
		}
		 
		 Members obj=new Members();
		 obj.setName(uname);
		 obj.setPassword(pwd);
		 obj.setEmail(email);
		 obj.setDob(dob);
		 obj.setGender(gender);
		 obj.setPhone(contact);
		 obj.setAddress(address);
		 obj.setPrivilege(privilege);
		 obj.setPic(Filename);
		 
		 
		 String sql="insert into members(name,pwd,email,dob,contact,gender,address,privilege,pic)values(?,?,?,?,?,?,?,?,?)";
	     AdminDAO oo=new AdminDAO();
	     String msg=oo.InsertNewMember(obj, sql);
	     if(msg.equals("success"))
	     {
	    	 response.sendRedirect("login.jsp");
	     }
	     else
	     {
	    	 response.sendRedirect("login.jsp?error=FAIL TO INSERT RECORD");
	     }
	
	
	}

}
