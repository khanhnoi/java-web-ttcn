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
import vn.edu.vinaenter.models.Contact;

@Repository
public class ContactDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int countItems() {
		String sql = "SELECT COUNT(*) AS totalRow  "
				+ "FROM contacts ";
		return jdbcTemplate.queryForObject(sql,Integer.class );
	}

	public List<Contact> getItemsPagination(int offset) {
		List<Contact> listContact = new ArrayList<>();
		String sql = "SELECT id, name, email,phone, address, subject, content, active FROM contacts ORDER BY id LIMIT ?,?";
		
		return (List<Contact>) jdbcTemplate.query(sql, new Object[] {offset ,PageDefine.ADMIN_ROW_COUNT}, 
				new ResultSetExtractor<List<Contact>>() {

					@Override
					public List<Contact> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listContact.add(new Contact(rs.getInt("id"),
									rs.getString("name"),
									rs.getString("email"),
									rs.getString("phone"),
									rs.getString("address"),
									rs.getString("subject"), 
									rs.getString("content"),
									rs.getInt("active")));
							
						}
						return listContact;
					}
		});
	}

	public Contact getItem(int id) {
		String sql=" SELECT id, name, email,phone, address, subject, content, active FROM contacts WHERE id=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Contact>(Contact.class));
	}

	public int editActive(Contact contact) {
String sql = " UPDATE contacts SET active=? WHERE id=?";
		
		return jdbcTemplate.update(sql, new Object[] {contact.getActive(), contact.getId()});
	}

	public int editItem(Contact objContact) {
		String sql = " UPDATE contacts SET name=?, email=?, phone=?, address=?, subject=?, content=?,active=?  WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {objContact.getName(),
				objContact.getEmail(),
				objContact.getPhone(),
				objContact.getAddress(),
				objContact.getSubject(),
				objContact.getContent(),
				objContact.getActive(),
				objContact.getId()});
	}

	public int delItem(int id) {
		String sql = "DELETE FROM contacts WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}

	public int delAll() {
		String sql = "DELETE FROM contacts WHERE active=0";
		return jdbcTemplate.update(sql, new Object[] {});
	}

	public void add(Contact obj) {
		String sql = "INSERT INTO contacts(name, email,phone ,address, subject, content) VALUES(?,?,?,?,?,?)";
		jdbcTemplate.update(sql, obj.getName(), obj.getEmail(), obj.getPhone(), obj.getAddress(), obj.getSubject(), obj.getContent());
		
	}

}
