package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BoardReVO;

public class BoardReDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	
	public BoardReDAO(){
		conn = MakeConnection.getInstance().getConnection();
	}
	
	public ArrayList<BoardReVO> selectAll(){
		ArrayList<BoardReVO> list = new ArrayList<BoardReVO>();
		
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_board_re ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list.add(new BoardReVO(rs.getInt("rno"),rs.getInt("bno"), rs.getString("id"), 
						rs.getString("wdate"),rs.getString("content"),rs.getInt("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
}
