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


/**
 * 
 * This class is to add register to database
 *
 */
public class Register extends HttpServlet{
	
	private String register_username;
	private String register_password;
	private String register_userrealname;
	private String register_useremail;
	private String register_usergender;
	private String register_userphone;
	private String register_useraddr;
	private Timestamp register_registertime;
	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;

	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	
	/**
	 * 
	 * This method is called when user register
	 */
	
	public String RunRegister()throws SQLException{
		
		getParameter();
		Connection();
		
		return "success";
	}
	
	/**
	 * This method is get the parameter from index.jsp which for the register
	 */
	private void getParameter(){
		register_username = request.getParameter("username");
		register_password = request.getParameter("password");
		register_userrealname = request.getParameter("userrealname");
		register_useremail = request.getParameter("useremail");
		register_usergender = request.getParameter("usergender");
		register_userphone = request.getParameter("userphone");
		register_useraddr = request.getParameter("useraddr");
		//get the system date
//		SimpleDateFormat dfDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		register_registertime = new Date();
		register_registertime = new Timestamp(System.currentTimeMillis());
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
		if (duplicateUserCheck() == false) {
			//execute the SQL sentence

			System.out.println("insert into user (user_name,user_password,user_username,user_email,user_gender,user_phone,user_address,user_picture,user_register_time) values ('"+register_username+"','"+register_password+"',0,'"+register_useremail+"','"+register_usergender+"','"+register_userphone+"','"+register_useraddr+"',0,'"+register_registertime+"')");
			String insertSqlString = "insert into user (user_name,user_password,user_username,user_email,user_gender,user_phone,user_address,user_picture,user_register_time) values ('"+register_username+"','"+register_password+"',0,'"+register_useremail+"','"+register_usergender+"','"+register_userphone+"','"+register_useraddr+"',0,'"+register_registertime+"')";

			statement = connection.createStatement();
			statement.execute(insertSqlString);
			
			//to show the all table
//			String querySqlString = "select * from user";
//			statement = connection.createStatement();
//			resultSet = statement.executeQuery(querySqlString);
//			while (resultSet.next()) {
//				for (int i = 1; i <=10; i++) {
//					System.out.printf("%-8s\t", resultSet.getString(i));
//				}
//				
//			}
			
			//release resource
			resultSet.close();
			statement.close();
			connection.close();
			System.out.println("User added successfully");
		}
		else {
			System.out.println("User already exists");
		}
	}
	/**
	 * This method is to check the duplicate user register.
	 * @return
	 * @throws SQLException
	 */
	private boolean duplicateUserCheck ()throws SQLException{
		ConnToDB ctd = new ConnToDB();
		connection = ctd.getConnection();
		statement = connection.createStatement();
		int rowCount = 0;
		resultSet = statement.executeQuery("select count(*) AS 'Count' from user where user_name = '"
				+ register_username + "'");
		if (resultSet.next()) {
			//System.out.println("field: " + resultSet.getInt("Count"));
			rowCount = resultSet.getInt("Count");
			//System.out.println("rowCount:" + rowCount);
			if (rowCount == 0) {
				System.out.println("not duplicate");
				return false;
			} else {
				System.out.println("is duplicate");
				return true;
			}
		} else {
			System.out.println("is duplicate, no result");
			return false;
		}
	}
	
}
