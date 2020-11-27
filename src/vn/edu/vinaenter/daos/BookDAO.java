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
public class BookDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int countItems() {
		String sql = "SELECT COUNT(*) AS totalRow  "
				+ "FROM books WHERE active = 1 ";
		return jdbcTemplate.queryForObject(sql,Integer.class );
	}

	public List<Book> getItemsPagination(int offset) {
		List<Book> listBook = new ArrayList<>();
		String sql = "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active "
				+ "FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid ORDER BY id DESC LIMIT ?,?";
		
		return (List<Book>) jdbcTemplate.query(sql, new Object[] {offset, PageDefine.PUBLIC_ROW_COUNT},  
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}
	
	public List<Book> getItemsPagination1(int offset) {
		List<Book> listBook = new ArrayList<>();
		String sql = "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active,detailpicture1, detailpicture2  "
				+ "FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid ORDER BY id DESC LIMIT ?,?";
		
		return (List<Book>) jdbcTemplate.query(sql, new Object[] {offset, PageDefine.ADMIN_ROW_COUNT},  
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"), 
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname")), 
									rs.getString("detailpicture1"), 
									rs.getString("detailpicture2")));
						}
						return listBook ;
					}
		} ) ;
	}
	
	public int countItemsSearch(String search) {
		String sql = "SELECT COUNT(*) AS totalRow  "
				+ "FROM books WHERE name LIKE ? ";
		return jdbcTemplate.queryForObject(sql,new Object[] {"%" + search + "%"},Integer.class );
	}

	public List<Book> getSearch(String search, int offset) {
		List<Book> listBook = new ArrayList<>();
		String sql = "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active "
				+ "FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE name LIKE ? ORDER BY id DESC  LIMIT ?,?";
		
		return (List<Book>) jdbcTemplate.query(sql, new Object[] {"%" + search + "%",offset, PageDefine.ADMIN_ROW_COUNT},  
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}

	public int addItem(Book objBook) {
		String sql = "INSERT INTO books(name,price,author,detail,picture,amount,cid, detailpicture1, detailpicture2) VALUES (?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {objBook.getName(),
				objBook.getPrice(),
				objBook.getAuthor(),
				objBook.getDetail(),
				objBook.getPicture(),
				objBook.getAmount(),
				objBook.getCat().getCid(),
				objBook.getDetailpicture1(),
				objBook.getDetailpicture2()});
	}

	public Book getItems(int id) {
		String sql= "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active "  
							+ "FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE id=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Book>(Book.class));
	}

	public Category getCat(int id) {
		String sql= "SELECT cname, c.cid "
				+ "FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE b.id=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Category>(Category.class));
	}

	public int editItem(Book objBook) {
		String sql = "UPDATE books SET name=?, price=?, author=?, detail=?, picture=?,detailpicture1=?, detailpicture2=?, cid=? WHERE id=? ";
		return jdbcTemplate.update(sql, new Object[] {objBook.getName(),
				objBook.getPrice(),
				objBook.getAuthor(),
				objBook.getDetail(),
				objBook.getPicture(),
				objBook.getDetailpicture1(),
				objBook.getDetailpicture2(),
				objBook.getCat().getCid(),
				objBook.getId()});
	}

	public int delItem(int id) {
		String sql = "DELETE FROM books WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}

	public int editActive(Book books) {
		String sql = " UPDATE books SET active=? WHERE id=?";
		System.out.println("id : "+books.getId() + "active : "+books.getActive());
		return jdbcTemplate.update(sql, new Object[] {books.getActive(), books.getId()});
	}

	public List<Book> getBookCD() {
		List<Book> listBook = new ArrayList<>();
		String sql = "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active "
				+ "FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid  LIMIT 10 ";
		
		return (List<Book>) jdbcTemplate.query(sql,   
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}

	public Book getHot1() {
		String sql= "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active " + 
				"FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid ORDER BY SUM(likes+love) DESC LIMIT 1";
		return jdbcTemplate.queryForObject(sql,  new BeanPropertyRowMapper<Book>(Book.class));
	}

	public List<Book> getListHot(int i) {
		List<Book> listBook = new ArrayList<>();
		String sql= "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active " + 
				"FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE id != ? ORDER BY likes DESC LIMIT 7";
		return (List<Book>) jdbcTemplate.query(sql, new Object[] {i},  
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}

	public List<Book> getNew() {
		List<Book> listBook = new ArrayList<>();
		String sql= "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active " + 
				"FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid ORDER BY id DESC LIMIT 4";
		return (List<Book>) jdbcTemplate.query(sql,   
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}

	public Book getBook(int id) {
		String sql= "SELECT id, name, price, author, detail, picture,detailpicture1, detailpicture2, likes, amount, love, view, c.cid, c.cname,c.scid, active " + 
				"FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE id=?";
		try {
			return jdbcTemplate.query(sql, new Object[] { id }, new ResultSetExtractor<Book>() {

				@Override
				public Book extractData(ResultSet rs) throws SQLException, DataAccessException {
					Book pro = null;
					if (rs.next()) {
						pro = new Book(rs.getInt("id"), 
								rs.getString("name"), 
								rs.getDouble("price"), 
								rs.getString("author"), 
								rs.getString("detail"), 
								rs.getString("picture"), 
								rs.getInt("likes"), 
								rs.getInt("amount"), 
								rs.getInt("love"), 
								rs.getInt("active"), 
								rs.getInt("view"), 
								new Category(rs.getInt("cid"), rs.getString("cname"), rs.getInt("scid")), 
								rs.getString("detailpicture1"), 
								rs.getString("detailpicture2")) ;
					}
					return pro;
				}
			});
		} catch (Exception e) {
			return null;
		}
	}

	public int increaseView(Book objBook) {
		String sql = "UPDATE books SET  view= view+1 WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {objBook.getId()});
		
	}

	public int countItems(int cid) {
		String sql = "SELECT COUNT(*) AS totalRow  "
				+ "FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE c.cid=? OR c.scid = ? ";
		return jdbcTemplate.queryForObject(sql,new Object[] {cid,cid},Integer.class );
	}

	public List<Book> getItem(Category cat, int offset) {
		List<Book> listBook = new ArrayList<>();
		String sql= "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active " + 
				"FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE active = 1 AND  b.cid = ? OR b.cid = ? LIMIT ?,?";
		return (List<Book>) jdbcTemplate.query(sql, new Object[] {cat.getCid(), cat.getScid(), offset, PageDefine.PUBLIC_ROW_CAT},  
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}

	public List<Book> getItems(int cid, int offset) {
		List<Book> listBook = new ArrayList<>();
		String sql= "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active " + 
				"FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE b.cid = ? AND active =1  LIMIT ?,?";
		return (List<Book>) jdbcTemplate.query(sql, new Object[] {cid, offset, PageDefine.PUBLIC_ROW_CAT},  
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}

	public List<Book> getAll(int offset) {
		List<Book> listBook = new ArrayList<>();
		String sql= "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active " + 
				"FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE active = 1 ORDER BY id DESC  LIMIT ?,?";
		return (List<Book>) jdbcTemplate.query(sql, new Object[] {offset, PageDefine.PUBLIC_ROW},  
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}
	public List<Book> getSearch1(String search, int offset) {
		List<Book> listBook = new ArrayList<>();
		String sql = "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active "
				+ "FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE name LIKE ? ORDER BY id DESC  LIMIT ?,?";
		
		return (List<Book>) jdbcTemplate.query(sql, new Object[] {"%" + search + "%",offset, PageDefine.PUBLIC_ROW},  
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}

	public List<Book> getPopular() {
		List<Book> listBook = new ArrayList<>();
		String sql = "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active "
				+ "FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid ORDER BY view DESC LIMIT 4 ";
		
		return (List<Book>) jdbcTemplate.query(sql, 
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}

	public List<Book> getFeatured() {
		List<Book> listBook = new ArrayList<>();
		String sql = "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active "
				+ "FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid ORDER BY likes DESC LIMIT 4 ";
		
		return (List<Book>) jdbcTemplate.query(sql, 
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}

	public List<Book> getItem(int cid, int offset) {
		List<Book> listBook = new ArrayList<>();
		String sql= "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active " + 
				"FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE active = 1 AND  c.cid = ? OR c.scid = ? LIMIT ?,?";
		return (List<Book>) jdbcTemplate.query(sql, new Object[] {cid, cid, offset, PageDefine.PUBLIC_ROW_CAT},  
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}

	public List<Book> getItem(int cid, int offset, Integer row) {
		List<Book> listBook = new ArrayList<>();
		String sql= "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active " + 
				"FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE active = 1 AND  c.cid = ? OR c.scid = ? LIMIT ?,?";
		return (List<Book>) jdbcTemplate.query(sql, new Object[] {cid, cid, offset, row},  
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}

	public List<Book> getRelated(Book obj) {
		List<Book> listBook = new ArrayList<>();
		String sql= "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active " + 
				"FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE active = 1 AND  b.cid = ? AND id!=? ";
		return (List<Book>) jdbcTemplate.query(sql, new Object[] {obj.getCat().getCid(), obj.getId() },  
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}

	public List<Book> getRelated(Category cat, int id) {
		List<Book> listBook = new ArrayList<>();
		String sql= "SELECT id, name, price, author, detail, picture, likes, amount, love, view, c.cid, c.cname, active " + 
				"FROM books AS b INNER JOIN cat AS c ON b.cid = c.cid WHERE active = 1 AND  b.cid = ? AND id!=? ";
		return (List<Book>) jdbcTemplate.query(sql, new Object[] {cat.getCid(), id },  
				new ResultSetExtractor<List<Book>>() {

					@Override
					public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listBook.add(new Book(rs.getInt("id"),
									rs.getString("name"), 
									rs.getDouble("price"), 
									rs.getString("author"), 
									rs.getString("detail"), 
									rs.getString("picture"), 
									rs.getInt("likes"), 
									rs.getInt("amount"), 
									rs.getInt("love"), 
									rs.getInt("active"), 
									rs.getInt("view"), 
									new Category(rs.getInt("cid"), rs.getString("cname"))));
						}
						return listBook ;
					}
		} ) ;
	}

	public int increLove(Book books) {
		String sql = "UPDATE books SET  love= love+1 WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {books.getId()});
	}

	public int increLike(Book books) {
		String sql = "UPDATE books SET  likes= likes+1 WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {books.getId()});
	}

	public int increDLike(Book books) {
		String sql = "UPDATE books SET  likes= likes-1 WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {books.getId()});
	}
	public Book getItemsPr(int id) {
		String sql= "SELECT id, name, price, author, detail, picture, likes, amount, love, view active "  
							+ "FROM books WHERE id=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Book>(Book.class));
	}

	public void editAmount(int pro_id, int reamount) {
		String sql ="UPDATE books SET  amount= ? WHERE id=? ";
		jdbcTemplate.update(sql, new Object[] {reamount, pro_id});
		
	}
	
}
