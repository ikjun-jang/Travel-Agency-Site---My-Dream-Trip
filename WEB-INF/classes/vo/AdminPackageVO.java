package vo;

public class AdminPackageVO {
	private int packageNum;
	private String cityname;
	private String title;
	private String shortdesc;
	private int delay;
	private String wdate;
	private int price;
	private int hits;
	private int voteGrade;
	private String img1;
	
	public AdminPackageVO(){
		
	}
	public AdminPackageVO(int packageNum, String cityname, String title, String shortdesc, int delay, String wdate, int price, int hits, int voteGrade){
		this.packageNum = packageNum;
		this.cityname = cityname;
		this.title = title;
		this.shortdesc = shortdesc;
		this.delay = delay;
		this.wdate = wdate;
		this.price = price;	
		this.hits = hits;
		this.voteGrade = voteGrade;
	}
	public int getPackageNum() {
		return packageNum;
	}
	public void setPackageNum(int packageNum) {
		this.packageNum = packageNum;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getShortdesc() {
		return shortdesc;
	}
	public void setShortdesc(String shortdesc) {
		this.shortdesc = shortdesc;
	}
	public int getDelay() {
		return delay;
	}
	public void setDelay(int delay) {
		this.delay = delay;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getVoteGrade() {
		return voteGrade;
	}
	public void setVoteGrade(int voteGrade) {
		this.voteGrade = voteGrade;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	
}
