package vn.edu.vinaenter.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import vn.edu.vinaenter.defines.PageDefine;
import vn.edu.vinaenter.models.Cart;
import vn.edu.vinaenter.models.CartOrder;
import vn.edu.vinaenter.models.Category;
import vn.edu.vinaenter.models.Order;

@Repository
public class CartOrderDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void addItem(CartOrder item) {
		String sql ="INSERT INTO cart(pro_id,quantity,order_id) VALUES(?,?,?) ";
		jdbcTemplate.update(sql, new Object[] {item.getPro_id(),item.getQuantity(), item.getOrder_id()});
		
	}
	public CartOrder getItem(int id) {
		String sql= "SELECT id, pro_id, quantity, order_id FROM cart WHERE order_id = ?"; 
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<CartOrder>(CartOrder.class));		
		
	}
	public int delItem(int order_id) {
		String sql = " DELETE  FROM cart WHERE order_id=?";
		return jdbcTemplate.update(sql, new Object[] {order_id});
	}
	public List<CartOrder> getItems(int order_id) {
		String sql = "SELECT id, pro_id, quantity, order_id FROM cart WHERE order_id = ?";
		try {
			return jdbcTemplate.query(sql, new Object[] {order_id},new BeanPropertyRowMapper<>(CartOrder.class));
		} catch (Exception e) {
			return null;
		}
	}
}
