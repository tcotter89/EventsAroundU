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
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventsaroundu", "root", "5945");
			
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
