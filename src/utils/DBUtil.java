package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	
	private static DBUtil instance;
	private String dirverClassName = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/reservations";
	private String user = "root";
	private String password = "123456";
	
	private DBUtil() {
		try {
			Class.forName(dirverClassName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static DBUtil getInstance(){
		if(instance  ==null){
			instance = new DBUtil();
		}
		return instance;
	}
	
	public Connection getConnection() throws SQLException{
		Connection conn =null;
		conn = DriverManager.getConnection(url,user,password);
		return conn;
	}
	
	public void free(Connection conn,PreparedStatement ps,ResultSet rs){
		try {
			if(rs!=null){
				rs.close();
			}
			if(ps!=null){
				ps.close();
			}
			if(conn!=null){
				conn.close();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
}
