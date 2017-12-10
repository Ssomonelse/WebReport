package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.ClassInfo;

@Repository
public class EnrolmentDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public boolean insert(@Valid ClassInfo classInfo) {
		String course_id = classInfo.getCourse_id();
		String title = classInfo.getTitle();
		String division = classInfo.getDivision();
		int credit = classInfo.getCredit();
		
		String sqlStatement = "insert into enrollclass (course_id, title, division, credit) values (?, ?, ?, ?)";
		
		return (jdbcTemplate.update(sqlStatement, new Object[] {course_id, title, division, credit}) == 1);
	}

	public List<ClassInfo> getEnrols() {
		String sqlStatement = "select * from enrollclass";
		
		return jdbcTemplate.query(sqlStatement, new RowMapper<ClassInfo>() {

			@Override
			public ClassInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
				ClassInfo classInfo = new ClassInfo();
				classInfo.setCourse_id(rs.getString("course_id"));
				classInfo.setTitle(rs.getString("title"));
				classInfo.setDivision(rs.getString("division"));
				classInfo.setCredit(rs.getInt("credit"));
				
				return classInfo;
			}
			
		});
	}
	
	
}
