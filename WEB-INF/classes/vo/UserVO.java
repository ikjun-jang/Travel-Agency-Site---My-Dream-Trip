package vo;

public class UserVO {
	private String id;
	private String name;
	private String password;
	private int birthNum;
	private String phone;
	private int sex;
	private int married;
	private String email;
	private String question;
	private String answer;
	
	public UserVO(){
		
	}
	
	public UserVO(String id, String name, String password,
			int birthNum, String phone, int sex, int married, String email,
			String question, String answer) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.birthNum = birthNum;
		this.phone = phone;
		this.sex = sex;
		this.married = married;
		this.email = email;
		this.question = question;
		this.answer = answer;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getBirthNum() {
		return birthNum;
	}

	public void setBirthNum(int birthNum) {
		this.birthNum = birthNum;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public int getMarried() {
		return married;
	}

	public void setMarried(int married) {
		this.married = married;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
