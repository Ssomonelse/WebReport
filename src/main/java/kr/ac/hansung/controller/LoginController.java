package kr.ac.hansung.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String showLogin(@RequestParam(value="error", required=false) String error, 
			@RequestParam(value="logout", required=false) String logout, Model model) {
		
		if(error != null)
			model.addAttribute("errorMsg", "잘못된 ID와 비밀번호 입니다!"); 
		
		if(logout != null)
			model.addAttribute("logoutMsg", "성공적으로 로그아웃을 했습니다!"); 
		
		return "login";
	}
	
	
}
