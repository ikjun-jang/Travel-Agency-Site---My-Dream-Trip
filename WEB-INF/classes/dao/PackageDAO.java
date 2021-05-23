package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.AdminPackageVO;
import vo.BoardVO;
import vo.CityVO;
import vo.PackageVO;

public class PackageDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	public PackageDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<PackageVO> selectAll(int cityNo) {
		ArrayList<PackageVO> list = new ArrayList<PackageVO>();
		sb.setLength(0);
		sb.append("SELECT packagenum, img1, title, delay, price, hits, votepeoplenum, votegrade, historical, scenery, shopping, healing, shortdesc ");
		sb.append("FROM trip_package ");
		sb.append("WHERE citynum = ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, cityNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int packageNum = rs.getInt("packagenum");
				String img1 = rs.getString("img1");
				String title = rs.getString("title");
				int delay = rs.getInt("delay");
				int price = rs.getInt("price");
				int hits = rs.getInt("hits");
				int votePeopleNum = rs.getInt("votepeoplenum");
				int voteGrade = rs.getInt("votegrade");
				int historical = rs.getInt("historical");
				int scenery = rs.getInt("scenery");
				int shopping = rs.getInt("shopping");
				int healing = rs.getInt("healing");
				String shortDesc = rs.getString("shortdesc");
				
				PackageVO vo = new PackageVO();
				vo.setPackageNum(packageNum);
				vo.setCityNum(cityNo);
				vo.setImg1(img1);
				vo.setTitle(title);
				vo.setDelay(delay);
				vo.setPrice(price);
				vo.setHits(hits);
				vo.setVotePeopleNum(votePeopleNum);
				vo.setVoteGrade(voteGrade);
				vo.setHistorical(historical);
				vo.setScenery(scenery);
				vo.setShopping(shopping);
				vo.setHealing(healing);
				vo.setShortDesc(shortDesc);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	public ArrayList<PackageVO> selectAll(int cityNo, int historical, int scenery, int shopping, int healing) {
		ArrayList<PackageVO> list = new ArrayList<PackageVO>();
		sb.setLength(0);
		sb.append("SELECT packagenum, img1, title, delay, price, hits, votepeoplenum, votegrade, historical, scenery, shopping, healing, shortdesc ");
		sb.append("FROM trip_package ");
		sb.append("WHERE citynum = ? and historical = ? and scenery = ? and shopping = ? and healing = ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, cityNo);
			pstmt.setInt(2, historical);
			pstmt.setInt(3, scenery);
			pstmt.setInt(4, shopping);
			pstmt.setInt(5, healing);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int packageNum = rs.getInt("packagenum");
				String img1 = rs.getString("img1");
				String title = rs.getString("title");
				int delay = rs.getInt("delay");
				int price = rs.getInt("price");
				int hits = rs.getInt("hits");
				int votePeopleNum = rs.getInt("votepeoplenum");
				int voteGrade = rs.getInt("votegrade");
				String shortDesc = rs.getString("shortdesc");
				PackageVO vo = new PackageVO(packageNum, img1, title, delay, price, hits, votePeopleNum, voteGrade, historical, scenery, shopping, healing, shortDesc);
				list.add(vo);
				System.out.println("리스트에 추가");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<AdminPackageVO> selectAll(String keyword, int start, int end){
		ArrayList<AdminPackageVO> list = new ArrayList<AdminPackageVO>();

		sb.setLength(0);
		sb.append("select rn, packagenum, cityname, title, shortdesc, delay, wdate, price, hits, votegrade ");
		sb.append("from (select rownum rn, packagenum, cityname, title, shortdesc, delay, wdate, price, hits, votegrade ");
		sb.append("from (select * from trip_package natural join trip_city where cityname like ? order by wdate desc) ");
		sb.append("where rownum<=?) ");
		sb.append("where rn>=? ");	

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				int packageNum = rs.getInt("packageNum");
				String cityname = rs.getString("cityname");
				String title = rs.getString("title");
				String shortdesc = rs.getString("shortdesc");
				int delay = rs.getInt("delay");
				String wdate = rs.getString("wdate");
				int price = rs.getInt("price");
				int hits = rs.getInt("hits");
				int voteGrade = rs.getInt("votegrade");
				AdminPackageVO vo = new AdminPackageVO(packageNum, cityname, title, shortdesc, delay, wdate, price, hits, voteGrade);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;		
	}
	
	public ArrayList<AdminPackageVO> selectAll(int start, int end){
		ArrayList<AdminPackageVO> list = new ArrayList<AdminPackageVO>();

		sb.setLength(0);
		sb.append("select rn, packagenum, cityname, img1, title, shortdesc, delay, wdate, price, hits, votegrade ");
		sb.append("from (select rownum rn, packagenum, cityname, img1, title, shortdesc, delay, wdate, price, hits, votegrade ");
		sb.append("from (select * from trip_package natural join trip_city order by wdate desc) ");
		sb.append("where rownum<=?) ");
		sb.append("where rn>=? ");	

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				int packageNum = rs.getInt("packageNum");
				String cityname = rs.getString("cityname");
				String img1 = rs.getString("img1");
				String title = rs.getString("title");
				String shortdesc = rs.getString("shortdesc");
				int delay = rs.getInt("delay");
				String wdate = rs.getString("wdate");
				int price = rs.getInt("price");
				int hits = rs.getInt("hits");
				int voteGrade = rs.getInt("votegrade");
				AdminPackageVO vo = new AdminPackageVO(packageNum, cityname, title, shortdesc, delay, wdate, price, hits, voteGrade);
				vo.setImg1(img1);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;		
	}
	
	public PackageVO selectOne(int packageNum){
		PackageVO vo = new PackageVO();
		
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_package ");
		sb.append("WHERE packagenum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, packageNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				vo.setPackageNum(packageNum);
				vo.setCityNum(rs.getInt("citynum"));
				vo.setImg1(rs.getString("img1"));
				vo.setImg2(rs.getString("img2"));
				vo.setImg3(rs.getString("img3"));
				vo.setTitle(rs.getString("title"));
				vo.setDescript(rs.getString("descript"));
				vo.setSchedule(rs.getString("schedule"));
				vo.setDelay(rs.getInt("delay"));
				vo.setWdate(rs.getString("wdate"));
				vo.setPrice(rs.getInt("price"));
				vo.setHits(rs.getInt("hits"));
				vo.setVoteGrade(rs.getInt("votegrade"));
				vo.setHistorical(rs.getInt("historical"));
				vo.setScenery(rs.getInt("scenery"));
				vo.setHealing(rs.getInt("healing"));
				vo.setShopping(rs.getInt("shopping"));
				vo.setShortDesc(rs.getString("shortdesc"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return vo;
	}
	public void updateOne(PackageVO vo){
		sb.setLength(0);
		sb.append("Update trip_Package SET citynum=?, img1=?, img2=?, img3=?, title=?, descript=?, schedule=?, delay=?, price=?, historical=?, scenery=?, shopping=?, healing=?, shortdesc=?  WHERE packagenum = ? ");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getCityNum());
			pstmt.setString(2, vo.getImg1());
			pstmt.setString(3, vo.getImg2());
			pstmt.setString(4, vo.getImg3());
			pstmt.setString(5, vo.getTitle());
			pstmt.setString(6, vo.getDescript());
			pstmt.setString(7, vo.getSchedule());
			pstmt.setInt(8, vo.getDelay());
			pstmt.setInt(9, vo.getPrice());
			pstmt.setInt(10, vo.getHistorical());
			pstmt.setInt(11, vo.getScenery());
			pstmt.setInt(12, vo.getShopping());
			pstmt.setInt(13, vo.getHealing());
			pstmt.setString(14, vo.getShortDesc());
			pstmt.setInt(15, vo.getPackageNum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void deleteOne(int no){
		sb.setLength(0);
		sb.append("DELETE trip_package WHERE packagenum = ? ");
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1,no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void raiseHits(int no){
		sb.setLength(0);
		sb.append("update trip_package ");
		sb.append("set hits=hits+1 ");
		sb.append("where packageNum=? ");
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int getTotalCount(){
		sb.setLength(0);
		sb.append("SELECT COUNT(*) cnt FROM trip_package ");
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	public int getCount(String keyword){
		sb.setLength(0);
		sb.append("SELECT COUNT(*) cnt FROM trip_package natural join trip_city where cityname = ? ");
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "'" + keyword + "'");
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}	
	public void insertOne(PackageVO vo){
		sb.setLength(0);
		// 조회수 초기값 : 0
		// 현재 날짜 함수 : sysdate
		// 정상글 : 1
		sb.append("INSERT INTO trip_package ");
		sb.append("values(board_no_seq.nextVal, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, 0, 0, 0, ?, ?, ?, ?, ?)");
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getCityNum());
			pstmt.setString(2, vo.getImg1());
			pstmt.setString(3, vo.getImg2());
			pstmt.setString(4, vo.getImg3());
			pstmt.setString(5, vo.getTitle());
			pstmt.setString(6, vo.getDescript());
			pstmt.setString(7, vo.getSchedule());
			pstmt.setInt(8, vo.getDelay());
			pstmt.setInt(9, vo.getPrice());
			pstmt.setInt(10, vo.getHistorical());
			pstmt.setInt(11, vo.getScenery());
			pstmt.setInt(12, vo.getShopping());
			pstmt.setInt(13, vo.getHealing());
			pstmt.setString(14, vo.getShortDesc());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<PackageVO> search(String keyword){
		ArrayList<PackageVO> list = new ArrayList<PackageVO>();
		
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_package ");
		sb.append("WHERE title like ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "%"+keyword+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PackageVO vo = new PackageVO();
				vo.setPackageNum(rs.getInt("packagenum"));
				vo.setCityNum(rs.getInt("citynum"));
				vo.setImg1(rs.getString("img1"));
				vo.setImg2(rs.getString("img2"));
				vo.setImg3(rs.getString("img3"));
				vo.setTitle(rs.getString("title"));
				vo.setDescript(rs.getString("descript"));
				vo.setSchedule(rs.getString("schedule"));
				vo.setDelay(rs.getInt("delay"));
				vo.setWdate(rs.getString("wdate"));
				vo.setPrice(rs.getInt("price"));
				vo.setHits(rs.getInt("hits"));
				vo.setVoteGrade(rs.getInt("votepeoplenum"));
				vo.setHistorical(rs.getInt("historical"));
				vo.setScenery(rs.getInt("scenery"));
				vo.setHealing(rs.getInt("healing"));
				vo.setShortDesc(rs.getString("shortdesc"));
				list.add(vo);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	public void updateVoteGrade(PackageVO vo){
		sb.setLength(0);
		sb.append("Update trip_Package SET votegrade=?, votepeoplenum=? ");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getVoteGrade());
			pstmt.setInt(2, vo.getVotePeopleNum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
