package kr.ac.hansung.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.hansung.model.ClassInfo;
import kr.ac.hansung.service.CreditService;

@Controller
public class CreditController {
	
	@Autowired
	private CreditService creditService;
	
	@RequestMapping("/totalcredits")
	public String showTotalCredits(Model model) {
		List<ClassInfo> credits = creditService.getTotal();
		model.addAttribute("totalcredits", credits);
		
		return "totalcredits";
	}
	
	@RequestMapping("/detailClasses")
	public String showDetail(@RequestParam(value="year", required=true)int year, 
			@RequestParam(value="semester", required=true)int semester, Model model) {
		
		List<ClassInfo> details = creditService.getDetails(year, semester);
		model.addAttribute("details", details);
		
		return "detailclasses";
	}
	
	@RequestMapping("/aboutDivision")
	public String showDivision(Model model) {
		List<ClassInfo> division = creditService.getAboutDivision();
		model.addAttribute("divInfo", division);
		
		return "aboutDivision";
	}
}
