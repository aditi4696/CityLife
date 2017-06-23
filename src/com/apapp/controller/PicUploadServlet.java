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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.apapp.dao.AdminDAO;

/**
 * Servlet implementation class PicUploadServlet
 */
@WebServlet("/PicUploadServlet")
@MultipartConfig
public class PicUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PicUploadServlet() {
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

	                
	                String sql="update members set pic=? where email=?";
	                AdminDAO obj=new AdminDAO();
	                HttpSession session=request.getSession();
	                String email=session.getAttribute("user").toString();
	                String msg=obj.UpdateUserPic(pic, email, sql);
	                if(msg.equals("success"))
	                {
	                	response.sendRedirect("uhome.jsp");
	                }
	                else
	                {
	                	response.sendRedirect("uhome.jsp?val=failed to update profile picture");
	                }
	      }
	}

