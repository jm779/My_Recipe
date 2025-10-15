package kr.ac.kopo.recipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.recipe.model.Member;
import kr.ac.kopo.recipe.service.MemberService;

@Controller
public class RootController {
	@Autowired
	private MemberService service;
	
	@GetMapping("/")
	String index() {
		return "index";
	}
	
	@GetMapping("/signup")
	String signup() {
		return "member/signup";
	}
	
	@PostMapping("/signup")
	String signup(Member item) {
		service.add(item);
		
		return "redirect:/";
	}
	
	@GetMapping("/login")
	String loginForm() {
		return "member/login";
	}
	
	@PostMapping("/login")
	String login(Member member, HttpSession session, Model model) {
		Member loginMember = service.login(member);
		
		if(loginMember != null) {
			session.setAttribute("userid", loginMember.getUserid());
			session.setAttribute("member", loginMember);		
			return "redirect:/";
		}		
		
		// 로그인 실패 시
		model.addAttribute("loginError", "아이디 또는 비밀번호를 잘못입력하셨습니다. 다시 입력해주세요");
		return "member/login";
	}
	
	
	@GetMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/goadd")
	String goadd() {
		return "redirect:/cook/add";
	}
}
