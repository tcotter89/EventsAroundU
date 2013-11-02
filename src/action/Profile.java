package action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import org.apache.struts2.ServletActionContext;

import databasemanager.ConnToDB;

public class Profile extends HttpServlet{

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
	private ResultSet resultSet;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	
	public void RunProfile()throws SQLException{
		
		getParameter();
		getUserData();
	}
	
	private void getParameter(){
		username = request.getParameter("username");
	}
	
	private String getUserData ()throws SQLException{
		try {
			//connection to DB
			ConnToDB connToDB = new ConnToDB();
			connection = connToDB.getConnection();
			
			//execute the SQL sentence
			String findUserData = "select * from user where user_username='" + username + "'";
	
			statement = connection.createStatement();
			resultSet = statement.executeQuery(findUserData);
			while (resultSet.next()) {
				for (int i = 1; i <=10; i++) {
					System.out.printf("%-8s\t", resultSet.getString(i));
				}
			}
			
			//release resource
			resultSet.close();
			statement.close();
			connection.close();
			System.out.println("User data loaded successfully");
			return "true";
		} catch (Exception e) {
			return "false";
		}
 	}
	
}
