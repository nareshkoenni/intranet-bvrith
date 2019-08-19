package s;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class Test {

	public static void main(String[] args) throws Exception {
		Context initContext  = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        DataSource dataSource = (DataSource)envContext.lookup("jdbc/testmysql");
        Connection connection = dataSource.getConnection();
		
        Statement s = connection.createStatement();
		ResultSet rs=s.executeQuery("select Username, password from logindetails where Categeory!='Student' and Categeory!='Parent' ");
		while(rs.next()) {
			System.out.println(rs.getString("Username") +"\t"+rs.getString("password"));
		}
		connection.close();
	}

}
