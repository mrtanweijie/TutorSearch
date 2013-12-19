package tan.code.model;

public class Tutor {
	private int id;
	private String title;// 標題
	private String content;// 内容；如辅导时间段，家教经验等非硬性要求
	private String subject;// 科目
	private String grade;// 年级
	private String req_major;// 教员的要求：专业要求
	private String req_sex;// 教员要求：性别
	private float pay;// 报酬
	private String patriarch;// 家長稱呼
	private String phone;// 家長聯係方式

	private int browse;// 浏览次数
	private String province;// 省
	private String city;// 城市
	private String region;// 区

	private String date;// 發佈日期
	private String end;// 截止日期

	private int wb_num;// 被舉報次數：初始化为0
	private String others;// 其他说名：如车补

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getReq_major() {
		return req_major;
	}

	public void setReq_major(String req_major) {
		this.req_major = req_major;
	}

	public String getReq_sex() {
		return req_sex;
	}

	public void setReq_sex(String req_sex) {
		this.req_sex = req_sex;
	}

	public float getPay() {
		return pay;
	}

	public void setPay(float pay) {
		this.pay = pay;
	}

	public String getPatriarch() {
		return patriarch;
	}

	public void setPatriarch(String patriarch) {
		this.patriarch = patriarch;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getBrowse() {
		return browse;
	}

	public void setBrowse(int browse) {
		this.browse = browse;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public int getWb_num() {
		return wb_num;
	}

	public void setWb_num(int wb_num) {
		this.wb_num = wb_num;
	}

	public String getOthers() {
		return others;
	}

	public void setOthers(String others) {
		this.others = others;
	}

}
