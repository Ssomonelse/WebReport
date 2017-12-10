package kr.ac.hansung.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.hansung.model.ClassInfo;
import kr.ac.hansung.service.EnrolmentService;

@Controller
public class EnrolmentController {
	
	@Autowired
	private EnrolmentService enrolmentService;
	
	@RequestMapping("/enrolment")
	public String enrollCourse(Model model) {
		
		model.addAttribute("classInfo", new ClassInfo());
		
		return "enrolment";
	}
	
	@RequestMapping("/enroll")
	public String doEnroll(Model model, @Valid ClassInfo classInfo, BindingResult result) {
		
		System.out.println(classInfo);
		
		if(result.hasErrors()) {
			System.out.println("===Form data does not validated");
			List<ObjectError> errors = result.getAllErrors();
			for(ObjectError error:errors) {
				System.out.println(error.getDefaultMessage());
			}
			return "enrolment";
		}
		
		enrolmentService.insert(classInfo);
		
		return "checkEnrolment";
	}
	
	@RequestMapping("/enrolments")
	public String showEnrols(Model model) {
		List<ClassInfo> enrols = enrolmentService.getEnrols();
		model.addAttribute("enrols", enrols);
		
		return "totalEnrols";
	}
	
	
}
