package sql_services;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;



public class MySQLConnectionTemplate {
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cnpm_qlvpgt?autoReconnect=true&useSSL=false", "root", "B@nhbaiibu19");
	    return con;
	}

}
