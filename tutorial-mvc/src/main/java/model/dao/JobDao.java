package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.vo.Job;
import oracle.jdbc.datasource.impl.OracleDataSource;

public class JobDao {
	public Job findByJobId(String jobId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("hr");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM JOBS WHERE JOB_ID = ?");
			stmt.setString(1, jobId);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				// rs.getString("writer_id");
				return new Job(rs.getString("job_id"), rs.getString("job_title"), rs.getInt("max_salary"),
						rs.getInt("min_salary"));
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Job> findAll() throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("hr");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM JOBS");

			ResultSet rs = stmt.executeQuery();
			List<Job> jobs = new ArrayList<>();
			while (rs.next()) {
				Job one = new Job(rs.getString("job_id"), rs.getString("job_title"), rs.getInt("max_salary"),
						rs.getInt("min_salary"));
				jobs.add(one);
			}
			return jobs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
