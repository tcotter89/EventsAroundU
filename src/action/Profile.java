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
	HttpSession session = request.getSession(true);
	
	public String RunProfile()throws SQLException{
		//System.out.println(session.getAttribute("username"));
		getParameter();
		return getUserData();
	}
	
	private void getParameter(){
		username = (String) session.getAttribute("username");
	}
	
	private String getUserData ()throws SQLException{
		try {
			//connection to DB
			ConnToDB connToDB = new ConnToDB();
			connection = connToDB.getConnection();
			
			//execute the SQL sentence
			String findUserData = "select user_username from user where user_name='" + username + "'";
			System.out.println(findUserData);
	
			statement = connection.createStatement();
			resultSet = statement.executeQuery(findUserData);
			while (resultSet.next()) {
				for (int i = 1; i <=1; i++) {
					System.out.printf("%-8s\t", resultSet.getString(i));
				}
				userrealname = resultSet.getString(1);
			}
			
			//release resource
			resultSet.close();
			statement.close();
			connection.close();
			System.out.println("User " + username + " data loaded successfully");
			return "true";
		} catch (Exception e) {
			return "false";
		}
 	}
	
}
