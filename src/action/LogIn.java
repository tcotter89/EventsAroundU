package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import databasemanager.ConnToDB;

public class Login extends HttpServlet{
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

		ConnToDB ctd = new ConnToDB();
		conn = ctd.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from user where user_username = '"
				+ username + "'");
		if (rs.next()) {
			DBpassword = rs.getString("user_password");

			if (DBpassword.equals(password)) {
				System.out.println("password is right");
	

				
				return "login_success";
			} else {
				return "login_fail";
			}

		} else {
			return "login_fail";
		}
		
		
	}
}

