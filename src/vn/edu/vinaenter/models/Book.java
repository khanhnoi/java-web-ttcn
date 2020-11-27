package vn.edu.vinaenter.models;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.NumberFormat;

public class Book {
	private int id;
	@NotEmpty(message="Nhập tên sách!")
	private String name;
	
	@NumberFormat
	private double price;
	@NotEmpty(message="Nhập tác giả")
	private String author;
	
	private String detail;
	private String picture;
	private int likes;
	
	@NumberFormat
	private int amount;
	private int love;
	private int active;
	private int view;
	private Category cat;
	
	private String detailpicture1;
	private String detailpicture2;
	
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getLove() {
		return love;
	}
	public void setLove(int love) {
		this.love = love;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public Category getCat() {
		return cat;
	}
	public void setCat(Category cat) {
		this.cat = cat;
	}
	
	public String getDetailpicture1() {
		return detailpicture1;
	}
	public void setDetailpicture1(String detailpicture1) {
		this.detailpicture1 = detailpicture1;
	}
	public String getDetailpicture2() {
		return detailpicture2;
	}
	public void setDetailpicture2(String detailpicture2) {
		this.detailpicture2 = detailpicture2;
	}
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Book(int id, String name, double price, String author, String detail, String picture, int likes, int amount,
			int love, int active, int view, Category cat) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.author = author;
		this.detail = detail;
		this.picture = picture;
		this.likes = likes;
		this.amount = amount;
		this.love = love;
		this.active = active;
		this.view = view;
		this.cat = cat;
	}
	
	public Book(int id, String name, double price, String author, String detail, String picture, int likes, int amount,
			int love, int active, int view, Category cat, String detailpicture1, String detailpicture2) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.author = author;
		this.detail = detail;
		this.picture = picture;
		this.likes = likes;
		this.amount = amount;
		this.love = love;
		this.active = active;
		this.view = view;
		this.cat = cat;
		this.detailpicture1 = detailpicture1;
		this.detailpicture2 = detailpicture2;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", price=" + price + ", author=" + author + ", detail=" + detail
				+ ", picture=" + picture + ", likes=" + likes + ", amount=" + amount + ", love=" + love + ", active="
				+ active + ", view=" + view + ", cat=" + cat + "]";
	}
	
}
