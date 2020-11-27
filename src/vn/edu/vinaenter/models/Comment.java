package vn.edu.vinaenter.models;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Comment {
	private int cmtId;
	@NotEmpty(message="Vui lòng nhập tên!")
	private String cmt_name;
	
	@NotEmpty(message="Không để trống nội dung!")
	private String content;
	private int id;
	
	@Email(message="Nhập đúng định dạng mail!")
	@NotEmpty(message="Không để trống!")
	private String email;
	public int getCmtId() {
		return cmtId;
	}
	public void setCmtId(int cmtId) {
		this.cmtId = cmtId;
	}
	public String getCmt_name() {
		return cmt_name;
	}
	public void setCmt_name(String cmt_name) {
		this.cmt_name = cmt_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Comment(int cmtId, String cmt_name, String content, int id, String email) {
		super();
		this.cmtId = cmtId;
		this.cmt_name = cmt_name;
		this.content = content;
		this.id = id;
		this.email = email;
	}
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
