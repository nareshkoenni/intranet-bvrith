package s;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtility {
	private static Connection connection = null;

	public static Connection getConnection() throws Exception {
		if (connection != null)
			return connection;
		else {
			// Store the database URL in a string
			String dbUrl = "jdbc:mysql://localhost:3306/feedback";
					
			Class.forName("com.mysql.jdbc.Driver");

			// set the url, username and password for the databse
			connection = DriverManager.getConnection(dbUrl, "root","root");
			return connection;
		}
	}
}