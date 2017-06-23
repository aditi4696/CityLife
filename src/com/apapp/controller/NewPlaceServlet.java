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
import com.apapp.model.Place;

/**
 * Servlet implementation class NewPlaceServlet
 */
@WebServlet("/NewPlaceServlet")
@MultipartConfig
public class NewPlaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPlaceServlet() {
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
		
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String station=request.getParameter("station");
		String otime=request.getParameter("otime");
		String ctime=request.getParameter("ctime");
		String oday=request.getParameter("days");
		String today=request.getParameter("todays");
		String odays=oday+" to "+today;
		String entry=request.getParameter("entry");
		String category=request.getParameter("category");
		
		String Filename="";
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
		
		Place obj= new Place();
		obj.setName(name);
		obj.setAddress(address);
		obj.setStation(station);
		obj.setOtime(otime);
		obj.setCtime(ctime);
		obj.setOdays(odays);
		obj.setEntry(entry);
		obj.setCategory(category);
		obj.setPic(Filename);
		
		String sql="insert into places(name,address,station,otime, ctime, odays, entryfee, category,pic)values(?,?,?,?,?,?,?,?,?)";
		AdminDAO oo= new AdminDAO();
		String msg=oo.InsertNewPlace(obj, sql);
	     if(msg.equals("success"))
	     {
	    	 response.sendRedirect("uhome.jsp");
	     }
	     else
	     {
	    	 response.sendRedirect("uhome.jsp?error=FAIL TO INSERT RECORD");
	     }
		
	}

}
