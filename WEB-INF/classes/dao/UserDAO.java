package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.UserVO;

public class UserDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	
	public UserDAO(){
		conn = MakeConnection.getInstance().getConnection();
	}
	
	public ArrayList<UserVO> selectAll(){
		ArrayList<UserVO> list = new ArrayList<UserVO>();
		
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_user ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list.add(new UserVO(rs.getString("id"), rs.getString("name"),
						rs.getString("password"),rs.getInt("birthnum"),rs.getString("phone"),
						rs.getInt("sex"),rs.getInt("married"),rs.getString("email"),rs.getString("question"),
						rs.getString("answer")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public void insertOne(UserVO vo){
		
		sb.setLength(0);
		sb.append("INSERT INTO trip_user ");
		sb.append("VALUES(?,?,?,?,?,?,?,?,?,?) ");
		
		try {
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1,vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPassword());
			pstmt.setInt(4, vo.getBirthNum());
			pstmt.setString(5, vo.getPhone());
			pstmt.setInt(6, vo.getSex());
			pstmt.setInt(7, vo.getMarried());
			pstmt.setString(8, vo.getEmail());
			pstmt.setString(9, vo.getQuestion());
			pstmt.setString(10, vo.getAnswer());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public UserVO selectOne(String id){
		UserVO vo = null;
		
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_user ");
		sb.append("WHERE id = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				vo = new UserVO(id, rs.getString("name"), rs.getString("password"),
						rs.getInt("birthnum"),rs.getString("phone"),rs.getInt("sex"),
						rs.getInt("married"),rs.getString("email"),rs.getString("question"),
						rs.getString("answer"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return vo;
	}
	
	public UserVO selectId(int birthnum, String email){
		UserVO vo = null;
		
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_user ");
		sb.append("WHERE birthnum = ? AND email = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, birthnum);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				vo = new UserVO(rs.getString("id"),rs.getString("name"),rs.getString("password"),
						birthnum,rs.getString("phone"),rs.getInt("sex"),
						rs.getInt("married"),email,rs.getString("question"),
						rs.getString("answer"));
			}
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println("ID가 존재하지 않습니다.");
		}
		
		
		return vo;
	}
	
	public boolean checkId(String id){
		
		boolean result = false;
		
		sb.setLength(0);
		sb.append("SELECT id ");
		sb.append("FROM trip_user ");
		sb.append("WHERE id = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = true;
			}
			else{
				result = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	public String checkPw(String id){
		
		//boolean result = false;
		String pw = null;
		
		sb.setLength(0);
		sb.append("SELECT password ");
		sb.append("FROM trip_user ");
		sb.append("WHERE id = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				pw = rs.getString("password");
			}
			else{
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return pw;
	}
	
	public void updatePw(String id, String password){
		sb.setLength(0);
		sb.append("UPDATE trip_user ");
		sb.append("SET password = ? ");
		sb.append("WHERE id = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, password);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void updateOne(UserVO vo){
		
		sb.setLength(0);
		sb.append("update trip_user ");
		sb.append("set name=?, password=?, birthnum=?, phone=?, sex=?, married=?, email=?, question=?, answer=? where id=? ");

		try {
			
			pstmt = conn.prepareStatement(sb.toString());			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPassword());
			pstmt.setInt(3, vo.getBirthNum());
			pstmt.setString(4, vo.getPhone());
			pstmt.setInt(5, vo.getSex());
			pstmt.setInt(6, vo.getMarried());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getQuestion());
			pstmt.setString(9, vo.getAnswer());
			pstmt.setString(10, vo.getId());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
