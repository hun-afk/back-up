package rentalbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.datasource.impl.OracleDataSource;
import rentalbook.vo.Book;

public class BookDao {
	/*
	 * "SELECT * FROM BOOKS WHERE BOOK_ID=?"
	 * 
	 */
	public Book findByBookId(int bookId)throws Exception  {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//43.201.71.108:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOOKS WHERE BOOK_ID=?");
			stmt.setInt(1, bookId);
			ResultSet rs = stmt.executeQuery();
			Book one = null;
			if (rs.next()) {
				/*
				 * (int bookId, int categoryId, String categoryName, String title, 
				 * String publisher, String description, int pages, String imageUrl, int rentalCnt)
				 */
				one = new Book(rs.getInt("book_id"), rs.getInt("category_id"), rs.getString("category_name"),
						rs.getString("title"), rs.getString("publisher"), rs.getString("description"), rs.getInt("pages"), rs.getString("image_url"),
						rs.getInt("rental_cnt"));
			}

			return one;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	/*
	 * "SELECT * FROM BOOKS ORDER BY TITLE ASC" 를 수행할 메서드를 만들거임.
	 */
	public List<Book> findAllOrderByTitle() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//43.201.71.108:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOOKS ORDER BY TITLE ASC");

			ResultSet rs = stmt.executeQuery();
			List<Book> books = new ArrayList<>();
			while (rs.next()) {
				/*
				 * (int bookId, int categoryId, String categoryName, String title, 
				 * String publisher, String description, int pages, String imageUrl, int rentalCnt)
				 */
				Book one = new Book(rs.getInt("book_id"), rs.getInt("category_id"), rs.getString("category_name"),
						rs.getString("title"), rs.getString("publisher"), rs.getString("description"), rs.getInt("pages"), rs.getString("image_url"),
						rs.getInt("rental_cnt"));
				books.add(one);
			}

			return books;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public List<Book> findAllOrderByRentalCnt() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//43.201.71.108:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOOKS ORDER BY RENTAL_CNT DESC");

			ResultSet rs = stmt.executeQuery();
			List<Book> books = new ArrayList<>();
			while (rs.next()) {
				/*
				 * (int bookId, int categoryId, String categoryName, String title, 
				 * String publisher, String description, int pages, String imageUrl, int rentalCnt)
				 */
				Book one = new Book(rs.getInt("book_id"), rs.getInt("category_id"), rs.getString("category_name"),
						rs.getString("title"), rs.getString("publisher"), rs.getString("description"), rs.getInt("pages"), rs.getString("image_url"),
						rs.getInt("rental_cnt"));
				books.add(one);
			}

			return books;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public List<Book> findAllOrderByBookId() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//43.201.71.108:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOOKS ORDER BY BOOK_ID DESC");

			ResultSet rs = stmt.executeQuery();
			List<Book> books = new ArrayList<>();
			while (rs.next()) {
				/*
				 * (int bookId, int categoryId, String categoryName, String title, 
				 * String publisher, String description, int pages, String imageUrl, int rentalCnt)
				 */
				Book one = new Book(rs.getInt("book_id"), rs.getInt("category_id"), rs.getString("category_name"),
						rs.getString("title"), rs.getString("publisher"), rs.getString("description"), rs.getInt("pages"), rs.getString("image_url"),
						rs.getInt("rental_cnt"));
				books.add(one);
			}

			return books;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	
	public boolean increaseRentalCntByNo(int bookId) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//43.201.71.108:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("UPDATE BOOKS SET RENTAL_CNT = RENTAL_CNT + 1 WHERE BOOK_ID=?");
			stmt.setInt(1, bookId);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}

	public boolean decreaseRentalCntByNo(int bookId) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//43.201.71.108:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("UPDATE BOOKS SET RENTAL_CNT = RENTAL_CNT - 1 WHERE BOOK_ID=?");
			stmt.setInt(1, bookId);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}

	
}













