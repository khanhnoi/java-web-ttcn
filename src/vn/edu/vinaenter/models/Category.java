package vn.edu.vinaenter.models;

import org.hibernate.validator.constraints.NotEmpty;

public class Category {
	private int cid;
	@NotEmpty(message="Vui lòng nhập tên danh mục!")
	private String cname;
	private int scid;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getScid() {
		return scid;
	}
	public void setScid(int scid) {
		this.scid = scid;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(int cid, String cname, int scid) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.scid = scid;
	}
	public Category(int cid, String cname) {
		super();
		this.cid = cid;
		this.cname = cname;
	}
	
}
