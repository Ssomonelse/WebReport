package kr.ac.hansung.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.EnrolmentDAO;
import kr.ac.hansung.model.ClassInfo;

@Service
public class EnrolmentService {
	
	@Autowired
	private EnrolmentDAO enrolmentDAO;

	public boolean insert(@Valid ClassInfo classInfo) {
		return enrolmentDAO.insert(classInfo);
	}

	public List<ClassInfo> getEnrols() {
		return enrolmentDAO.getEnrols();
	}
}
