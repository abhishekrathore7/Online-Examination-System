package db;

import java.sql.*;


public class Provider{

public static Connection getOracleConnection()
  {

	Connection conn=null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/OnlineExam?characterEncoding=latin1&useConfigs=maxPerformance","root","Rathore@123");
	}
    catch(Exception e)
    {
    	e.printStackTrace();
    }
return conn;
  }

}
