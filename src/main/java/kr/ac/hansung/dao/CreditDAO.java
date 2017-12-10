package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.ClassInfo;

@Repository
public class CreditDAO {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<ClassInfo> getTotalCredits() {
		String sqlStatement = "select year, semester, sum(credit) from takeclass group by year, semester";
		
		return jdbcTemplate.query(sqlStatement, new RowMapper<ClassInfo>() {

			@Override
			public ClassInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
				ClassInfo classInfo = new ClassInfo();
				classInfo.setYear(rs.getInt("year"));
				classInfo.setSemester(rs.getInt("semester"));
				classInfo.setCredit(rs.getInt("sum(credit)"));
				
				return classInfo;
			}
			
		});
	}

	public List<ClassInfo> getDetails(int year, int semester) {
		String sqlStatement = "select * from takeclass where year=" + year + " and semester=" + semester;
		
		return jdbcTemplate.query(sqlStatement, new RowMapper<ClassInfo>() {

			@Override
			public ClassInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
				ClassInfo classInfo = new ClassInfo();
				classInfo.setYear(rs.getInt("year"));
				classInfo.setSemester(rs.getInt("semester"));
				classInfo.setCourse_id(rs.getString("course_id"));
				classInfo.setTitle(rs.getString("title"));
				classInfo.setDivision(rs.getString("division"));
				classInfo.setCredit(rs.getInt("credit"));
				return classInfo;
			}
			
		});
	}

	public List<ClassInfo> getAboutDivision() {
		String sqlStatement = "select division, sum(credit) from takeclass group by division";
		
		return jdbcTemplate.query(sqlStatement, new RowMapper<ClassInfo>() {

			@Override
			public ClassInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
				ClassInfo classInfo = new ClassInfo();
				classInfo.setDivision(rs.getString("division"));
				classInfo.setCredit(rs.getInt("sum(credit)"));
				
				return classInfo;
			}
			
		});
	}
}
