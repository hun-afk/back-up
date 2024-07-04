package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.vo.Employee;
import model.vo.Job;
import oracle.jdbc.datasource.impl.OracleDataSource;

public class EmployeeDao {
	public List<Employee> findAll() throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
		ods.setUser("hr");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM EMPLOYEES");

			ResultSet rs = stmt.executeQuery();
			List<Employee> employees = new ArrayList<>();
			while (rs.next()) {
				Employee one = new Employee();
				one.setDepartmentId(rs.getInt("department_id"));
				one.setEmail(rs.getString("email"));
				one.setEmployeeId(rs.getInt("emplyoee_id"));
				one.setFirstName(rs.getString("first_name"));
			}
			return employees;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
