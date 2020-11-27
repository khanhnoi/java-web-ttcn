package vn.edu.vinaenter.models;

public class Sex {
	private int sId;
	private String sname;
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public Sex(int sId, String sname) {
		super();
		this.sId = sId;
		this.sname = sname;
	}
	public Sex() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
