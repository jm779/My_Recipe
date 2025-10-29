package kr.ac.kopo.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.kopo.model.Member;
import kr.ac.kopo.service.MemberService;

@Controller
public class RootController {
	
	@Autowired
	MemberService service;
	
	@GetMapping("/")
	String index() {
		return "index";
	}
	
	@GetMapping("/login")
	String login() {
		return "login";
	}
	
	@PostMapping("/login")
	String login(Member member, HttpSession session) {
		if(service.login(member)) {
			session.setAttribute("member", member);
		}
		return "redirect:.";
	}
	
	@GetMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:.";
	}

}
