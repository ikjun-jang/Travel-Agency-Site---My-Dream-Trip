package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.eventVO;

public class eventDAO {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer(); 
		
		public eventDAO(){
			conn = MakeConnection.getInstance().getConnection();
		}
		
		public ArrayList<eventVO> selectAll(){
			ArrayList<eventVO> list = new ArrayList<eventVO>();
			sb.setLength(0);
			sb.append("SELECT * ");
			sb.append("FROM TRIP_EVENT ");
			
			try {
				pstmt=conn.prepareStatement(sb.toString());
				rs=pstmt.executeQuery();
				while(rs.next()){
					eventVO vo = new eventVO(rs.getString("title"),
							rs.getString("content"), rs.getString("period"), rs.getInt("price"), rs.getInt("dcprice"), rs.getInt("packagenum"));
					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		} // selectAll() end
}
