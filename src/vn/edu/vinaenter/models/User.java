package vn.edu.vinaenter.models;

import java.sql.Date;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import com.sun.istack.internal.NotNull;

public class User {
	private int id;
	@NotEmpty(message="Vui lòng nhập username")
	private String username;
	
	@NotEmpty(message="Vui lòng nhập fullname!")
	private String fullname;
	
	@Email(message="Nhập đúng định dạng email!")
	@NotEmpty(message="Không để trống mục này!")
	private String email;
	
	@NotNull
	
	private Date birthday;
	
	private Sex sex;
	
	private Role role;
	@NotEmpty(message="Mật khẩu không dduocj để trống")
	private String password;
	private int active;
	private String avatar;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Sex getSex() {
		return sex;
	}
	public void setSex(Sex sex) {
		this.sex = sex;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public User(int id, String username, String fullname, String email, Date birthday, Sex sex, Role role,
			String password, int active) {
		super();
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.birthday = birthday;
		this.sex = sex;
		this.role = role;
		this.password = password;
		this.active = active;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int id, String username, String fullname, String email, Date birthday, String password, int active) {
		super();
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.birthday = birthday;
		this.password = password;
		this.active = active;
	}
	public User(int id, String username, String fullname, String email, Date birthday, String password, int active,
			String avatar) {
		super();
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.birthday = birthday;
		this.password = password;
		this.active = active;
		this.avatar = avatar;
	}
	public User(int id, String username, String fullname, String email, Date birthday, Sex sex, String password,
			int active, String avatar) {
		super();
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.birthday = birthday;
		this.sex = sex;
		this.password = password;
		this.active = active;
		this.avatar = avatar;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + "]";
	}
	
		
}
