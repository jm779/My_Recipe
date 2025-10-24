package kr.ac.kopo.recipe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Member;
import kr.ac.kopo.recipe.model.Step;
import kr.ac.kopo.recipe.pager.Pager;
import kr.ac.kopo.recipe.service.CookService;
import kr.ac.kopo.recipe.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CookService cookService;

	@GetMapping("/list")
	public String list(@SessionAttribute Member member) {
		return "member/list";
	}
	     
	
	@GetMapping("/mypage")
	public String mypage(@SessionAttribute Member member, Pager pager, Model model) {
		List<Cook> list = memberService.list(pager);
		model.addAttribute("list", list);

	    return "member/mypage";
	}

	
	@GetMapping("/detail/{recipeid}")
	public String detail(@PathVariable int recipeid, Model model) {
		Cook cookItem = memberService.detail(recipeid);
		
		if(cookItem == null) {
			return  "redirect:/cook/list";
		}
		model.addAttribute("item", cookItem);
		return "/cook/detail";
	}
		
	@PostMapping("/detail/{recipeid}")
	public String detail(@PathVariable int recipeid, Cook item) {
		memberService.detail(recipeid);
		
		return "redirect:/cook/list";
	}
	
	@GetMapping("/update/{recipeid}")
	public String update(@PathVariable int recipeid, Model model) {
		Cook cookItem = memberService.item(recipeid);
		Step stepItem = memberService.getStepByRecipeid(recipeid);
		
		//Member item = memberService.item(recipeid);
		model.addAttribute("item", cookItem);
		model.addAttribute("item", stepItem);
		
		return "/cook/update";
	}
	
	@PostMapping("/update/{recipeid}")
	public String update(@PathVariable int recipeid, Cook item, Step step) {
		item.setRecipeid(recipeid);
		step.setRecipeid(recipeid);
		memberService.update(item, step);
		
		return "redirect:/cook/list" + recipeid;
	}
	
	@GetMapping("/delete/{recipeid}")
	public String delete(@PathVariable int recipeid) {
		cookService.delete(recipeid);
		return "redirect:/member/mypage";
	}

	@GetMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	
}
