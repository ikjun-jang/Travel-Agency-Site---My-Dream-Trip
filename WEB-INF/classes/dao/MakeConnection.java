package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// static한 자기 자신의 멤버변수를 가짐
// get instance라는 명령어로 자기자신을 리턴
// 외부에서 못만들게 private
public class MakeConnection {
	
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@192.168.0.96:1521:orcl";
	private String user = "scott";
	private String password = "tiger";
	private Connection conn = null;
	private MakeConnection(){
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url,user,password);
			System.out.println("conn : " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("DB연결 실패");
		}
	}
	private static final MakeConnection instance = new MakeConnection();
		
	public static MakeConnection getInstance(){
		return instance;
	}
	public Connection getConnection(){
		return conn;
	}
	
	
}
