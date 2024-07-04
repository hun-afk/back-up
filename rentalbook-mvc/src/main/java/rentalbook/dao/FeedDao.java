package rentalbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.datasource.impl.OracleDataSource;
import rentalbook.vo.Feed;

public class FeedDao {

	/*
	 * "INSERT INTO FEEDS VALUES(FEEDS_SEQ.NEXTVAL, ?, ?, ?, ?, ?)" 를 수행할 메서드를 만드려고
	 * 함.
	 */
	public boolean save(Feed newFeed) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn
					.prepareStatement("INSERT INTO FEEDS VALUES(FEEDS_SEQ.NEXTVAL, ?, ?, ?, ?, ?)");
			stmt.setString(1, newFeed.writerId());
			stmt.setString(2, newFeed.title());
			stmt.setString(3, newFeed.body());
			stmt.setDate(4, newFeed.writedAt());
			stmt.setInt(5, newFeed.readCnt());

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	/*
	 * "SELECT * FROM FEEDS WHERE NO = ?" 를 수행할 메서드를 만들거임.
	 */
	public Feed findByNo(int no) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM FEEDS WHERE NO = ?");
			stmt.setInt(1, no);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				// rs.getString("writer_id");
				return new Feed(rs.getInt("no"), rs.getString("writer_id"), rs.getString("title"), rs.getString("body"),
						rs.getDate("writed_at"), rs.getInt("read_cnt"));
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	/*
	 * "SELECT * FROM FEEDS ORDER BY WRITED_AT DESC" 를 수행할 메서드를 만들거임.
	 */
	public List<Feed> findByCategoryIdOrderBy(int categoryId, String column) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			String sql = "SELECT * FROM FEEDS";
			
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM FEEDS ORDER BY WRITED_AT DESC");

			ResultSet rs = stmt.executeQuery();
			List<Feed> feeds = new ArrayList<>();
			while (rs.next()) {
				// rs.getString("writer_id");
				Feed one = new Feed(rs.getInt("no"), rs.getString("writer_id"), rs.getString("title"),
						rs.getString("body"), rs.getDate("writed_at"), rs.getInt("read_cnt"));
				feeds.add(one);
			}

			return feeds;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	
	
	public List<Feed> findAll() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM FEEDS ORDER BY WRITED_AT DESC");

			ResultSet rs = stmt.executeQuery();
			List<Feed> feeds = new ArrayList<>();
			while (rs.next()) {
				// rs.getString("writer_id");
				Feed one = new Feed(rs.getInt("no"), rs.getString("writer_id"), rs.getString("title"),
						rs.getString("body"), rs.getDate("writed_at"), rs.getInt("read_cnt"));
				feeds.add(one);
			}

			return feeds;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public List<Feed> findByWriterId(String writerId) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn
					.prepareStatement("SELECT * FROM FEEDS WHERE WRITER_ID=? ORDER BY WRITED_AT DESC");
			stmt.setString(1, writerId);

			ResultSet rs = stmt.executeQuery();
			List<Feed> feeds = new ArrayList<>();
			while (rs.next()) {
				// rs.getString("writer_id");
				Feed one = new Feed(rs.getInt("no"), rs.getString("writer_id"), rs.getString("title"),
						rs.getString("body"), rs.getDate("writed_at"), rs.getInt("read_cnt"));
				feeds.add(one);
			}

			return feeds;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public boolean setNullToWriterIdByNo(int no) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("UPDATE FEEDS SET WRITER_ID=NULL WHERE NO=?");
			stmt.setInt(1, no);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}

	public boolean increaseReadCntByNo(int no) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("UPDATE FEEDS SET READ_CNT=READ_CNT+1 WHERE NO=?");
			stmt.setInt(1, no);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}

	public boolean deleteByNo(int no) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM FEEDS WHERE NO=?");
			stmt.setInt(1, no);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}
	
	
	public boolean updateTitleAndBody(Feed feed) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("UPDATE FEEDS SET TITLE=? , BODY=? WHERE NO =?");

			stmt.setString(1, feed.title());
			stmt.setString(2,feed.body());
			stmt.setInt(3,feed.no());
			
			
			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
}