package vn.edu.vinaenter.models;

public class CartOrder {
	private int cart_id;
	private int pro_id;
	private int quantity;
	private int order_id;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public CartOrder(int cart_id, int pro_id, int quantity, int order_id) {
		super();
		this.cart_id = cart_id;
		this.pro_id = pro_id;
		this.quantity = quantity;
		this.order_id = order_id;
	}
	public CartOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
