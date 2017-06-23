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
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
@MultipartConfig
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
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
		
		if(request.getParameter("update")!=null){
			 String uname=request.getParameter("name");
			 String dob=request.getParameter("dob");
			 String contact=request.getParameter("contact");
			 String address=request.getParameter("address");
			 String email=request.getParameter("email");
			 InputStream inputStream = null;

				String pic="";
				String savePath = getServletContext().getRealPath("/")+"/images/";
				
				Part filePart = request.getPart("photo");
				if (filePart.getSize()!=0) {
					// debug messages
					System.out.println(filePart.getName());
					System.out.println(filePart.getSize());
					System.out.println(filePart.getContentType());

					// obtains input stream of the upload file
					inputStream = filePart.getInputStream();
					
					BufferedInputStream bf=new BufferedInputStream(inputStream);
					
					//********************************GETTING FILE NAME*****************************************
					String header=filePart.getHeader("content-disposition");
					StringTokenizer st=new StringTokenizer(header,";");
					String fileToken=""; 
					while(st.hasMoreElements())
					{
						fileToken=st.nextToken();
					}
				    System.out.println(fileToken);
				    StringTokenizer st1=new StringTokenizer(fileToken,"=");
		            String Filename="";
		            while(st1.hasMoreElements())
					{
						Filename=st1.nextToken();
						
					}
		            System.out.println("<h1>"+Filename+"</h1>");
		            Filename=Filename.replace("\"", "");
		            System.out.println("<h1>"+Filename+"</h1>");
		            pic = Filename;
		            //************************************************************************************
		            FileOutputStream fout=new FileOutputStream(savePath+Filename);
		            int i=0;
		            while((i=bf.read())!=-1)
		            {
		            	fout.write(i);
		            }
		            
		            	fout.close();	
				}
				else{
			    	pic="default.jpg";
				}
				
			 Members obj=new Members();
			 obj.setName(uname);
			 obj.setDob(dob);
			 obj.setPhone(contact);
			 obj.setAddress(address);
			 obj.setEmail(email);
			 
			 String sql="update members set name=?,dob=?,contact=?,address=? where email=?";
		     AdminDAO oo=new AdminDAO();
		     String msg=oo.UpdateMember(obj, sql);
		     if(msg.equals("success"))
		     {
		    	 sql="update members set pic=? where email=?";
		    	 msg=oo.UpdateUserPic(pic, email, sql);
		    	 if(msg.equals("success")){
			    	 response.sendRedirect("managepanel.jsp");
		    	 }
		    	 else{
		    		 response.sendRedirect("managepanel.jsp?error=FAILED TO INSERT RECORD");
		    	 }
		     }
		     else
		     {
		    	 response.sendRedirect("managepanel.jsp?error=FAILED TO INSERT RECORD");
		     }
	  	}
		
		else if(request.getParameter("delete")!=null){
		 AdminDAO obj=new AdminDAO();
		  String [] arr=request.getParameterValues("id");
		  String table=request.getParameter("table");
		  for(int i=0;i<arr.length;i++)
		  {
			  
			  String sql="delete from "+table+" where id=?";
			  int val=Integer.parseInt(arr[i]);
			  String msg=obj.DeleteUser(val, sql);
			  System.out.println(msg);
		  }
		  response.sendRedirect(request.getParameter("page"));
		}
	}

}
