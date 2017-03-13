package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class DBClass {
	Connection cn;
	Statement st;
	public DBClass() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			cn=DriverManager.getConnection("jdbc:mysql://localhost/ParkDB","root","root");
			st=cn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void execute(String sql) throws SQLException
	{
		st.executeUpdate(sql);
	}
	public ResultSet getData(String sql) throws SQLException
	{
		ResultSet rs=st.executeQuery(sql);
		return rs;
	}	
	
	

}
