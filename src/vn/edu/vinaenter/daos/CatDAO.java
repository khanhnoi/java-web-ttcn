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
import vn.edu.vinaenter.models.Book;
import vn.edu.vinaenter.models.Category;

@Repository
public class CatDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public int countItems() {
		String sql = "SELECT COUNT(*) AS totalRow  "
				+ "FROM cat WHERE scid=0  ";
		return jdbcTemplate.queryForObject(sql,Integer.class );
	}
	public List<Category> getItemsPagination(int offset) {
		List<Category> listCat = new ArrayList<Category>();
		String sql = "SELECT cid , cname, scid "
				+ "FROM cat ORDER BY cid DESC LIMIT ?,?";
		return (List<Category>) jdbcTemplate.query(sql, new Object[] {offset, PageDefine.ADMIN_ROW_COUNT}, 
				new ResultSetExtractor<List<Category>>() {

					@Override
					public List<Category> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
						listCat.add(new Category(rs.getInt("cid"), rs.getString("cname"), rs.getInt("scid")) );
						}
						return listCat ;
					}
		} ) ;
	}
	public int countItemsSearch(String search) {
		String sql = "SELECT COUNT(*) AS totalRow  "
				+ "FROM cat  WHERE cname LIKE ? ";
		return jdbcTemplate.queryForObject(sql,new Object[] {"%" + search + "%"} ,Integer.class );
	}
	public List<Category> search(String search, int offset) {
		List<Category> listCat = new ArrayList<Category>();
		String sql = "SELECT cid , cname "
				+ "FROM cat  WHERE cname LIKE ? LIMIT ?,? ";
		
		return (List<Category>) jdbcTemplate.query(sql, new Object[] {"%" + search + "%", offset, PageDefine.ADMIN_ROW_COUNT}, 
				new ResultSetExtractor<List<Category>>() {

					@Override
					public List<Category> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
						listCat.add(new Category(rs.getInt("cid"), rs.getString("cname")));
						}
						return listCat ;
					}
		} ) ;
	}
	public List<Category> getItem() {
		String sql = "SELECT cid, cname, scid FROM cat ORDER BY cid DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
	}
	public int search1(Category objCat) {
		String sql = "SELECT COUNT(*) FROM cat WHERE cname=?";
		
		return jdbcTemplate.queryForObject(sql, new Object[] {objCat.getCname()}, Integer.class);
	}
	public int addItem(Category objCat) {
		String sql = "INSERT INTO cat(cname, scid) VALUES (?,?)";
		return jdbcTemplate.update(sql, new Object[] {objCat.getCname(), objCat.getScid()});
	}
	public int delItem(int cid) {
		String sql = "DELETE cat FROM cat WHERE cat.cid = ? OR cat.scid = ? ";
		return jdbcTemplate.update(sql, new Object[] {cid, cid});
	}
	public Category getItem(int cid) {
		String sql= "SELECT cid, cname, scid FROM cat WHERE cid= ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {cid}, new BeanPropertyRowMapper<Category>(Category.class));
	}
	public List<Category> getItemx(int cid) {
		String sql = "SELECT cid, cname FROM cat WHERE cid != ? ORDER BY cid DESC";
		return jdbcTemplate.query(sql, new Object[] {cid}, new BeanPropertyRowMapper<Category>(Category.class));
	}
	public int search(Category objCat, int cid) {
		String sql = "SELECT COUNT(*) FROM cat WHERE cname=? && cid!=?";
		
		return jdbcTemplate.queryForObject(sql, new Object[] {objCat.getCname(), objCat.getCid()}, Integer.class);
	}
	public int editItem(Category objCat, int cid) {
		String sql = " UPDATE cat SET cname=?, scid=? WHERE cid=?  ";
		return jdbcTemplate.update(sql, new Object[] {objCat.getCname(),objCat.getScid() , objCat.getCid()});
	}
	public List<Category> getItemDad() {
		String sql = "SELECT cid, cname, scid FROM cat WHERE scid = 0 ORDER BY cid DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
	}
	public Category getCat(int id) {
		String sql= "SELECT c.cid, c.cname, c.scid FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE b.id= ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Category>(Category.class));
	}
	public Category getCatDad(int scid) {
		String sql= "SELECT cid, cname, scid FROM cat WHERE cid= ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {scid}, new BeanPropertyRowMapper<Category>(Category.class));
	}
	public Category getItems(int cid) {
		String sql= "SELECT cid, cname,scid FROM cat WHERE cid= ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {cid}, new BeanPropertyRowMapper<Category>(Category.class));
	}
	public List<Category> getCatY(int cid) {
		List<Category> listCat = new ArrayList<Category>();
		String sql= "SELECT cid, cname, scid FROM cat WHERE scid= ?";
		return (List<Category>) jdbcTemplate.query(sql, new Object[] {cid}, 
				new ResultSetExtractor<List<Category>>() {

					@Override
					public List<Category> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
						listCat.add(new Category(rs.getInt("cid"), rs.getString("cname"), rs.getInt("scid")));
						}
						return listCat ;
					}
		} ) ;
	}
	public List<Category> getItemDad2(int offset) {
		String sql = "SELECT cid, cname, scid FROM cat WHERE scid = 0 ORDER BY cid DESC LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {offset,PageDefine.ADMIN_ROW_COUNT}, new BeanPropertyRowMapper<Category>(Category.class));
	}
	
	

}
