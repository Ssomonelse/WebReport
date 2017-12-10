package kr.ac.hansung.model;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Range;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ClassInfo {
	private int year;
	private int semester;
	
	@NotEmpty(message="과목 코드를 입력해주세요.")
	private String course_id;
	
	@NotEmpty(message="과목명을 입력해주세요.")
	private String title;
	
	@NotEmpty(message="과목 구분을 입력해주세요.")
	private String division;
	
	@Range(min=1, max=3, message="모든 과목은 1학점에서 3학점 사이입니다.")
	private int credit;
}
