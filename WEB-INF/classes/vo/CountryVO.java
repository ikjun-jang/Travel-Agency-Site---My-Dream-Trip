package vo;

public class CountryVO {
	private int countryNo;
	private String name;
	private String img;
	private String backImg;
	
	public CountryVO(){
		
	}
	

	public CountryVO(int countryNo, String name, String img, String backImg) {
		super();
		this.countryNo = countryNo;
		this.name = name;
		this.img = img;
		this.backImg = backImg;
	}

	public int getCountryNo() {
		return countryNo;
	}

	public void setCountryNo(int countryNo) {
		this.countryNo = countryNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public String getBackImg() {
		return backImg;
	}

	public void setBackImg(String backImg) {
		this.backImg = backImg;
	}
	
}
