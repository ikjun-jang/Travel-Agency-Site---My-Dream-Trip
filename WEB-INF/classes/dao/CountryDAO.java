package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CountryVO;

public class CountryDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	
	public CountryDAO(){
		conn = MakeConnection.getInstance().getConnection();
	}
	
	public ArrayList<CountryVO> selectAll(){
		ArrayList<CountryVO> list = new ArrayList<CountryVO>();
		
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_country ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list.add(new CountryVO(rs.getInt("countryno"), rs.getString("name"),rs.getString("img"),
						rs.getString("backimg")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public CountryVO selectOne(int countryNo){
		CountryVO vo = new CountryVO();
		
		sb.setLength(0);
		sb.append("SELECT * FROM trip_country ");
		sb.append("WHERE countryno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, countryNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				vo.setCountryNo(countryNo);
				vo.setName(rs.getString("name"));
				vo.setImg(rs.getString("img"));
				vo.setBackImg(rs.getString("backimg"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return vo;
	}
	
	public int search(String keyword){
		
		int countryNo = 0;
		
		sb.setLength(0);
		sb.append("SELECT countryno ");
		sb.append("FROM trip_country ");
		sb.append("WHERE name like ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, "%"+keyword+"%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				countryNo = rs.getInt("countryno");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return countryNo;
		
	}
}
