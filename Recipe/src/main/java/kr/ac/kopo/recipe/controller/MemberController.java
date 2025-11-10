package kr.ac.kopo.recipe.controller;

import java.util.ArrayList;
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
	public String mypage(Member member, Pager pager, Model model, HttpSession session) {
		String userid = (String) session.getAttribute("userid"); 
	    List<Cook> userList = cookService.list(userid);
	    pager.setPerPage(6);

	    // �럹�씠吏� 怨꾩궛
	    int total = userList.size();
	    pager.setTotal(total);

	    int start = (pager.getPage() - 1) * pager.getPerPage();
	    int end = start + pager.getPerPage();
	    if (end > total) {
	        end = total;
	    }

	    List<Cook> pagedList = new ArrayList<>();
	    for (int i = start; i < end; i++) {
	        pagedList.add(userList.get(i));
	    }

	    model.addAttribute("pagedList", pagedList);
	    model.addAttribute("pager", pager);
	    model.addAttribute("userid", member.getUserid());

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
		List<Step> stepList = memberService.listStepsByRecipeid(recipeid);;
		
		model.addAttribute("cookItem", cookItem);  // 요리 정보
	    model.addAttribute("stepItem", stepList);  // 단계 정보
		
		return "/cook/update";
	}
	
	@PostMapping("/update/{recipeid}")
	public String update(@PathVariable int recipeid, Cook item, Step step, @SessionAttribute Member member) {
		item.setRecipeid(recipeid);
		step.setRecipeid(recipeid);
		step.setUserid(member.getUserid()); 
		
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
