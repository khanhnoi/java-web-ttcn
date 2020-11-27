package vn.edu.vinaenter.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import vn.edu.vinaenter.defines.PageDefine;
import vn.edu.vinaenter.models.Order;

@Repository
public class OrdersDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void addItem(Order objOrder) {
		String sql = "INSERT INTO orders(name,phone,address,payments,paid,status) VALUES(?,?,?,?,?,?)";
		jdbcTemplate.update(sql, new Object[] {objOrder.getName(),objOrder.getPhone(),objOrder.getAddress(),
				objOrder.getPayments(),objOrder.getPaid(),objOrder.getStatus()});
		
	}

	public Order getItemLastest() {
		String sql = "SELECT * FROM orders ORDER BY order_id DESC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Order.class));
	}

	public int countItems() {
		String sql = "SELECT COUNT(*) FROM orders";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public List<Order> getItemsPagination(int offset) {
		String sql = "SELECT * FROM orders ORDER BY order_id DESC LIMIT ?,?";
		try {
			return jdbcTemplate.query(sql, new Object[] {offset, PageDefine.ADMIN_ROW_COUNT},new BeanPropertyRowMapper<>(Order.class));
		} catch (Exception e) {
			return null;
		}
	}

	public Order getItem(int order_id) {
		String sql = "SELECT * FROM orders WHERE order_id =?";
		return jdbcTemplate.queryForObject(sql,new Object[] {order_id}, new BeanPropertyRowMapper<>(Order.class));
	}

	public int editActive(Order order) {
		String sql = " UPDATE orders SET checked=? WHERE order_id=?";
		return jdbcTemplate.update(sql, new Object[] {order.getChecked(), order.getOrder_id()});
	}

	public int edit(int paid, int order_id) {
		String sql = " UPDATE orders SET paid=? WHERE order_id=?";
		return jdbcTemplate.update(sql, new Object[] {paid, order_id});
	}

	public int del(int order_id) {
		String sql = " DELETE  FROM orders WHERE order_id=?";
		return jdbcTemplate.update(sql, new Object[] {order_id});
	}

	public int delAll() {
		String sql = "DELETE cart,orders  FROM cart, orders WHERE cart.order_id = orders.order_id AND checked=1";
		return jdbcTemplate.update(sql, new Object[] {});
	}

	

}
