package vn.edu.vinaenter.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import vn.edu.vinaenter.models.Book;
import vn.edu.vinaenter.models.Category;
import vn.edu.vinaenter.models.Comment;
import vn.edu.vinaenter.models.Contact;
@Repository
public class CmtDAO {
	
	@Autowired 
	private JdbcTemplate jdbcTemplate;
	
	public List<Comment> getItem(int id) {
		List<Comment> listCmt = new ArrayList<>();
		String sql= "SELECT ct.cmtId, ct.cmt_name, ct.id, content, email " + 
				"FROM comments AS ct WHERE ct.id = ?";
		return (List<Comment>) jdbcTemplate.query(sql,  new Object[] {id} ,
				new ResultSetExtractor<List<Comment>>() {

					@Override
					public List<Comment> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listCmt.add(new Comment(rs.getInt("cmtId"), 
									rs.getString("cmt_name"), 
									rs.getString("content"), 
									rs.getInt("id"), 
									rs.getString("email")));
						}
						return listCmt ;
					}
		} ) ;
	}

	public int add(Comment obj, int id) {
		String sql = "INSERT INTO comments(cmt_name, id, content, email) VALUES(?,?,?,?)";
		return  jdbcTemplate.update(sql, obj.getCmt_name(), id, obj.getContent(), obj.getEmail());
		
	}

}
