package rentalbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.datasource.impl.OracleDataSource;
import rentalbook.vo.Favorite;

public class FavoriteDao {

	public boolean save(Favorite newFavorite) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn
					.prepareStatement("INSERT INTO FAVORITES VALUES(FAVORITES_SEQ.NEXTVAL, ?, ?, ?)");
			stmt.setString(1, newFavorite.userId());
			stmt.setInt(2, newFavorite.bookId());
			stmt.setDate(3, newFavorite.createdAt());

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
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM FAVORITES WHERE NO=?");
			stmt.setInt(1, no);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}

	public List<Favorite> findByUserId(String userId) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM FAVORITES WHERE USER_ID=?");
			stmt.setString(1, userId);

			ResultSet rs = stmt.executeQuery();
			List<Favorite> favorites = new ArrayList<>();
			while (rs.next()) {
				// rs.getString("writer_id");
				Favorite one = new Favorite(rs.getInt("no"), rs.getString("user_id"), rs.getInt("book_id"),
						rs.getDate("created_at"));
				favorites.add(one);
			}

			return favorites;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
