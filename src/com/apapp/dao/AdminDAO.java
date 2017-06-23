package com.apapp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.apapp.model.*;

public class AdminDAO {
	public static Connection con=null;
	public final static String url="jdbc:mysql://us-cdbr-sl-dfw-01.cleardb.net/ibmx_10a303f33d2cfe4?user=bdc2418f3faab2&password=dc4ba046";
	//jdbc:db2://localhost:50000/CAB
	//jdbc:mysql://localhost:3306/CAB
	public final static String username="bdc2418f3faab2";  //username
	public final static String password="dc4ba046";  //password
	public static String driver="com.mysql.jdbc.Driver";
	//com.ibm.db2.jcc.DB2Driver
	// com.mysql.jdbc.Driver		
	PreparedStatement ps=null;	
	static
	{
		try
		{
			Class.forName(driver);
			con=DriverManager.getConnection(url,username,password);
			System.out.println("connection success");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
public String UpdateUserPic(String file, String email, String sql){
	try{
		ps=con.prepareStatement(sql);
		ps.setString(1, file);
		ps.setString(2,email);
		int i=ps.executeUpdate();
		if(i==1){
			return "success";
		}
		else{
			return "fail";
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	return "";
}

public String InsertNewMember(Members obj,String sql){
	try{
//String sql="insert into members(name,pwd,email,dob,contact,gender,address,privilege)values(?,?,?,?,?,?,?,?)";	    		
		ps=con.prepareStatement(sql);
		ps.setString(1, obj.getName());
		ps.setString(2, obj.getPassword());
		ps.setString(3, obj.getEmail());
		ps.setString(4, obj.getDob());
		ps.setString(5, obj.getPhone());
		ps.setString(6, obj.getGender());
		ps.setString(7, obj.getAddress());
		ps.setString(9, obj.getPic());
		ps.setInt(8, obj.getPrivilege());
		int i=ps.executeUpdate();
		if(i==1){
			return "success";
		}
		else{
			return "fail";
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	return "";
}

public String UpdateMember(Members obj,String sql){
	try{
		ps=con.prepareStatement(sql);
		ps.setString(1, obj.getName());
		ps.setString(2, obj.getDob());
		ps.setString(3, obj.getPhone());
		ps.setString(4, obj.getAddress());
		ps.setString(5, obj.getEmail());
		int i=ps.executeUpdate();
		if(i==1){
			return "success";
		}
		else{
			return "fail";
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	return "";
}

public String InsertNewPlace(Place obj,String sql){
	try{
//insert into places(name,address,station,otime, ctime, odays, entry, category)values(?,?,?,?,?,?,?,?)
		ps=con.prepareStatement(sql);
		ps.setString(1, obj.getName());
		ps.setString(2, obj.getAddress());
		ps.setString(3, obj.getStation());
		ps.setString(4, obj.getOtime());
		ps.setString(5, obj.getCtime());
		ps.setString(6, obj.getOdays());
		ps.setString(7, obj.getEntry());
		ps.setString(8, obj.getCategory());
		ps.setString(9, obj.getPic());
		int i=ps.executeUpdate();
		if(i==1){
			return "success";
		}
		else{
			return "fail";
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	return "";
}

public String InsertNewMarket(Market obj,String sql){
	try{
		ps=con.prepareStatement(sql);
		ps.setString(1, obj.getName());
		ps.setString(2, obj.getAddress());
		ps.setString(3, obj.getStation());
		ps.setString(4, obj.getOtime());
		ps.setString(5, obj.getCtime());
		ps.setString(6, obj.getOdays());
		ps.setString(7, obj.getSpeciality());
		ps.setString(8, obj.getPic());
		int i=ps.executeUpdate();
		if(i==1){
			return "success";
		}
		else{
			return "fail";
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	return "";
}

public String InsertNewEvent(Event obj,String sql){
	try{
		ps=con.prepareStatement(sql);
		ps.setString(1, obj.getName());
		ps.setString(2, obj.getVenue());
		ps.setString(3, obj.getPhone());
		ps.setString(4, obj.getStime());
		ps.setString(5, obj.getEtime());
		ps.setString(6, obj.getSdate());
		ps.setString(7, obj.getEdate());
		ps.setInt(8, obj.getCost());
		ps.setInt(9, obj.getMax());
		ps.setString(10, obj.getCategory());
		ps.setString(11, obj.getPic());
		ps.setString(12, obj.getLink());
		int i=ps.executeUpdate();
		if(i==1){
			return "success";
		}
		else{
			return "fail";
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	return "";
}

public String InsertNewRestaurant(Restaurant obj,String sql){
	try{

//name,address,phone,openingtime,closingtime,cost,freewifi,livemusic,livesport,open7days,card,paytm,smoking,bar,cuisine)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		ps=con.prepareStatement(sql);
		ps.setString(1, obj.getName());
		ps.setString(2, obj.getAddress());
		ps.setString(3, obj.getPhone());
		ps.setString(4, obj.getOpening());
		ps.setString(5, obj.getClosing());
		ps.setString(6, obj.getCost());
		ps.setBoolean(7, obj.isFreeWifi());
		ps.setBoolean(8, obj.isLiveMusic());
		ps.setBoolean(9, obj.isSportScreening());
		ps.setBoolean(10, obj.isOpen());
		ps.setBoolean(11, obj.isCard());
		ps.setBoolean(12, obj.isPaytm());
		ps.setBoolean(13, obj.isSmokingArea());
		ps.setBoolean(14, obj.isBar());
		ps.setString(15, obj.getCuisine());
		ps.setString(16, obj.getPic());
		ps.setInt(17, obj.getCapacity());
		int i=ps.executeUpdate();
		if(i==1){
			return "success";
		}
		else{
			return "fail";
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	return "";
}

/*public String GetPic(String email, String sql) {
	String picname="";
	try
	{
		ps=con.prepareStatement(sql);
		ps.setString(1, email);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			picname=rs.getString(1);
		}	
	}catch(Exception e){
		e.printStackTrace();
	}
	return picname;
	
}*/

public ResultSet GetDetails(String email, String sql) {
	try
	{
		ps=con.prepareStatement(sql);
		ps.setString(1, email);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			return rs;
		}	
	}catch(Exception e){
		e.printStackTrace();
	}
	return null;
	
}

public ResultSet GetAllDetails(String sql) {
	try
	{
		ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		if(rs!=null)
		{
			return rs;
		}	
	}catch(Exception e){
		e.printStackTrace();
	}
	return null;
	
}
	
public String ValidateUser(Members obj, String sql){
		
	try{
		ps=con.prepareStatement(sql);
		ps.setString(1, obj.getEmail());
		ps.setString(2, obj.getPassword());
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			return "success";
		}
		else
		{
			return "fail";
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return "";
	}

public String DeleteUser(int id, String sql){
	
	try{
		ps=con.prepareStatement(sql);
		ps.setInt(1, id);
		int i=ps.executeUpdate();
		if(i==1)
		{
			return "success";
		}
		else
		{
			return "fail";
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return "";
	}

public String attend(int uid, int eid, String sql){
	
	try{
		ps=con.prepareStatement(sql);
		ps.setInt(1, uid);
		ps.setInt(2, eid);
		int i=ps.executeUpdate();
		if(i==1)
		{
			return "success";
		}
		else
		{
			return "fail";
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return "";
	}

public ResultSet searchDetails(String keyword, String sql){
	ResultSet rs=null;
	try{
		ps=con.prepareStatement(sql);
		ps.setString(1, keyword);
		rs=ps.executeQuery();
		if(rs!=null){
			return rs;
		}
		else{
			System.out.println("error");
			return null;
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	return rs;
}

public String newOrder(Order obj,String sql){
	try{
		ps=con.prepareStatement(sql);
		ps.setInt(1, obj.getRestid());
		ps.setString(2, obj.getBemail());
		ps.setString(3, obj.getDate());
		ps.setString(4, obj.getTo());
		ps.setString(5, obj.getFrom());
		ps.setInt(6, obj.getNop());
		int i=ps.executeUpdate();
		if(i==1){
			return "success";
		}
		else{
			return "fail";
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	return "";
}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}


