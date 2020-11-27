package vn.edu.vinaenter.models;

public class Pay {
	private int payId;
	private String payName;
	public int getPayId() {
		return payId;
	}
	public void setPayId(int payId) {
		this.payId = payId;
	}
	public String getPayName() {
		return payName;
	}
	public void setPayName(String payName) {
		this.payName = payName;
	}
	public Pay(int payId, String payName) {
		super();
		this.payId = payId;
		this.payName = payName;
	}
	public Pay() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
