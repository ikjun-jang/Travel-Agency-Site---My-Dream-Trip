package vo;

public class quesBoardVO {
	private int no;
	private String writer;
	private String title;
	private String content;
	private int hits;
	private String wdate;
	private int status;
	
	public quesBoardVO(){
		
	}
	
	
	public quesBoardVO(int no, String writer, String title, String content,
			int hits, String wdate, int status) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.hits = hits;
		this.wdate = wdate;
		this.status = status;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	

	
	
}
