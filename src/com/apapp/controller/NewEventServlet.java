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
import com.apapp.model.Event;

/**
 * Servlet implementation class NewEventServlet
 */
@WebServlet("/NewEventServlet")
@MultipartConfig
public class NewEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewEventServlet() {
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
		
System.out.println("here");
		String name=request.getParameter("name");
		String venue=request.getParameter("address");
		String phone=request.getParameter("phone");
		String stime=request.getParameter("otime");
		String etime=request.getParameter("ctime");
		String sdate=request.getParameter("oday");
		String edate=request.getParameter("eday");
		String link=request.getParameter("link");
		String category=request.getParameter("category");
		int cost=100;//Integer.parseInt(request.getParameter("entry"));
		int max=100;Integer.parseInt(request.getParameter("cap"));
		
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
		
		Event event = new Event();
		event.setName(name);
		event.setPhone(phone);
		event.setCategory(category);
		event.setVenue(venue);
		event.setCost(cost);
		event.setEdate(edate);
		event.setEtime(etime);
		event.setLink(link);
		event.setMax(max);
		event.setPic(Filename);
		event.setSdate(sdate);
		event.setStime(stime);
		
		System.out.println("<p>"+name+phone+category+venue+cost+edate+etime+link+max+Filename+sdate+stime+"</p>");
		
		String sql="insert into events(name, venue, phone,fromtime,totime,fromdate,todate,cost,maxpeople,category,pic,link)values(?,?,?,?,?,?,?,?,?,?,?,?)";
		AdminDAO o=new AdminDAO();
		String msg=o.InsertNewEvent(event,sql);

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
