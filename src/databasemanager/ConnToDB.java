package databasemanager;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 * 

 *
 */

public class ConnToDB {
	
	private Connection connection=null;
	
	/**
	 * 
	 * This method is to connect to the database 
	 * @author Ang Li
	 * @return connection- the object of connection
	 */
	
	public Connection getConnection(){
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:MySQL://tomsgamelaptop:3306/eventsaroundu?useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true","root","admin");
			
			if (!connection.isClosed()) {
				System.out.println("Succeed to connect the database!!");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry can't find the Drvier!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("There is SQLException!");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	

}
