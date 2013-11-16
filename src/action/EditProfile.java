package action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import org.apache.struts2.ServletActionContext;

import databasemanager.ConnToDB;

public class EditProfile extends HttpServlet{

	private String username;
	private String password;
	private String userrealname;
	private String useremail;
	private String usergender;
	private String userphone;
	private String useraddr;
	private Timestamp registertime;
	private Connection connection;
	private Statement statement;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession(true);
	
	public String RunEditProfile()throws SQLException{
		getFields();
		return saveUserData();
	}
	
	private void getFields(){
		username = (String) session.getAttribute("username");
		password = request.getParameter("password");
		userrealname = request.getParameter("userrealname");
		useremail = request.getParameter("useremail");
		usergender = request.getParameter("usergender");
		userphone = request.getParameter("userphone");
		useraddr = request.getParameter("useraddr");
		registertime = new Timestamp(System.currentTimeMillis());
	}
	
	private String saveUserData ()throws SQLException{
		try {
			//connection to DB
			ConnToDB connToDB = new ConnToDB();
			connection = connToDB.getConnection();
			
			//execute the SQL sentence
			String updateSqlString = "UPDATE user " +
									 "SET user_password = '"+password+"'," +
										 "user_username = '"+userrealname+"'," +
										    "user_email = '"+useremail+"'," +
										   "user_gender = '"+usergender+"'," +
											"user_phone = '"+userphone+"'," +
										  "user_address = '"+useraddr+"'," +
										  "user_picture = 0," +
								    "user_register_time = '"+registertime+"'" +
									"WHERE user_name='"+username+"'";
			System.out.println(updateSqlString);
			
			statement = connection.createStatement();
			statement.execute(updateSqlString);
			
			//release resource
			statement.close();
			connection.close();
			System.out.println("User data updated successfully");
			return "success";
		} catch (Exception e) {
			return "failure";
		}
 	}
	
}
