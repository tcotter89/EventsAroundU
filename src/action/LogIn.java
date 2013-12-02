package action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.struts2.ServletActionContext;

import databasemanager.ConnToDB;

public class Login extends HttpServlet{
	/**
	 * 
	 */	
	Connection conn = null;
	Statement stmt = null;
	Statement stmtm = null;
	ResultSet rs = null;
	ResultSet rsm = null;//for markers
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
		

		ConnToDB ctd = new ConnToDB();
		conn = ctd.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from user where user_name = '"
				+ username + "'");
		System.out.println("select * from user where user_name = '"
				+ username + "'");
		if (rs.next()) {
			DBpassword = rs.getString("user_password");
			
			if (DBpassword.equals(password)) {
				System.out.println("password is right");
				
				ArrayList rows = new ArrayList();
				stmtm = conn.createStatement();
				rsm = stmtm
				.executeQuery("select * from marker order by ID desc limit 5");
				HashMap row = new HashMap();
				if(rsm.next()==false){
					rows.add(row);
					row = new HashMap();
				} else {
					do {
//						System.out.println(rsm.getString(2));
//						System.out.println(rsm.getString(3));
//						System.out.println(rsm.getString(4));
//						System.out.println(rsm.getString(5));
//						System.out.println(rsm.getString(6));
//						System.out.println(rsm.getString(7));
						
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
					
				return "login_success";
				
			}else {
				System.out.println("Password is incorrect");
				return "login_fail";
			}

		} else {
			return "login_fail";
		}
	}
	
	public static void main(String[] args) throws SQLException{
		Login lg= new Login();
		String ss = lg.TestUser();
	}
}

