package vo;

public class BoardReVO {
	private int rno;
	private int bno;
	private String id;
	private String wdate;
	private String content;
	private int status;
	
	public BoardReVO(){
		
	}
	
	public BoardReVO(int rno, int bno, String id, String wdate, String content,
			int status) {
		super();
		this.rno = rno;
		this.bno = bno;
		this.id = id;
		this.wdate = wdate;
		this.content = content;
		this.status = status;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
