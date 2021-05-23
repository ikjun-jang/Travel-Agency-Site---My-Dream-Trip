package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BoardVO;
import vo.quesBoardVO;
 
public class BoardDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	
	public BoardDAO(){
		conn = MakeConnection.getInstance().getConnection();
	}
	
	public ArrayList<BoardVO> selectAll(){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		sb.setLength(0);
		sb.append("SELECT * FROM trip_board ");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int bno = rs.getInt("bno");
				String id = rs.getString("id");
				String wdate = rs.getString("wdate");
				int hits = rs.getInt("hits");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int replyNo = rs.getInt("replyno");
				int status = rs.getInt("status");
				
				list.add(new BoardVO(bno, id, wdate, hits, title, content, replyNo, status));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public ArrayList<BoardVO>  selectAll(String keyword,int start, int end){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		// SQL문 작성 
		sb.setLength(0);
		
		/*sb.append("SELECT lv, RN, BNO, ID, WDATE, HITS, TITLE, CONTENT, REPLYNO, STATUS ");
		sb.append("FROM (SELECT  lv, ROWNUM RN, BNO, ID, WDATE, HITS, TITLE, CONTENT, REPLYNO, STATUS ");
		sb.append("	FROM (SELECT level lv, bno, id, wdate, hits, title, content, replyno, status FROM trip_board " );
		sb.append("START WITH bno in ( ");
		sb.append(" SELECT bno FROM trip_board " );
		sb.append(" WHERE (title like ? ");
		sb.append(" OR content like ?) ");
		sb.append(" AND replyno = null ORDER BY wdate desc) ");
		sb.append("CONNECT BY replyno = prior bno) ");
		sb.append("	WHERE  ROWNUM <= ? )  ");
		sb.append("WHERE RN >= ? ");*/
		
		sb.append("select level, rn, bno, id, wdate, hits, title, content, replyno, status from "); 
		sb.append("(select rn, bno, id, wdate, hits, title, content, replyno, status ");
		sb.append("from (select rownum rn, bno, id, wdate, hits, title, content, replyno, status ");
		sb.append("from (select * from trip_board where title like ? or content like ? order by wdate desc) ");
		sb.append("where rownum<=?) "); 
		sb.append("where rn>=?) start with bno in (select bno from (select bno ");
		sb.append("from (select rownum rn, bno, id, wdate, hits, title, content, replyno, status ");
		sb.append("from (select * from trip_board where title like ? or content like ? order by wdate desc) ");
		sb.append("where rownum<=?) ");
		sb.append("where rn>=?) where replyno is null) connect by replyno=prior bno ");

		
		/*sb.append("SELECT level lv, no, writer, title, ");
		sb.append("content, hits, ");
		sb.append(" to_char(wdate,'YYYY-MM-DD') wdate , ");
		sb.append("status , boardno ");
		sb.append("FROM reboard ");
		sb.append("START WITH boardno= 0 ");
		sb.append("CONNECT BY boardno = prior no ");*/
		
		
		try {
			// 문장 객체 
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setInt(3, end);
			pstmt.setInt(4, start);
			pstmt.setString(5, "%" + keyword + "%");
			pstmt.setString(6, "%" + keyword + "%");
			pstmt.setInt(7, end);
			pstmt.setInt(8, start);
			
			// ? 가 있으면 값을 채우기 
			rs = pstmt.executeQuery();
			// 레코드별 로직 처리 
			while(rs.next()){
		// rs.getInt("컬럼의 순번 or 컬럼명or 별칭명 ")
				int level = rs.getInt("level");
				int bno = rs.getInt("bno");
				String id = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hits = rs.getInt("hits");
				String wdate = rs.getString("wdate");
				int replyno = rs.getInt("replyno");
				int status= rs.getInt("status");
				BoardVO vo = new BoardVO(bno, id, wdate, hits,
							title, content, replyno,status,level);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getTotalCount(String keyword){
		sb.setLength(0);
		sb.append("SELECT count(*) cnt FROM trip_board  ");
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
	
	
	
	
	public void deleteOne(int bno, String id){
		sb.setLength(0);
		sb.append("DELETE trip_board ");
		if(id.equals("admin")){
			sb.append("WHERE bno = ? ");
		}else{
			sb.append("WHERE bno = ? and id = ?");
		}
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			if(id.equals("admin")){
			}else{
				pstmt.setString(2, id);
			}
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//deleteOne 종료
	
	
	
	public void raiseHits(int bno){
		sb.setLength(0);
		sb.append("UPDATE trip_board ");
		sb.append("SET hits= hits+1 ");
		sb.append("WHERE bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public BoardVO selectOne(int bno){
		sb.setLength(0);
		sb.append("SELECT * ");
		sb.append("FROM trip_board ");
		sb.append("WHERE bno = ? ");
		BoardVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			rs.next();
			String id = rs.getString("id");
			String wdate = rs.getString("wdate");
			int hits = rs.getInt("hits");
			String title = rs.getString("title");
			String content = rs.getString("content");
			int replyNo= rs.getInt("replyNo");
			int status= rs.getInt("status");
			vo  = new BoardVO(bno, id, wdate, hits,
						title, content,replyNo, status);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	public void updateOne(BoardVO vo){
		sb.setLength(0);
		sb.append("UPDATE trip_board ");
		sb.append("SET title = ?  , content = ? ");
		sb.append("WHERE bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getBno());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	public void insertOne(BoardVO vo){
		sb.setLength(0);
		//  조회수 초기값 : 0 
		// 현재 날짜 함수 : sysdate 
		// 정상 글 : 1 
		sb.append("INSERT INTO trip_board ");
		sb.append("VALUES ( board_bno_seq.nextval, " );
		sb.append(" ?, sysdate, 0, ?, ?, null, 1)" );  
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void insertOne(BoardVO vo, int bno){
		sb.setLength(0);
		//  조회수 초기값 : 0 
		// 현재 날짜 함수 : sysdate 
		// 정상 글 : 1 
		sb.append("INSERT INTO trip_board ");
		sb.append("VALUES ( board_bno_seq.nextval, " );
		sb.append(" ?, sysdate, 0, ?, ?, ?, 1)" );  
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, bno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
