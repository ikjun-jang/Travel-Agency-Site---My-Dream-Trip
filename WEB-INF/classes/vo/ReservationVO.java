package vo;

public class ReservationVO {
	private int packageNum;
	private String id;
	private int no;
	private int headCount;
	private String startDate;
	private int voteCheck;
	private int status;
	private String airInfo;
	private String hotelInfo;
	
	public ReservationVO(){
		
	}

	public ReservationVO(int packageNum, String id, int no, int headCount,
			String startDate, int voteCheck, int status) {
		super();
		this.packageNum = packageNum;
		this.id = id;
		this.no = no;
		this.headCount = headCount;
		this.startDate = startDate;
		this.voteCheck = voteCheck;
		this.status = status;
	}

	public ReservationVO(int packageNum, String id, int no, int headCount,
			String startDate, int voteCheck, int status, String airInfo,
			String hotelInfo) {
		super();
		this.packageNum = packageNum;
		this.id = id;
		this.no = no;
		this.headCount = headCount;
		this.startDate = startDate;
		this.voteCheck = voteCheck;
		this.status = status;
		this.airInfo = airInfo;
		this.hotelInfo = hotelInfo;
	}

	
	public String getAirInfo() {
		return airInfo;
	}

	public void setAirInfo(String airInfo) {
		this.airInfo = airInfo;
	}

	public String getHotelInfo() {
		return hotelInfo;
	}

	public void setHotelInfo(String hotelInfo) {
		this.hotelInfo = hotelInfo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getPackageNum() {
		return packageNum;
	}

	public void setPackageNum(int packageNum) {
		this.packageNum = packageNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getHeadCount() {
		return headCount;
	}

	public void setHeadCount(int headCount) {
		this.headCount = headCount;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public int getVoteCheck() {
		return voteCheck;
	}

	public void setVoteCheck(int voteCheck) {
		this.voteCheck = voteCheck;
	}
	
}
