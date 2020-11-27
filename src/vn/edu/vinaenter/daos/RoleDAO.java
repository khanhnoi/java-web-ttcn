package vn.edu.vinaenter.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import vn.edu.vinaenter.models.Book;
import vn.edu.vinaenter.models.Role;
import vn.edu.vinaenter.models.User;
@Repository
public class RoleDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Role> getItem() {
		String sql = "SELECT roleId, name FROM roles  ";
		return jdbcTemplate.query(sql,  new BeanPropertyRowMapper<Role>(Role.class));
	}

	public List<Role> getItems(int roleId) {
		String sql = "SELECT r.roleId, r.name FROM roles AS r  WHERE roleId != ? ";
		return jdbcTemplate.query(sql, new Object[] {roleId}, new BeanPropertyRowMapper<Role>(Role.class));
	}

	/*public Role getName(User account) {
		String sql = "SELECT name FROM roles  WHERE roleId = ? ";
		
		return jdbcTemplate.queryForObject(sql, new Object[] {account.getRole().getRoleId()}, new BeanPropertyRowMapper<Role>(Role.class));
	}*/

}
