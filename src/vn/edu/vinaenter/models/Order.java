package vn.edu.vinaenter.models;

import java.sql.Timestamp;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Order {
	private int order_id;
	@NotEmpty(message="Nhập tên người mua hàng!")
	private String name;
	@NotEmpty(message="Vui lòng nhập số điện thoại!")
	@Pattern(regexp="(^$|[0-9]{10})", message="Nhập đúng định dạng số điện thoại!")
	private String phone;
	private Timestamp date;
	
	@NotEmpty(message="Vui lòng nhập địa chỉ cụ thể!")
	@Length(min=12, message="Địa chỉ ít nhất 12 ký tự")
	private String address;
	private String payments;
	private String status;
	private int paid;
	private int checked;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPayments() {
		return payments;
	}
	public void setPayments(String payments) {
		this.payments = payments;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	public int getPaid() {
		return paid;
	}
	public void setPaid(int i) {
		this.paid = i;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	
	public Order(int order_id, String name, String phone, Timestamp date, String address, String payments,
			String status, int paid, int checked) {
		super();
		this.order_id = order_id;
		this.name = name;
		this.phone = phone;
		this.date = date;
		this.address = address;
		this.payments = payments;
		this.status = status;
		this.paid = paid;
		this.checked = checked;
	}
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
