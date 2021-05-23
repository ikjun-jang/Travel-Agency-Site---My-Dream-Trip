package vo;

public class PackageVO {
	private int packageNum;
	private int cityNum;
	private String img1;
	private String img2;
	private String img3;
	private String title;
	private String descript;
	private String schedule;
	private int delay;
	private String wdate;
	private int price;
	private int hits;
	private int votePeopleNum;
	private int voteGrade;
	private int historical;
	private int scenery;
	private int shopping;
	private int healing;
	private String shortDesc;
	
	public PackageVO(){
		
	}
	public PackageVO(int packageNum, int cityNum, String img1, String img2, String img3, String title, String descript,String schedule, int delay, String wdate, int price, int hits, int votePeopleNum, int voteGrade, int historical, int scenery, int shopping, int healing, String shortDesc){
		this.packageNum = packageNum;
		this.cityNum = cityNum;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.title = title;
		this.descript = descript;
		this.schedule = schedule;
		this.delay = delay;
		this.wdate = wdate;
		this.price = price;
		this.hits = hits;
		this.votePeopleNum = votePeopleNum;
		this.voteGrade = voteGrade;
		this.historical = historical;
		this.scenery = scenery;
		this.shopping = shopping;
		this.healing = healing;
		this.shortDesc = shortDesc;
	}
	public PackageVO(int packageNum, String img1, String title, int delay, int price, int hits, int votePeopleNum, int voteGrade, int historical, int scenery, int shopping, int healing, String shortDesc){
		this.packageNum = packageNum;
		this.img1 = img1;
		this.title = title;
		this.delay = delay;
		this.price = price;
		this.hits = hits;
		this.votePeopleNum = votePeopleNum;
		this.voteGrade = voteGrade;
		this.historical = historical;
		this.scenery = scenery;
		this.shopping = shopping;
		this.healing = healing;
		this.shortDesc = shortDesc;
	}
	public PackageVO(int cityNum, String img1, String img2, String img3, String title, String descript, String schedule, int delay, int price, int historical, int scenery, int shopping, int healing, String shortDesc){
		this.cityNum = cityNum;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.title = title;
		this.descript = descript;
		this.schedule = schedule;
		this.delay = delay;
		this.price = price;
		this.historical = historical;
		this.scenery = scenery;
		this.shopping = shopping;
		this.healing = healing;
		this.shortDesc = shortDesc;
	}
	public PackageVO(int cityNo, String img1, String img2, String img3, String title, String descript, String schedule, int delay, int price, int historical, int scenery, int shopping, int healing, String shortDesc, int packageNo){
		this.cityNum = cityNo;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.title = title;
		this.descript = descript;
		this.schedule = schedule;
		this.delay = delay;
		this.price = price;
		this.historical = historical;
		this.scenery = scenery;
		this.shopping = shopping;
		this.healing = healing;
		this.shortDesc = shortDesc;
		this.packageNum = packageNo;
	}
	public int getPackageNum() {
		return packageNum;
	}
	public void setPackageNum(int packageNum) {
		this.packageNum = packageNum;
	}
	public int getCityNum() {
		return cityNum;
	}
	public void setCityNum(int cityNum) {
		this.cityNum = cityNum;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
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
	public int getVotePeopleNum() {
		return votePeopleNum;
	}
	public void setVotePeopleNum(int votePeopleNum) {
		this.votePeopleNum = votePeopleNum;
	}
	public int getVoteGrade() {
		return voteGrade;
	}
	public void setVoteGrade(int voteGrade) {
		this.voteGrade = voteGrade;
	}
	public int getHistorical() {
		return historical;
	}
	public void setHistorical(int historical) {
		this.historical = historical;
	}
	public int getScenery() {
		return scenery;
	}
	public void setScenery(int scenery) {
		this.scenery = scenery;
	}
	public int getShopping() {
		return shopping;
	}
	public void setShopping(int shopping) {
		this.shopping = shopping;
	}
	public int getHealing() {
		return healing;
	}
	public void setHealing(int healing) {
		this.healing = healing;
	}	
	
	public String getShortDesc() {
		return shortDesc;
	}
	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}
	
}
