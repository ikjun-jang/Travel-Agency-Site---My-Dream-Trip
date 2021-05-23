package vo;

public class BoardVO {
	private int bno;
	private String id;
	private String wdate;
	private int hits;
	private String title;
	private String content;
	private int replyNo;
	private int status;
	private int level;
	
	
	public BoardVO(){
		
	}
	
	public BoardVO(int bno, String id, String wdate, int hits, String title,
			String content, int status){
		super();
		this.bno = bno;
		this.id = id;
		this.wdate = wdate;
		this.hits = hits;
		this.title = title;
		this.content = content;
		this.status = status;
	}
	
	public BoardVO(int bno, String id, String wdate, int hits, String title,
			String content, int replyNo, int status) {
		super();
		this.bno = bno;
		this.id = id;
		this.wdate = wdate;
		this.hits = hits;
		this.title = title;
		this.content = content;
		this.replyNo = replyNo;
		this.status = status;
	}

	public BoardVO(int bno, String id, String wdate, int hits, String title,
			String content, int replyNo, int status, int level) {
		super();
		this.bno = bno;
		this.id = id;
		this.wdate = wdate;
		this.hits = hits;
		this.title = title;
		this.content = content;
		this.replyNo = replyNo;
		this.status = status;
		this.level = level;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
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

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
