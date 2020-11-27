package vn.edu.vinaenter.models;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Contact {
	private int id;
	@NotEmpty(message="Vui lòng nhập tên!")
	private String name;
	
	@NotEmpty(message="Vui lòng nhập email!")
	@Email(message="Nhập đúng định dạng mail!")
	private String email;
	
	@NotEmpty(message="Nhập số điện thoại!")
	@Pattern(regexp="(^$|[0-9]{10})", message="Nhập đúng định dạng số điện thoại!")
	private String phone;
	
	@NotEmpty(message="Nhập địa chỉ!")
	private String address;
	
	@NotEmpty(message="Nhập chủ đề!")
	private String subject;
	
	@NotEmpty(message="Nhập nội dung!")
	private String content;
	private int active;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public Contact(int id, String name, String email, String phone, String address, String subject, String content,
			int active) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.subject = subject;
		this.content = content;
		this.active = active;
	}
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
