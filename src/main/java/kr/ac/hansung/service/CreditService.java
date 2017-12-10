package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.CreditDAO;
import kr.ac.hansung.model.ClassInfo;

@Service
public class CreditService {
	
	@Autowired
	private CreditDAO creditDAO;

	public List<ClassInfo> getTotal() {
		return creditDAO.getTotalCredits();
	}

	public List<ClassInfo> getDetails(int year, int semester) {
		return creditDAO.getDetails(year, semester);
	}

	public List<ClassInfo> getAboutDivision() {
		return creditDAO.getAboutDivision();
	}
}
