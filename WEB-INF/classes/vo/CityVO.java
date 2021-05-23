package vo;

public class CityVO {
	private int cityNum;
	private String cityName;
	private String img;
	private int countryNo;
	private String bigImg;
	
	public CityVO(){
		
	}
	public CityVO(int cityNum, String cityName, String img, int countryNo, String bigImg){
		this.cityNum = cityNum;
		this.cityName = cityName;
		this.img = img;
		this.countryNo = countryNo;
		this.bigImg = bigImg;
	}
	public int getCityNum() {
		return cityNum;
	}
	public void setCityNum(int cityNum) {
		this.cityNum = cityNum;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getCountryNo() {
		return countryNo;
	}
	public void setCountryNo(int countryNo) {
		this.countryNo = countryNo;
	}
	public String getBigImg() {
		return bigImg;
	}
	public void setBigImg(String bigImg) {
		this.bigImg = bigImg;
	}
	
	
	
}
