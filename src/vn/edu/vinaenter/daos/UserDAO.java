package vn.edu.vinaenter.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import vn.edu.vinaenter.defines.PageDefine;
import vn.edu.vinaenter.models.Role;
import vn.edu.vinaenter.models.Sex;
import vn.edu.vinaenter.models.User;

@Repository
public class UserDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public int countItems() {
		String sql = "SELECT COUNT(*) AS totalRow  "
				+ "FROM users ";
		return jdbcTemplate.queryForObject(sql,Integer.class );
	}
	public List<User> getItemsPagination(int offset) {
		List<User> listUser = new ArrayList<>();
		String sql = "SELECT id, username, fullname, email, birthday,sex.sId, sex.sname, password, active, avatar FROM users INNER JOIN sex ON users.sId = sex.sId  ORDER BY id DESC LIMIT ?,?";
		
		return (List<User>) jdbcTemplate.query(sql, new Object[] {offset ,PageDefine.ADMIN_ROW_COUNT}, 
				new ResultSetExtractor<List<User>>() {

					@Override
					public List<User> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listUser.add(new User(rs.getInt("id"),
									rs.getString("username"), 
									rs.getString("fullname"), 
									rs.getString("email"), 
									rs.getDate("birthday"),
								    new Sex(rs.getInt("sId"), rs.getString("sname")),
									rs.getString("password"), 
									rs.getInt("active"), 
									rs.getString("avatar")));
							
						}
						return listUser;
					}
		});
	}
	public int search(User objUser) {
		String sql = "SELECT COUNT(*) FROM users WHERE username=?";
		
		return jdbcTemplate.queryForObject(sql, new Object[] {objUser.getUsername()}, Integer.class);
	}
	public int addItem(User objUser) {
		String sql = "INSERT INTO users(username,fullname,password,email,birthday,sId,roleId,avatar ) VALUES (?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {objUser.getUsername(), objUser.getFullname(), objUser.getPassword(), objUser.getEmail(), objUser.getBirthday(),objUser.getSex().getsId(), objUser.getRole().getRoleId(), objUser.getAvatar()});
	}
	public int delItem(int id) {
		String sql = "DELETE FROM users WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	public Role getUser(int id) {
		String sql= "SELECT u.roleId, r.name "
				+ "FROM roles AS r INNER JOIN users AS u ON r.roleId = u.roleId WHERE id= ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Role>(Role.class));
	}
	public User getItem(int id) {
		String sql= "SELECT id, username, fullname, password,birthday, email, avatar, active FROM users WHERE id= ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<User>(User.class));
	}
	public int search(User objUser, int id) {
		String sql = "SELECT COUNT(*) FROM users WHERE username=? && id!=?";
		
		return jdbcTemplate.queryForObject(sql, new Object[] {objUser.getUsername(), objUser.getId()}, Integer.class);
	}
	public int editItem(User objUser, int id) {
		String sql = " UPDATE users SET username=?, fullname=?, email=?, birthday=?, password=?, sId=?, roleId=?, avatar=? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {objUser.getUsername(),
				objUser.getFullname(),
				objUser.getEmail(),
				objUser.getBirthday(),
				objUser.getPassword(),
				objUser.getSex().getsId(),
				objUser.getRole().getRoleId(),
				objUser.getAvatar(),
				objUser.getId()});
	}
	public User getItem(String name) {
		String sql= "SELECT id, username, fullname, password, birthday, email, avatar,  active, u.roleId, r.name " + 
				"FROM roles AS r INNER JOIN users AS u ON r.roleId = u.roleId WHERE username LIKE ?"; 
		return jdbcTemplate.queryForObject(sql, new Object[] {"%" + name + "%"}, new BeanPropertyRowMapper<User>(User.class));
	}
	public int editActive(User users) {
		String sql = " UPDATE users SET active=? WHERE id=?";
		
		return jdbcTemplate.update(sql, new Object[] {users.getActive(), users.getId()});
	}
	public User checkLogin(User objUser) {
		String sql = "SELECT id, username,password" + 
				"FROM users WHERE username LIKE ? AND password=?";
		try {
		return jdbcTemplate.queryForObject(sql, new Object[] {"%"+objUser.getUsername()+"%", objUser.getPassword()},  new BeanPropertyRowMapper<User>(User.class));
		}catch(Exception e) {
			return null;
		}
	}

}
