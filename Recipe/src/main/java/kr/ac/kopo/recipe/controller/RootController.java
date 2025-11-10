package kr.ac.kopo.recipe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Member;
import kr.ac.kopo.recipe.model.Notice;
import kr.ac.kopo.recipe.service.CookService;
import kr.ac.kopo.recipe.service.MemberService;
import kr.ac.kopo.recipe.service.NoticeService;

@Controller
public class RootController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private CookService cookService;
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/")
	public String index(Model model, HttpSession session) {
	    Member loginMember = (Member) session.getAttribute("member");

	    // 로그인한 사용자 추천 레시피
	    if (loginMember != null) {
	        List<Cook> recommendedList = cookService.getAllRecommendedByUser(loginMember.getUserid());
	        model.addAttribute("recommendedList", recommendedList);
	    }

	    // 전체 추천 레시피 (인기 추천)
	    List<Cook> hotList = cookService.getAllRecommended();
	    model.addAttribute("hotList", hotList);

	    // 공지사항
	    List<Notice> noticeList = noticeService.getAll();
	    model.addAttribute("noticeList", noticeList);

	    // 로그인 사용자 정보
	    model.addAttribute("loginMember", loginMember);

	    return "index";
	}

	
	@GetMapping("/signup")
	String signup() {
		return "member/signup";
	}
	
	@PostMapping("/signup")
	public String signup(Member item, Model model) {
	    service.add(item);
	    model.addAttribute("signupSuccess", "회원가입이 완료되었습니다. 로그인 후 사용해주세요.");
	    return "member/signup";
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
		
		model.addAttribute("loginError", "아이디 또는 비밀번호를 잘못 입력하셨습니다. 다시 입력해주세요");
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
	
	
	@ResponseBody
	@GetMapping("/check_id/{id}")
	String checkId(@PathVariable String id) {
		if(service.checkId(id))
			return "OK";
		
		return "FAIL";
	}
	
	
}
