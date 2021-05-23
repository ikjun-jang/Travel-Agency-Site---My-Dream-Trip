package vo;

public class eventVO {
		private String title;
		private String content;
		private String period;
		private int price;
		private int dcprice;
		private int packagenum;
		
		public eventVO(){
			
		}
		public eventVO(String title, String content, String period, int price, int dcprice, int packagenum) {
			super();
			this.title = title;
			this.content = content;
			this.period = period;
			this.price = price;
			this.dcprice = dcprice;
			this.packagenum = packagenum;
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
		public String getPeriod() {
			return period;
		}
		public void setPeriod(String period) {
			this.period = period;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public int getDcprice() {
			return dcprice;
		}
		public void setDcprice(int dcprice) {
			this.dcprice = dcprice;
		}
		public int getPackagenum() {
			return packagenum;
		}
		public void setPackagenum(int packagenum) {
			this.packagenum = packagenum;
		}
		
		
		
		
		
}
