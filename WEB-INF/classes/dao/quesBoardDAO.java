package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.quesBoardVO;
import vo.quesBoardVO;

public class quesBoardDAO {
	// private static final int NORMAL = 1; 
	private Connection conn ;
	private PreparedStatement pstmt;
	private ResultSet rs ;
	private StringBuffer sb = new StringBuffer();
	
	public quesBoardDAO(){
		conn = MakeConnection.getInstance().getConnection();
	}
	
	public ArrayList<quesBoardVO>  searchKeyword(String keyword){
		ArrayList<quesBoardVO> list = 
				new ArrayList<quesBoardVO>();
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM board ");
		sb.append("WHERE title like ? ");
		sb.append("OR content like ? ");
		sb.append("ORDER BY wdate DESC ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1	, "%"+keyword+"%");
			pstmt.setString(2	, "%"+keyword+"%");
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				int no = rs.getInt("no");
				String writer = rs.getString("writer");
				String title  = rs.getString("title");
				String content = rs.getString("content");
				int hits = rs.getInt("hits");
				String wdate = rs.getString("wdate");
				int status = rs.getInt("status");
				quesBoardVO vo = 
new quesBoardVO(no, writer, title, content, hits, wdate, status);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}// searchKeyword() method end
	
	// ArrayList ==> Object의 배열 ,  알고리즘 포함된 method
	public int getTotalCount(String keyword){
		sb.setLength(0);
		sb.append("SELECT count(*) cnt FROM board  ");
		sb.append("WHERE title like ? ");
		sb.append("OR content like ? ");
		
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "%"+keyword + "%");
			pstmt.setString(2, "%"+keyword + "%");
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public void raiseHits(int no){
		sb.setLength(0);
		sb.append("UPDATE board ");
		sb.append("SET hits= hits+1 ");
		sb.append("WHERE no = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	// BoardVO 전용 ArrayList 
	public ArrayList<quesBoardVO>  selectAll(
			String keyword,int start, int end){
		ArrayList<quesBoardVO> list = new ArrayList<quesBoardVO>();
		
		// SQL문 작성 
		sb.setLength(0);
		
		sb.append("SELECT RN, NO, WRITER, TITLE, CONTENT, HITS, WDATE, STATUS ");
		sb.append("FROM (SELECT  ROWNUM RN, NO, WRITER, TITLE, CONTENT, HITS, WDATE, STATUS ");
		sb.append("	FROM (SELECT * FROM BOARD " );
		sb.append(" WHERE title like ? ");
		sb.append(" OR content like ? ");
		sb.append(" ORDER BY WDATE DESC ) 		 ");
		sb.append("	WHERE  ROWNUM <= ? )  ");
		sb.append("WHERE RN >= ? ");
		
		try {
			// 문장 객체 
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			
			pstmt.setInt(3, end);
			pstmt.setInt(4, start);
			// ? 가 있으면 값을 채우기 
			rs = pstmt.executeQuery();
			// 레코드별 로직 처리 
			while(rs.next()){
		// rs.getInt("컬럼의 순번 or 컬럼명or 별칭명 ")
				int no = rs.getInt("no");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hits = rs.getInt("hits");
				String wdate = rs.getString("wdate");
				int status= rs.getInt("status");
				quesBoardVO vo = 
			new quesBoardVO(no, writer, title, content,
							hits, wdate, status);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}// selectAll()   end
	
	public quesBoardVO  selectOne(int no){
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM board ");
		sb.append("WHERE no = ? ");
		quesBoardVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			rs.next();
			String writer = rs.getString("writer");
			String title = rs.getString("title");
			String content = rs.getString("content");
			int hits = rs.getInt("hits");
			String wdate = rs.getString("wdate");
			int status= rs.getInt("status");
			vo  = new quesBoardVO(no, writer, title, content,
						hits, wdate, status);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return vo;
	}// selectOne(int no)   method end 
	
	public void insertOne(quesBoardVO vo){
		sb.setLength(0);
		//  조회수 초기값 : 0 
		// 현재 날짜 함수 : sysdate 
		// 정상 글 : 1 
		sb.append("INSERT INTO board ");
		sb.append("VALUES ( BOARD_NO_SEQ.NEXTVAL," );
		sb.append(" ?, ?, ?, 0, sysdate, 1)" );  
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}// insertOne(BoardVO vo) method end
	
	public void updateOne(quesBoardVO vo){
		sb.setLength(0);
		sb.append("UPDATE board ");
		sb.append("SET title = ?  , content = ? ");
		sb.append("WHERE no = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}// updateOne(BoardVO vo) method end
	
	public void deleteOne(int no){
		sb.setLength(0);
		sb.append("DELETE board ");
		sb.append("WHERE no = ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// deleteOne(int no) method end;
	
}//  BoardDAO   class end 





