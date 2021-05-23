package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ReservationVO;
import vo.UserReservationVO;

public class ReservationDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	
	public ReservationDAO(){
		conn = MakeConnection.getInstance().getConnection();
	}
	
	public ArrayList<ReservationVO> selectAll(){
		ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();
		
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_reservation ");
		sb.append("ORDER BY startdate desc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list.add(new ReservationVO(rs.getInt("packagenum"), rs.getString("id"),rs.getInt("no"),
						rs.getInt("headcount"),rs.getString("startdate"),rs.getInt("votecheck"), rs.getInt("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<UserReservationVO> selectAll(String theID){
		ArrayList<UserReservationVO> list = new ArrayList<UserReservationVO>();
		
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_package natural join trip_reservation ");
		sb.append("WHERE ID=? ");
		sb.append("ORDER BY startdate desc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, theID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list.add(new UserReservationVO(rs.getString("img1"), rs.getString("title"),rs.getString("shortdesc"), rs.getInt("status"), 
						rs.getInt("historical"),rs.getInt("scenery"),rs.getInt("shopping"), rs.getInt("healing"), rs.getInt("voteGrade"), rs.getInt("price"), rs.getString("startdate"), rs.getInt("headcount"), rs.getString("id"),rs.getInt("no")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public ReservationVO selectOne(int rno){
		ReservationVO vo = new ReservationVO();
		
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_reservation ");
		sb.append("WHERE no = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, rno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
			vo.setAirInfo(rs.getString("airinfo"));
			vo.setHeadCount(rs.getInt("headcount"));
			vo.setHotelInfo(rs.getString("hotelinfo"));
			vo.setId(rs.getString("id"));
			vo.setNo(rs.getInt("no"));
			vo.setPackageNum(rs.getInt("packagenum"));
			vo.setStartDate(rs.getString("startdate"));
			vo.setStatus(rs.getInt("status"));
			vo.setVoteCheck(rs.getInt("votecheck"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public void insertOne(ReservationVO vo){
		sb.setLength(0);
		sb.append("INSERT INTO trip_reservation ");
		sb.append("values( ?, ?, reservation_no_seq.nextval, ");
		sb.append("?, ?, 0, 0, null, null ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getPackageNum());
			pstmt.setString(2,vo.getId());
			pstmt.setInt(3,vo.getHeadCount());
			pstmt.setString(4, vo.getStartDate());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void deleteOne(int no){
		sb.setLength(0);
		sb.append("delete trip_reservation ");
		sb.append("WHERE no=? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void updateOne(int no){
		sb.setLength(0);
		sb.append("update trip_reservation ");
		sb.append("SET status=3 ");
		sb.append("WHERE no=? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	public void updateVote(int no){
		sb.setLength(0);
		sb.append("update trip_reservation ");
		sb.append("SET votecheck=1 ");
		sb.append("WHERE no=? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	public void updateOne(int status, int no){
		sb.setLength(0);
		sb.append("update trip_reservation ");
		sb.append("SET status=? ");
		sb.append("WHERE no=? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, status);			
			pstmt.setInt(2, no);			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

}
