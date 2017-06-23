package com.apapp.controller;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.apapp.dao.AdminDAO;
import com.apapp.model.Restaurant;

/**
 * Servlet implementation class NewRestaurantServlet
 */
@WebServlet("/NewRestaurantServlet")
@MultipartConfig
public class NewRestaurantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewRestaurantServlet() {
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
		String name=request.getParameter("rname");
		String contact=request.getParameter("phone");
		String address=request.getParameter("address");
		String cost=request.getParameter("cost");
		String cuisine=request.getParameter("cuisine");
		int cap=Integer.parseInt(request.getParameter("max"));
		String opentime=request.getParameter("opentime");
		String closetime=request.getParameter("closetime");
		Boolean open7days=request.getParameter("open")!=null;
		Boolean card=request.getParameter("card")!=null;
		Boolean paytm=request.getParameter("paytm")!=null;
		Boolean freewifi=request.getParameter("freewifi")!=null;
		Boolean livemusic=request.getParameter("music")!=null;
		Boolean livesport=request.getParameter("sports")!=null;
		Boolean bar=request.getParameter("bar")!=null;
		Boolean smoking=request.getParameter("smoking")!=null;


        String Filename="";
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		InputStream inputStream = null;
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
			
			String header=filePart.getHeader("content-disposition");
			StringTokenizer st=new StringTokenizer(header,";");
			String fileToken=""; 
			while(st.hasMoreElements())
			{
				fileToken=st.nextToken();
			}
		    out.println(fileToken);
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

		 System.out.println(Filename);
		 Restaurant obj=new Restaurant();
		 obj.setName(name);
		 obj.setPhone(contact);
		 obj.setAddress(address);
		 obj.setCost(cost);
		 obj.setBar(bar);
		 obj.setCard(card);
		 obj.setClosing(closetime);
		 obj.setPaytm(paytm);
		 obj.setCuisine(cuisine);
		 obj.setFreeWifi(freewifi);
		 obj.setLiveMusic(livemusic);
		 obj.setOpen(open7days);
		 obj.setSmokingArea(smoking);
		 obj.setSportScreening(livesport);
		 obj.setOpening(opentime);
		 obj.setPic(Filename);
		 obj.setCapacity(cap);
		 
		 
		 
		 String sql="insert into restaurants(name,address,phone,openingtime,closingtime,cost,freewifi,livemusic,livesport,open7days,card,paytm,smoking,bar,cuisine,pic,maxpeople)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	     AdminDAO oo=new AdminDAO();
	     String msg=oo.InsertNewRestaurant(obj, sql);
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
