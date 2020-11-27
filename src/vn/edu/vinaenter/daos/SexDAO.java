package vn.edu.vinaenter.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import vn.edu.vinaenter.models.Role;
import vn.edu.vinaenter.models.Sex;
@Repository
public class SexDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Sex> getItem() {
		String sql = "SELECT sId, sname FROM sex  ";
		return jdbcTemplate.query(sql,  new BeanPropertyRowMapper<Sex>(Sex.class));
	}
	public Sex getSex(int id) {
		String sql= "SELECT s.sId, s.sname "
				+ "FROM sex AS s INNER JOIN users AS u ON s.sId = u.sId WHERE id= ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Sex>(Sex.class));
	}
	public List<Sex> getItems(int sId) {
		String sql= "SELECT s.sId, s.sname "
				+ "FROM sex AS s WHERE s.sId!= ?";
		return jdbcTemplate.query(sql, new Object[] {sId}, new BeanPropertyRowMapper<Sex>(Sex.class));
	}

}
