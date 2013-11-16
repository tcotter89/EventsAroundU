package action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.struts2.ServletActionContext;

import databasemanager.ConnToDB;

public class Login extends HttpServlet{
	/**
	 * 
	 */	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String DBpassword = null;
	private String username;
	private String password;
	
	
	HttpServletRequest request = ServletActionContext.getRequest();

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public String TestUser() throws SQLException{
		HttpSession session = request.getSession(true);
		session.setAttribute("username", username);
		
		//System.out.println("111111111111111111111111111111111111");
		ConnToDB ctd = new ConnToDB();
		conn = ctd.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from user where user_name = '"
				+ username + "'");
		System.out.println("select * from user where user_name = '"
				+ username + "'");
		if (rs.next()) {
			//System.out.println("2222222222222222222222222222222222222222");
			DBpassword = rs.getString("user_password");
			
			if (DBpassword.equals(password)) {
				System.out.println("password is right");
				return "login_success";
			} else {
				System.out.println("Password is incorrect");
				return "login_fail";
			}

		} else {
			return "login_fail";
		}
		//return "login_success";
	}
}

