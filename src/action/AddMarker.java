package action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.*;
import org.apache.struts2.ServletActionContext;
import databasemanager.*;
//import java.util.*;
//import java.util.Date;
//import java.text.SimpleDateFormat;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;


public class AddMarker extends HttpServlet{
	
	private String marker_title;
	private String marker_description;
	private Timestamp marker_time;
	private String marker_creat_user;
	private String marker_location;
	private String marker_longitude;
	private String marker_latitude;
	private String marker_event_type;

	
	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;
	
	Statement stmtm = null;
	ResultSet rsm = null;
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	
	
	public String Runaddmarker()throws SQLException{
		
		getParameter();
		Connection();
		
		return "success";
	}
	
	/**
	 * This method is get the parameter from index.jsp which for the register
	 */
	private void getParameter(){
		marker_title = request.getParameter("title");
		marker_description = request.getParameter("html");
		marker_creat_user = request.getParameter("username");
//		marker_event_type = request.getParameter("");
		marker_location = request.getParameter("latlnginfo");
		
	
		String[] fenge = marker_location.split("[(,)]");
		marker_longitude = fenge[1];
		marker_latitude = fenge[2];
		
		

		//get the system date
//		SimpleDateFormat dfDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		register_registertime = new Date();
		marker_time = new Timestamp(System.currentTimeMillis());
//		Date date = new Date();
//		register_registertime = new Date(date.getTime());

	}
	
	 
	
	
	
		
	
	
	/**
	 * This method is connect to the DB and insert records into DB
	 */
	private void Connection ()throws SQLException{
		//connection to DB
		ConnToDB connToDB = new ConnToDB();
		connection = connToDB.getConnection();
		
		///check for duplicate user before inserting
		
			//execute the SQL sentence

			System.out.println("insert into marker (title,description,time,creat_user,longitude,latitude,event_type) values ('"+marker_title+"','"+marker_description+"','"+marker_time+"','"+marker_creat_user+"','"+marker_longitude+"','"+marker_latitude+"','"+marker_event_type+"')");
			String insertSqlString = "insert into marker (title,description,time,creat_user,longitude,latitude,event_type) values ('"+marker_title+"','"+marker_description+"','"+marker_time+"','"+marker_creat_user+"','"+marker_longitude+"','"+marker_latitude+"','"+marker_event_type+"')";

			statement = connection.createStatement();
			statement.execute(insertSqlString);
			
			ArrayList rows = new ArrayList();
			stmtm = connection.createStatement();
			rsm = stmtm
			.executeQuery("select * from marker order by ID desc limit 5");
			HashMap row = new HashMap();
			if(rsm.next()==false){
				rows.add(row);
				row = new HashMap();
			} else {
				do {
//					System.out.println(rsm.getString(2));
//					System.out.println(rsm.getString(3));
//					System.out.println(rsm.getString(4));
//					System.out.println(rsm.getString(5));
//					System.out.println(rsm.getString(6));
//					System.out.println(rsm.getString(7));
					
					row.put("title", rsm.getObject(2));
					row.put("desc", rsm.getObject(3));
					row.put("time", rsm.getObject(4));
					row.put("user", rsm.getObject(5));
					row.put("lng", rsm.getObject(6));
					row.put("lat", rsm.getObject(7));
					
					rows.add(row);
					row = new HashMap();
					
				}while (rsm.next());
			}													
				request.setAttribute("news", rows);
			//to show the all table
//			String querySqlString = "select * from marker";
//			statement = connection.createStatement();
//			resultSet = statement.executeQuery(querySqlString);
//			while (resultSet.next()) {
//				for (int i = 1; i <=8; i++) {
//					System.out.printf("%-8s\t", resultSet.getString(i));
//				}
//				
//			}
			
			//release resource
			//resultSet.close();
			//statement.close();
			//connection.close();
			System.out.println("User added successfully");
		}
	}

	
	



