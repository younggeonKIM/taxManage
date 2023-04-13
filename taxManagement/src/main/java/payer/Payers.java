package payer;

public class Payers {
	private int payrno;
	private String payrnam;
	private String tel;
	private String addr;
	private String padate;
	private String dudate;
	private String payplac;
	public int getPayrno() {
		return payrno;
	}
	public void setPayrno(int payrno) {
		this.payrno = payrno;
	}
	public String getPayrnam() {
		return payrnam;
	}
	public void setPayrnam(String payrnam) {
		this.payrnam = payrnam;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPadate() {
		return padate;
	}
	public void setPadate(String padate) {
		this.padate = padate;
	}
	public String getDudate() {
		return dudate;
	}
	public void setDudate(String dudate) {
		this.dudate = dudate;
	}
	public String getPayplac() {
		return payplac;
	}
	public void setPayplac(String payplac) {
		this.payplac = payplac;
	}
}
