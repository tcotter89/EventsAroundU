package databasemanager;
import java.sql.*;
/**
 * 
 * @author Ang Li
 * 
 */

public class DataBean {
	private String user_name;
	private String user_password;
	private String user_username;
	private String user_email;
	private String user_gender;
	private String user_phone;
	private String user_address;
	private Timestamp user_register_time;
	private int user_ID;
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String userName) {
		user_name = userName;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String userPassword) {
		user_password = userPassword;
	}
	public String getUser_username() {
		return user_username;
	}
	public void setUser_username(String userUsername) {
		user_username = userUsername;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String userEmail) {
		user_email = userEmail;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String userGender) {
		user_gender = userGender;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String userPhone) {
		user_phone = userPhone;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String userAddress) {
		user_address = userAddress;
	}
	public Timestamp getUser_register_time() {
		return user_register_time;
	}
	public void setUser_register_time(Timestamp userRegisterTime) {
		user_register_time = userRegisterTime;
	}
	public int getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(int userID) {
		user_ID = userID;
	}
	
	
	

}
