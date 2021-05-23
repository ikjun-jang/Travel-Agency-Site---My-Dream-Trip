package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CityVO;
import dao.MakeConnection;

public class CityDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	public CityDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<CityVO> selectAll() {
		ArrayList<CityVO> list = new ArrayList<CityVO>();
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_city ");
		sb.append("ORDER BY citynum ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CityVO vo = new CityVO(rs.getInt("citynum"),
						rs.getString("cityname"), rs.getString("img"),
						rs.getInt("countryno"), rs.getString("bigimg"));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<CityVO> selectAll(int countryNo) {
		ArrayList<CityVO> list = new ArrayList<CityVO>();
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_city ");
		sb.append("WHERE countryno=? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, countryNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CityVO vo = new CityVO(rs.getInt("citynum"),
						rs.getString("cityname"), rs.getString("img"),
						rs.getInt("countryno"), rs.getString("bigimg"));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public CityVO selectOne(int cityNum) {
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_city ");
		sb.append("WHERE citynum = ? ");
		CityVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, cityNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new CityVO(rs.getInt("citynum"), rs.getString("cityname"),
						rs.getString("img"), rs.getInt("countryno"), rs.getString("bigimg"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	public int search(String keyword){
		
		int cityNum = 0;
		
		sb.setLength(0);
		sb.append("SELECT citynum ");
		sb.append("FROM trip_city ");
		sb.append("WHERE cityname like ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, "%"+keyword+"%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cityNum = rs.getInt("citynum");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cityNum;
		
	}
	
}
