package amount;

public class Amount {
	private int payrnum;
	private int payno;
	private long stdd;
	private double rate;
	private long estim;
	private long deduc;
	private long payed;
	private String year;
	public int getPayrnum() {
		return payrnum;
	}
	public void setPayrnum(int payrnum) {
		this.payrnum = payrnum;
	}
	public int getPayno() {
		return payno;
	}
	public void setPayno(int payno) {
		this.payno = payno;
	}
	public long getStdd() {
		return stdd;
	}
	public void setStdd(long stdd) {
		this.stdd = stdd;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public long getEstim() {
		return estim;
	}
	public void setEstim(long estim) {
		this.estim = estim;
	}
	public long getDeduc() {
		return deduc;
	}
	public void setDeduc(long deduc) {
		this.deduc = deduc;
	}
	public long getPayed() {
		return payed;
	}
	public void setPayed(long payed) {
		this.payed = payed;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
}
