package kr.ac.kopo.recipe.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Member;
import kr.ac.kopo.recipe.model.Step;
import kr.ac.kopo.recipe.service.CookService;
import kr.ac.kopo.recipe.service.MemberService;

@Controller
@RequestMapping("/cook")
public class CookController {
	@Autowired
	private CookService cookService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/add")
	public String add() {
		return "cook/add";
	}
	
	@PostMapping("/add")
	public String addSubmit(@ModelAttribute Cook cook, HttpSession session) {
	    String userid = (String) session.getAttribute("userid");
	    cookService.addCookWithStep(cook, userid);
	    return "redirect:/cook/list";
	}
	
	@GetMapping("/list")
	String list(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		List<Cook> list = cookService.list();
		
		model.addAttribute("list", list);
		model.addAttribute("userid", userid);

		if (userid != null) {
			Member member = memberService.item(userid);
			model.addAttribute("item", member);
		}
		return "cook/list";
	}
	
	
	@GetMapping("/update/{recipeid}")
	public String update(@PathVariable int recipeid, Model model) {
		Cook item = cookService.item(recipeid);
		List<Step> steps = cookService.getStepsByRecipeid(recipeid); 
		
		model.addAttribute("item",item);
		model.addAttribute("steps", steps);
		
		return "/cook/update";
	}
	
	@PostMapping("/update/{recipeid}")
	public String update(@PathVariable int recipeid, @ModelAttribute Cook item) {
		item.setRecipeid(recipeid);
		
		cookService.update(item, item.getSteps());
		
		return "redirect:/cook/list";
	}
	
	@GetMapping("/delete/{recipeid}")
	public String delete(@PathVariable int recipeid) {
		cookService.delete(recipeid);
		return "redirect:/cook/list";
	}
	
	@GetMapping("/detail/{recipeid}")
	public String detail(@PathVariable("recipeid") int recipeid, Model model) {
	    Cook cookItem = cookService.detail(recipeid);
	    List<Step> steps = cookService.getStepsByRecipeid(recipeid);

	    if (cookItem == null) {
	        return "redirect:/cook/list";
	    }
	    
	    model.addAttribute("item", cookItem);   
	    model.addAttribute("steps", steps);    

	    return "/cook/detail";
	}

		
	@PostMapping("/detail/{recipeid}")
	public String detail(@PathVariable int recipeid, Cook item) {
		cookService.detail(recipeid);
		
		return "redirect:/cook/list";
	}
	
	@GetMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
}
